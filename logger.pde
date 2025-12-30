/**
 * Structure storing information about 1 turn.
 */
final public class Play {
  int player_id;
  int piece;
  Size position;

  public Play(int player_id, int piece, Size position) {
    this.player_id = player_id;
    this.piece = piece;
    this.position = position;
  }

  public String toString() {
    return String.format("Play(%d, %d, %s)", this.player_id, this.piece, this.position.toString());
  }
}

/**
 * Take care of logging the game.
 * Used in `app`.
 */
final public class Logger {
  App app;
  ArrayList<Play> plays;

  public Logger(App app) {
    this.app = app;
    this.plays = new ArrayList<Play>();
  }

  /**
   * Append a `Play` to the history.
   */
  public void newPlay(Play play) {
    this.plays.add(play);
  }

  /**
   * Draw up to `records` number of lines, starting from top. 
   * 0 `records` prints all the history.
   */
  public void drawHistory(int records, Size position) {
    textSize(20);

    text(
      String.format("History(%d):",this.plays.size()),
      this.app.board.draw_size.x + position.x,
      position.y
    );

    if (records == 0) {
      records = this.plays.size();
    }

    for (
      int index = this.plays.size() - 1; 
      index >= 0 && index >= (this.plays.size() - records);
      index--
    ) {
      final Play play = this.plays.get(index); 
      text(
        String.format("%d: %s", index, play.toString()),
        this.app.board.draw_size.x + position.x,
        position.y + 20 * (this.plays.size() - index)
      );
    }
    
    return;
  }
}