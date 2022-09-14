class Animal extends dynamicObject {
  //Texture
  PImage animalTexture = loadImage("frog.png");
  
  Animal(PVector spawnLocation, float spawnMass, PVector spawnSize) {
    location = spawnLocation.get();
    mass = spawnMass;
    size = spawnSize.get();
  }
  
  void draw() {
    super.draw();
    textureMode(NORMAL);
    beginShape();
    texture(animalTexture);
    vertex(location.x - size.x/2, location.y - size.y/2, 0, 0);
    vertex(location.x + size.x/2, location.y - size.y/2, 1, 0);
    vertex(location.x + size.x/2, location.y + size.y/2, 1, 1);
    vertex(location.x - size.x/2, location.y + size.y/2, 0, 1);
    endShape();
  }
}
