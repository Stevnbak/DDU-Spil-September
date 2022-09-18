public int escaped = 0;
public int killed = 0;

public int[] scoreE={0, 0, 0};
public int[] scoreM={0, 0, 0};

void completion() {
  int sum=0;
  
  String[] te0={"--------------------------------\nAntal elimineret:"+"\n"+killed+"/"+total+"\n"+"\nAntal mistet:"+"\n"+escaped+"/"+total+"\n--------------------------------"};
  int[] l0={8};
  PFont[] f0={dejaBold};
  color[] c0={(0)};
  textTerminal(te0, c0, l0, f0, new PVector(0.65,0.97), si,0);

  if (animals.size() == 0) {
    if (killed>scoreE[Integer.valueOf(currentLevel.name)-1]) {
      scoreE[Integer.valueOf(currentLevel.name)-1]=killed;
      scoreM[Integer.valueOf(currentLevel.name)-1]=escaped;
    }
    killed=0;
    escaped=0;

    for (int i=0; i<scoreE.length; i++) {
      if (scoreE[i]>0&&scoreM[i]<5) {
        levelButtons.get(0).alter();
        zoomButtons.get(0).alter();
        sum++;
      }
    }
    intro=false;
    if (sum==scoreE.length) {
      t=0;
      setState("complete");
    } else {
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
    tint(255, 255 - threat);
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
