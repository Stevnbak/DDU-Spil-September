public int escaped = 0;
public int killed = 0;
public int smell = 0;

void completion() {
  int sum=0;
  
  String[] te0={"--------------------------------\nAntal elimineret:"+"\n"+killed+"/"+total+"\n"+"\nAntal mistet:"+"\n"+escaped+"/"+total+"\n--------------------------------"};
  int[] l0={8};
  PFont[] f0={dejaBold};
  color[] c0={(0)};
  textTerminal(te0, c0, l0, f0, new PVector(0.65,0.97), si,0);
  
  //Game completed?
  if (animals.size() == 0) {
    //New personal best?
    int levelID = Integer.valueOf(currentLevel.name);
    int[] levelInfo = levelGet(levelID);
    if (killed > levelInfo[0]) {
      //Update values
      levelSet(levelID, killed, escaped, millis() - startTime, smell);
    }
    if (killed == levelInfo[0] && millis() - startTime < levelInfo[2]) {
      levelSet(levelID, killed, escaped, millis() - startTime, smell);
    }
    //Reset
    killed = 0;
    escaped = 0;
    //All levels completed:
    int completed = 0;
    for(int i = 0; i < 3; i++) {
      int[] levelData = levelGet(i + 1);
      if (levelData[0] > 0 && levelData[1] < 5) {
        completed++;
      }
    }
    if(completed == 3) {
      setState("complete");
    } else {
      //Go to menu
      intro = false;
      println("level complete");
      setState("menu");
    }
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
      if (threat >= 255/(1 + difficultyGet(saveID)) && animals.get(i) == this) {
        smell += threat;
        //animal escaped
        animals.remove(i);
        escaped++;
      }
    }
  }

  void damageCalc() {
    for (int i = 0; i < animals.size(); i++) {
      if (health <= 0 && animals.get(i) == this) {
        smell += threat;
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
    tint(255, 255 - threat * (1 + difficultyGet(saveID)));
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
