/**
 * App class. Hold the whole game and all linked applications.
 * Fixed size: 4 by 4;
 * Pieces are `int`: 0 (Empty), 1, 2, 3, 4 (Player 1), 5, 6, 7, 8 (Player 2);
 *   Thus, pieces are congruent.
 */
final class App {
  Board board;
  Player player;
  Logger logger;

  public App(Size draw_size) {
    this.board = new Board(this, draw_size);
    this.logger = new Logger(this);
    this.player = new Player(this, 1);
  }

  /**
   * General draw function for `App`.
   */
  public void draw() {
    // Test.
    if (!isUnsized(this.board.current_tile)) {
      this.board.highlightColumn(this.board.current_tile);
      this.board.highlightLine(this.board.current_tile);
    }

    this.board.highlightTile(this.board.current_tile, color(240, 240, 240));
    this.board.draw();
    this.player.draw();
    this.logger.drawHistory(5);
  }
}
