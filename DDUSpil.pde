void setup() {
  size(1080,720);
  surface.setTitle("Test Title");
  surface.setResizable(true);
  //surface.setLocation(width/2, height/2);
}

void draw() {
  background(255);
  noStroke();
  colorMode(RGB);
  fill(120,60,60);
  ellipse(width/2,height/2,100,100);
}
