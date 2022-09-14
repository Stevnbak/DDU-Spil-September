class Animal extends dynamicObject {
  //Texture
  PImage animalTexture = loadImage("frog.png");
  float threat;
  
  Animal(PVector spawnLocation, float spawnMass, PVector spawnSize) {
    location = spawnLocation.get();
    mass = spawnMass;
    size = spawnSize.get();
  }
  
  void detection() {
    threat = odor.amount/10;
    if (threat >= 255) {
      threat = 255;
      //lose the game
    }
  }
  
  void draw() {
    detection();
    super.draw();
    textureMode(NORMAL);
    tint(255,255 - threat);
    beginShape();
    texture(animalTexture);
    vertex(location.x - size.x/2, location.y - size.y/2, 0, 0);
    vertex(location.x + size.x/2, location.y - size.y/2, 1, 0);
    vertex(location.x + size.x/2, location.y + size.y/2, 1, 1);
    vertex(location.x - size.x/2, location.y + size.y/2, 0, 1);
    endShape();
    noTint();
  }
}
