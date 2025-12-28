
/**
 * Size class, containing a 2D rectangle.
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
}

/**
 * Return if the given `size` is (-1; -1)
 */
public boolean isUnsized(Size size) {
  return size.x == -1 && size.y == -1;
}

