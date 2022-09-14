class Animal extends dynamicObject {
  //Texture
  PImage animalTexture = loadImage("frog.png");
  float threat;
  float health;
  float escaped = 0;
  float killed = 0;
  
  Animal(PVector spawnLocation, float spawnMass, PVector spawnSize) {
    location = spawnLocation.get();
    mass = spawnMass;
    size = spawnSize.get();
    health = mass * 10;
  }
  
  void detection() {
    threat = odor.amount/10;
    for (int i = 0; i < animals.size(); i++) {
      if (threat >= 255) {
        //animal escaped
        animals.remove(i);
        escaped++;
      }
    }
  }
  
  void damageCalc() {
    for (int i = 0; i < animals.size(); i++) {
      if (health <= 0) {
        //animal killed
        animals.remove(i);
        killed++;
      }
    }
  }
  
  void draw() {
    detection();
    damageCalc();
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
