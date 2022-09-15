class Animal extends dynamicObject {
  //Texture
  PImage animalTexture;
  float threat;
  float health;
  int escaped = 0;
  int killed = 0;
  String escape;
  String kill;
  
  Animal(PVector spawnLocation, float spawnMass, PVector spawnSize, String texture) {
    location = spawnLocation.get();
    mass = spawnMass;
    size = spawnSize.get();
    health = mass * 10;
    animalTexture = loadImage(texture);
  }
  
  void detection() {
    for (int i = 0; i < animals.size(); i++) {
      if (threat >= 255 && animals.get(i) == this) {
        //animal escaped
        animals.remove(i);
        escaped++;
      }
    }
  }
  
  void damageCalc() {
    for (int i = 0; i < animals.size(); i++) {
      if (health <= 0 && animals.get(i) == this) {
        //animal killed
        animals.remove(i);
        killed++;
      }
    }
  }
  
  void completion() {
    escape = escaped + "/" + total;
    kill = killed + "/" + total;
    //Draw completion status
    text(escape, camLocation.x + width*0.2, camLocation.y + 100);
    text(kill, camLocation.x + width*0.8, camLocation.y + 100);
  }
  
  void draw() {
    detection();
    damageCalc();
    completion();
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
