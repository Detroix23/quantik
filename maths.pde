
/**
 * Size class, containing a 2D rectangle.
 */
class Size {
  int x;
  int y;
  
  public Size(int x, int y) {
    this.x = x;
    this.y = y;
  }

  public String toString() {
    return String.format("Size(%d, %d)", this.x, this.y);
  }
}
