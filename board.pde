/**
 * Board class. Hold the 2D grid of the game.
 * Holds also the game board drawer.
 */
final public class Board {
  App app;
  Size size;
  int[][] table;
  color lines_color;
  color piece_color;
  Size draw_size;
  int text_size;
  Size current_tile;

  public Board(App app, Size draw_size) {
    this.app = app;
    this.size = new Size(4, 4);
    this.table = new int[][]{
      {0, 0, 0, 0},
      {0, 0, 0, 0},
      {0, 0, 0, 0},
      {0, 0, 0, 0},
    };
    this.draw_size = draw_size;
    this.lines_color = color(100, 100, 100);
    this.piece_color = color(12, 100, 100);
    this.text_size = 67;
    this.current_tile = new Size(-1, -1);
  }
  
  public void draw() {
    // Grid.
    stroke(this.lines_color);
    strokeWeight(8);
    
    for (int x = 0; x <= this.draw_size.x; x += this.draw_size.x / this.size.x) {
      line(x, 0, x, this.draw_size.y);      
    }
    
    for (int y = 0; y <= this.draw_size.y; y += this.draw_size.y / this.size.y) {
      line(0, y, this.draw_size.x, y);      
    }
    
    // Pieces.
    textSize(this.text_size);
    fill(0, 140, 240);
    
    for (int y = 0; y < this.size.y; y++) {
      for (int x = 0; x < this.size.x; x++) {
        drawNumber(
          this.table[y][x],
          new Size(
            (int) ((x + 0.4) * (this.draw_size.x / this.size.x)),
            (int) ((y + 0.6) * (this.draw_size.y / this.size.y))
          )
        );
      } 
    }
  }
  

  /**
   * Get the array-like coordinate of the tile where the on-screen cordinates couple (x; y) is.
   * (-1; -1) is the escape value.
   */ 
  public Size getTileOn(int x, int y) { 
    if (
      x > this.draw_size.x 
      || x < 0
      || y > this.draw_size.y
      || y < 0
    ) { 
      println("tile(x, y) = -1 -1");
      return new Size(-1, -1); 
    }
    
    println("app.Size.getTileOn - (x, y) =", x / (this.draw_size.x / this.size.x), y / (this.draw_size.y / this.size.y));
    
    return new Size(
      x / (this.draw_size.x / this.size.x),
      y / (this.draw_size.y / this.size.y)
    );
    
  }
  
  /**
   * Highlight on the app the tile, by drawing a rectangle.
   * If `tile_position` is (-1; -1), draw nothing.
   */
  public void highlightTile(Size tile_position) {
    if (tile_position.x == -1 && tile_position.y == -1) {
      return; 
    }
    
    rectMode(CORNER);
    fill(240, 240, 240);
    
    rect(
      tile_position.x * (this.draw_size.x / this.size.x),
      tile_position.y * (this.draw_size.y / this.size.y),
      this.draw_size.x / this.size.x,
      this.draw_size.y / this.size.y
    );
    
    return;
  }

  /**
   * Get the horizontal line on `y`. First line is of index 0.
   */
  public int[] getLine(int y) {
    return this.table[y];
  }
  
  /**
   * Get the vertical column on `x`. First column is of index 0.
   */
  public int[] getColumn(int x) {
    int[] column = {0, 0, 0, 0};
    for (int y = 0; y < this.size.y; y++) {
      column[y] = this.table[y][x];
    }

    return column;
  }

  /**
   * Get the square zone in which the `position` resides.
   */
  public int[] getSquare(Size position) {
    final Size square = new Size(position.x / 2, position.y / 2);

    return new int[]{
      this.table[square.y * 2][square.x * 2],
      this.table[square.y * 2][square.x * 2 + 1],
      this.table[square.y * 2 + 1][square.x * 2],
      this.table[square.y * 2 + 1][square.x * 2 + 1],
    };
  } 
}

/**
 * Write in color according to the `number`.
 */
public void drawNumber(int number, Size position) {
  final color RED = color(255, 50, 25);
  final color BLUE = color(50, 25, 255);
  final color NEUTRAL = color(100, 100, 100);

  if (number >= 1 && number <= 4) {
    fill(BLUE);
  } else if (number >= 5 && number <= 8) {
    fill(RED);
  } else {
    fill(NEUTRAL);
  }

  text(number, position.x, position.y);

  return;
}