class Decoration {
  PImage texture;
  int w, h;
  PVector location;
  Decoration(PVector location, float newWidth, String style, String type) {
    texture = loadImage("world/" + style + type + ".png");
    this.location = location.get();
    w = texture.width;
    h = texture.height;
    println("W: " + w + "H: " + h);
    float ratio = newWidth / w;
    println("Ratio: " + ratio);
    w = (int) (w * ratio);
    h =(int) (h * ratio);
    println("W: " + w + "H: " + h);
    texture.resize(w, h);
  }

  void draw() {
    println("Test");
    pushMatrix();
    textureMode(NORMAL);
    beginShape();
    texture(texture);
    vertex(location.x - w/2, location.y- h, 0, 0);
    vertex(location.x + w/2, location.y- h, 1, 0);
    vertex(location.x + w/2, location.y, 1, 1);
    vertex(location.x - w/2, location.y, 0, 1);
    endShape();
    popMatrix();
  }
}
