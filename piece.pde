//! # Quantik.
//! Pieces.

/**
 * # Piece.
 * Fields:
 * - int `player_id`: Final ID of the player. 0 is neutral.
 * - int `code`: ID of the actual piece. 0 is void.
 */
public final class Piece {
  final private int player_id;
  final private int code;

  public Piece(int player_id, int code) {
    this.player_id = player_id;
    this.code = code;
  }

  public int getPlayerId() {
    return this.player_id;
  }

  public int getCode() {
    return this.code;
  }
  
  public String toString() {
    return String.format("Piece(player_id: %d, code: %d)", this.player_id, this.code);
  }

  /**
   * Return `true` if `this` is neutral, that is of `player_id` = 0, and `code` = 0.
   */
  public boolean isNeutral() {
    return (this.player_id == 0 && this.code == 0);
  }
}

/**
 * Initialize a new empty board, filled with "void `Pieces`" (`Piece(0, 0)`) 
 */
public Piece[][] initializeEmptyBoard(Size size) {
  Piece[][] board = new Piece[size.y][size.x];

  for (int y = 0; y < size.y; y++) {
    for (int x = 0; x < size.x; x++) {
      board[y][x] = new Piece(0, 0);
    }
  }

  return board;
}
