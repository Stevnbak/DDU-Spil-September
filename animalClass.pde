class Animal extends dynamicObject {
  //Texture
  PImage animalTexture;
  
  Animal(PVector spawnLocation, float spawnMass, PVector spawnSize) {
    location = spawnLocation;
    mass = spawnMass;
    size = spawnSize;
  }
  
  void draw() {
    super.draw();
    textureMode(NORMAL);
    beginShape();
    texture(animalTexture);
    vertex(location.x - size.x/2, location.y - size.y/2, c1, 0);
    vertex(location.x + size.x/2, location.y - size.y/2, c2, 0);
    vertex(location.x + size.x/2, location.y + size.y/2, c3, 1);
    vertex(location.x - size.x/2, location.y + size.y/2, c4, 1);
    endShape();
  }
}
