//! Quantik game processor.

App app;

/**
 * Initialize the window.
 */ 
void setup() {
  size(820, 720);
  frameRate(30);
  windowTitle(String.format("Quantik (%d; %d) %g fps", width, height, frameRate));

  println("# Quantik.");
  
  app = new App(new Size(600, 600));
}

void draw() {
  background(0);
  
  app.draw();
}

void mouseReleased() {
  println("quantik.mouseClicked - Heard!");
  app.player.click(new Size(mouseX, mouseY));
} 

void keyReleased() {
  app.player.selectedPieceFromAscii(key);
} 
