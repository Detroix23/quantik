/**
 * Player class. Handle player game and interactions.
 */
final class Player {
  final int id;
  App app;
  int selected_piece;
  
  public Player(App app, int id) {
    this.app = app;
    this.id = id;
    this.selected_piece = 0;  
  }
  
  /**
   * Draw all the UI for useful information about the player.
   */
  public void draw(Size position) {
    // Draw `selected_piece`.
    int height_shift = (this.id - 1) * 50;
    textSize(20);
    fill(200, 200, 200);
    
    text(
      String.format("Player %d", this.id),
      this.app.board.draw_size.x + position.x,
      position.y + height_shift
    );

    text(
      String.format("- Selected: %d", this.selected_piece),
      this.app.board.draw_size.x + position.x,
      position.y + 20 + height_shift
    );
  }
  
  /**
   * Emulation of a mouse click on `position`.
   * Update `app.board.current_tile`.
   * Return the clicked board tile.
   */
  public Size click(Size position) {
    Size tile = this.app.board.getTileOn(position.x, position.y);
    if (tile.isNone()) { 
      return tile;
    }
    Piece new_piece = this.selected_piece == 0 
      ? new Piece(0, 0) 
      : new Piece(this.id, this.selected_piece);

    // Verifications.
    if (this.app.referee.isTileOccupied(tile)) {
      println(String.format("player.Player.click - Tile occupied on %s.", tile.toString()));

    } else if (this.app.referee.isUselessPlay(new_piece, tile)) {
      println(String.format("player.Player.click - Useless play of %s on %s.", new_piece.toString(), tile.toString()));
    
    } else if (this.app.referee.isIllegalPlay(new_piece, tile)) {
      println(String.format("player.Player.click - Illegal play of %s on %s.", new_piece.toString(), tile.toString()));
      
    } else {
      // Update board.
      this.app.board.table[tile.y][tile.x] = new_piece;

      // Log.
      this.app.logger.newPlay(new Play(
        this.id, 
        this.selected_piece, 
        tile
      ));
      println(
        "player.Player.click - Updated tile (x, y):", position.x, position.y, 
        ", to piece:", this.selected_piece
      );

      app.board.current_tile = tile;

      if (this.app.referee.isWinning(tile)) {
        println("\n*******\nWIN from player", this.id);
      } else {
        app.game_loop.turnPass();
      }
    }

    return tile;
  }
  
  /**
   * From input ASCII `code`, update the current select piece.
   * Use numbers 0 to 4.
   * Return the newly selected piece, or -1 if not a piece.
   */
  public int selectedPieceFromAscii(int code) {
    final int first_code = 48;
    final int pieces = 4;
    if (code < first_code || code > (first_code + pieces)) {
      return -1;
    }
    
    this.selected_piece = code - first_code;
    println("player.Player.selectedPieceFromAscii - New piece:", this.selected_piece);
    
    return this.selected_piece;
  }
}
