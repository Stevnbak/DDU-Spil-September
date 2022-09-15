class staticObject {
  //Object definitions
  PVector size;
  float frictionC = 0.05;
  //Loction vector
  PVector location = new PVector(0, 0);
  PImage texture = loadImage("world/none.png");
  PImage topTexture = loadImage("world/none.png");
  //Constructor
  staticObject(PVector startLocation, PVector newSize, String style) {
    location = startLocation.get();
    size = newSize.get();
    if(style == "") {
      noTexture = true;
    } else {
      texture = loadImage("world/" + style + "Tile.png");
      topTexture = loadImage("world/" + style + "TopTile.png");
    }
    c1 = size.x/50;
    c2 = (size.y - 50)/50;
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
    if (!noTexture) {
      beginShape();
      texture(texture);
      vertex(location.x - size.x/2, location.y - size.y/2 + 50, 0, 0);
      vertex(location.x + size.x/2, location.y - size.y/2 + 50, c1, 0);
      vertex(location.x + size.x/2, location.y + size.y/2, c1, c2);
      vertex(location.x - size.x/2, location.y + size.y/2, 0, c2);
      endShape();
      beginShape();
      texture(topTexture);
      vertex(location.x - size.x/2, location.y - size.y/2, 0, 0);
      vertex(location.x + size.x/2, location.y - size.y/2, c1, 0);
      vertex(location.x + size.x/2, location.y - size.y/2 + 51, c1, 1);
      vertex(location.x - size.x/2, location.y - size.y/2 + 51, 0, 1);
      endShape();
    }
  }
}
