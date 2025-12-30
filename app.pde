/**
 * App class. Hold the whole game and all linked applications.
 * Fixed size: 4 by 4;
 * Pieces are `int`: 0 (Empty), 1, 2, 3, 4 (Player 1), 5, 6, 7, 8 (Player 2);
 *   Thus, pieces are congruent.
 */
final class App {
  Board board;
  Player[] players;
  Logger logger;
  GameLoop game_loop;
  Referee referee;


  public App(Size draw_size) {
    this.board = new Board(this, draw_size);
    this.logger = new Logger(this);
    this.players = new Player[]{
      new Player(this, 1),
      new Player(this, 2),
    };
    this.game_loop = new GameLoop(this);
    this.referee = new Referee(this);
  }

  /**
   * General draw function for `App`.
   */
  public void draw() {
    if (!this.board.current_tile.isNone()) {
      this.board.highlightColumn(this.board.current_tile);
      this.board.highlightLine(this.board.current_tile);
      this.board.highlightTile(this.board.current_tile, color(240, 240, 240));
    }
    this.board.draw();
    this.game_loop.draw(new Size(20, 25));
    for (Player player: this.players) {
      player.draw(new Size(20, 50));
    }
    this.logger.drawHistory(5, new Size(20, 180));
  }
}
