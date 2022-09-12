class staticObject {
  //Object definitions
  PVector size;
  float frictionC = 0.15;
  //Loction vector
  PVector location = new PVector(0, 0);
  PImage texture = loadImage("defaultTile.png");
  //Constructor
  staticObject(PVector startLocation, PVector newSize, String newTexture) {
    //println("Static object initialized... Location: " + startLocation + " Size: " + newSize);
    location = startLocation.get();
    size = newSize.get();
    if(newTexture != "") texture = loadImage(newTexture);
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

  void draw() {
    textureMode(NORMAL);
    beginShape();
    texture(texture);
    vertex(location.x - size.x/2, location.y - size.y/2, 0, 0);
    vertex(location.x + size.x/2, location.y - size.y/2, 1, 0);
    vertex(location.x + size.x/2, location.y + size.y/2, 1, 1);
    vertex(location.x - size.x/2, location.y + size.y/2, 0, 1);
    endShape();
  }
}
