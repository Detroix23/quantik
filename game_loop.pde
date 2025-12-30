//! # Quantik.
//! Game loop.

public final class GameLoop {
  App app;
  int turn;
  Player current_player;
  

  public GameLoop(App app) {
    this.app = app;
    this.turn = 0;
    this.current_player = this.app.players[0];
  }

  /**
   * Make a turn pass. Increase the `turn` counter and update the `current_player`.
   */
  public void turnPass() {
    this.turn++;
    this.current_player = this.app.players[this.turn % this.app.players.length];
  }

  public void draw(Size position) {
    textSize(20);
    text(
      String.format("Turn %d. Player %d plays.", this.turn, this.current_player.id),
      this.app.board.draw_size.x + position.x,
      position.y
    );
  }
} 