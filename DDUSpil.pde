PVector camLocation;

void setup() {
  size(1080,720);
  surface.setTitle("Test Title");
  surface.setResizable(true);
  //surface.setLocation(width/2, height/2);
  camLocation = new PVector(0,0);
}

void draw() {
  background(255);
  noStroke();
  colorMode(RGB);
  fill(120,60,60);
  if(keyPressed) {
    if(key == CODED) {
      if(keyCode == RIGHT) {
        camLocation.x = camLocation.x + 5;
      }
      if(keyCode == LEFT) {
        camLocation.x = camLocation.x - 5;
      }
      if(keyCode == UP) {
        camLocation.y = camLocation.y - 5;
      }
      if(keyCode == DOWN) {
        camLocation.y = camLocation.y + 5;
      }
    }
  }
  
  ellipse(width / 2 - camLocation.x, height / 2 - camLocation.y,100,100);
  ellipse(200 - camLocation.x, 50 - camLocation.y,100,100);
}
