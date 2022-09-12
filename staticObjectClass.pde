class staticObject {
  //Object definitions
  PVector size;
  float frictionC = 0.15;
  //Loction vector
  PVector location = new PVector(0, 0);

  //Constructor
  staticObject(PVector startLocation, PVector newSize) {
    location = startLocation.get();
    size = newSize.get();
  }

  //Update
  void update() {
    //Collision check
    collisionCheck();
  }

  void collisionCheck() {
    for (int i = 0; i < dynamicObjects.length; i++) {
      dynamicObjects[i].boxCollision(location.x - size.x / 2, location.y - size.y/2, size.x, size.y, frictionC);
    }
    player.boxCollision(location.x - size.x / 2, location.y - size.y/2, size.x, size.y, frictionC);
  }

  void draw() {
    stroke(0);
    colorMode(RGB);
    fill(252, 61, 3);
    rect(location.x, location.y, size.x, size.y);
  }
}
