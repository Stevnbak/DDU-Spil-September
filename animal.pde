public int escaped = 0;
public int killed = 0;

void completion() {
    String escape = "Escaped: " + escaped + "/" + total;
    String kill = "Killed: " + killed + "/" + total;
    //Draw completion status
    textSize(50);
    text(escape, 0, 50);
    text(kill, 0, 100);

    if(animals.size() == 0) {
      setState("complete");
    }
  }

class Animal extends dynamicObject {
  //Texture
  PImage animalTexture;
  float threat;
  float health;
  
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
