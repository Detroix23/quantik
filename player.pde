/**
 * Player class. Handle player game and interactions.
 */
final class Player {
  int id;
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
  public void draw() {
    // Draw `selected_piece`.
    textSize(20);
    fill(200, 200, 200);
    
    text(
      "Player 1",
      this.app.board.draw_size.x + 20,
      40
    );

    text(
      String.format("- Selected: %d", this.selected_piece),
      this.app.board.draw_size.x + 20,
      60
    );
  }
  
  /**
   * Emulation of a mouse click on `position`.
   * Update `app.board.current_tile`.
   * Return the clicked board tile.
   */
  public Size click(Size position) {
    Size tile = app.board.getTileOn(position.x, position.y);
    
    if (tile.x == -1 && tile.y == -1) { 
      return tile;
    }
    
    app.board.table[tile.y][tile.x] = this.selected_piece;
    
    // Log
    this.app.logger.newPlay(new Play(
      this.id, 
      this.selected_piece, 
      tile
    ));
    println(
      "player.Player.click - Updated tile (x, y):", position.x, position.y, 
      ", to piece:", this.selected_piece
    );
    
    // End.
    app.board.current_tile = tile;

    return tile;
  }
  
  /**
   * From input ASCII `code`, update the current select piece.
   * Use numbers 0 to 4.
   * Return the newly selected piece, or -1 if not a piece.
   */
  public int selectedPieceFromAscii(int code) {
    final int first_code = 48;
    final int pieces = 8;
    if (code < first_code || code > (first_code + pieces)) {
      return -1;
    }
    
    this.selected_piece = code - first_code;
    println("player.Player.selectedPieceFromAscii - New piece:", this.selected_piece);
    
    return this.selected_piece;
  }
}
