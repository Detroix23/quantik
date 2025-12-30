/**
 * Referee class. Enforce the rules.
 */
final public class Referee {
  App app;

  public Referee(App app) {
    this.app = app;
  }

  public int getOne() {
    return 1;
  }

  /**
   * Return `true` if the piece played is the same that the current one.
   */
  public boolean isUselessPlay(Piece new_piece, Size tile) {
    Piece current = this.app.board.table[tile.y][tile.x];

    return (new_piece.getPlayerId() == current.getPlayerId() && new_piece.getCode() == current.getCode());
  }

  /**
   * Returns `true` if `new_piece` is tried to place on a line, column or square that contains the same type of piece by another player.
   */
  public boolean isIllegalPlay(Piece new_piece, Size tile) {
    return (
      samePieceFromDifferentPlayer(new_piece, this.app.board.getColumn(tile.x))
      || samePieceFromDifferentPlayer(new_piece, this.app.board.getLine(tile.y))
      || samePieceFromDifferentPlayer(new_piece, this.app.board.getSquare(tile))
    );
  }

  public boolean isWinning(Size tile) {
    return (
      isPieceArrayWinning(this.app.board.getColumn(tile.x))
      || isPieceArrayWinning(this.app.board.getLine(tile.y))
      || isPieceArrayWinning(this.app.board.getSquare(tile))
    );
  }

  /**
   * Return `true` if the `Piece` on `tile` is not neutral, empty.
   */
  public boolean isTileOccupied(Size tile) {
    return !this.app.board.table[tile.y][tile.x].isNeutral();
  }
}

/**
 * Returns `true` if a `piece` with the same code but from any other player is in the `array`.
 */
private boolean samePieceFromDifferentPlayer(Piece piece, Piece[] array) {
  boolean matching = false;
  int index = 0;
  while (index < array.length && !matching) {
    if (array[index].player_id != piece.player_id && array[index].code == piece.code) {
      matching = true;
    }
    index++;
  }

  return matching;
}

/**
 * Returns `true` if all `Piece`s from the array contains all piece, whatever the player, one time. 
 */
private boolean isPieceArrayWinning(Piece[] array) {
  var seen = new ArrayList();
  int index = 0;
  boolean distinct = true;
  while (index < array.length && distinct) {
    int code = array[index].getCode();
    if (seen.contains(code)) {
      distinct = false;
    } else if (code != 0) {
      seen.add(code);
    }
    index++;
  }
  
  return seen.size() == 4;
}