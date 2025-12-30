
/**
 * Size class, containing a 2D rectangle.
 * None is (-1; -1).
 */
final public class Size {
  int x;
  int y;
  
  public Size(int x, int y) {
    this.x = x;
    this.y = y;
  }

  public String toString() {
    return String.format("Size(%d, %d)", this.x, this.y);
  }

  /**
   * Return if the given `size` is (-1; -1)
   */
  public boolean isNone() {
    return this.x == -1 && this.y == -1;
  }
}

