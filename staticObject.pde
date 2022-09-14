class staticObject {
  //Object definitions
  PVector size;
  float frictionC = 0.05;
  //Loction vector
  PVector location = new PVector(0, 0);
  PImage texture = loadImage("world/dirtTile.png");
  PImage topTexture = loadImage("world/grassTile.png");
  //Constructor
  staticObject(PVector startLocation, PVector newSize, String newTexture) {
    //println("Static object initialized... Location: " + startLocation + " Size: " + newSize);
    location = startLocation.get();
    size = newSize.get();
    if(newTexture != "") {
      texture = loadImage("world/" + newTexture);
      noTexture = true;
    }
    c1 = size.x/50;
    c2 = size.y/50;
  }

  //Update
  void update() {
    //Collision check
    for (int i = 0; i < dynamicObjects.size(); i++) {
      checkCollision(this, dynamicObjects.get(i));
    }
    checkCollision(this, player);
  }

  float c1;
  float c2;
  boolean noTexture = false;

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
    
    if (noTexture == false) {
      beginShape();
      texture(topTexture);
      vertex(location.x - size.x/2, location.y - size.y/2, 0, 0);
      vertex(location.x + size.x/2, location.y - size.y/2, c1, 0);
      vertex(location.x + size.x/2, location.y - size.y/2 + 50, c1, 1);
      vertex(location.x - size.x/2, location.y - size.y/2 + 50, 0, 1);
      endShape();
    }
  }
}
