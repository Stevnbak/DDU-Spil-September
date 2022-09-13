class staticObject {
  //Object definitions
  PVector size;
  float frictionC = 0.15;
  //Loction vector
  PVector location = new PVector(0, 0);
  PImage texture = loadImage("slice27_27.png");
  //Constructor
  staticObject(PVector startLocation, PVector newSize, String newTexture) {
    //println("Static object initialized... Location: " + startLocation + " Size: " + newSize);
    location = startLocation.get();
    size = newSize.get();
    if(newTexture != "") texture = loadImage(newTexture);
    c1 = size.x/50;
    c2 = size.y/50;
  }

  //Update
  void update() {
    //Collision check
    collisionCheck();
  }

  void collisionCheck() {
    for (int i = 0; i < dynamicObjects.size(); i++) {
      dynamicObjects.get(i).boxCollision(location.x - size.x / 2, location.y - size.y/2, size.x, size.y, frictionC);
    }
    player.boxCollision(location.x - size.x / 2, location.y - size.y/2, size.x, size.y, frictionC);
  }

  float c1;
  float c2;

  void draw() {
    textureMode(NORMAL);
    textureWrap(REPEAT);
    beginShape();
    texture(texture);
    vertex(location.x - size.x/2, location.y - size.y/2, 0, 0);
    vertex(location.x + size.x/2, location.y - size.y/2, c1, 0);
    vertex(location.x + size.x/2, location.y + size.y/2, c1, c2);
    vertex(location.x - size.x/2, location.y + size.y/2, 0, c2);
    endShape();
  }
}
