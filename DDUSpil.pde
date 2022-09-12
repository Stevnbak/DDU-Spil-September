PVector camLocation;
float camSpeed = 20;
public Player player = new Player();
public ParticleSystem odor=new ParticleSystem();
public PVector snude=new PVector(100,100);
public level currentLevel = new level();

public HashMap<String, Boolean> inputs = new HashMap<String, Boolean>();

staticObject[] objects = new staticObject[2];
dynamicObject[] dynamicObjects = new dynamicObject[1];

void setup() {
  size(1080, 720, P2D);
  surface.setTitle("Game Title");
  surface.setResizable(true);
  camLocation = new PVector(0, 0);
  objects[0] = new staticObject(new PVector(0, height), new PVector(width * 2000, 50));
  objects[1] = new staticObject(new PVector(width / 2, height - 50), new PVector(200, 500));

  dynamicObjects[0] = new testObject();
}

void updateCamLocation() {
  PVector centerLocation = new PVector(camLocation.x + width/2, camLocation.y + height /2);
  float xDistance = centerLocation.x - player.location.x;
  float yDistance = centerLocation.y - player.location.y;
  camLocation.x -= xDistance / camSpeed;
  camLocation.y -= yDistance / camSpeed;
}

// Inputs
public Boolean getInput(String keyValue)
{
  return inputs.getOrDefault(keyValue, false);
}
void keyPressed() {
  inputs.put(key + "", true);
}
void keyReleased() {
  inputs.put(key + "", false);
}
void mousePressed() {
  switch (mouseButton) {
  case 37:
    {
      inputs.put("MLeft", true);
      break;
    }
  case 39:
    {
      inputs.put("MRight", true);
      break;
    }
  case 3:
    {
      inputs.put("MMid", true);
      break;
    }
  }
}
void mouseReleased() {
  switch (mouseButton) {
  case 37:
    {
      inputs.put("MLeft", false);
      break;
    }
  case 39:
    {
      inputs.put("MRight", false);
      break;
    }
  case 3:
    {
      inputs.put("MMid", false);
      break;
    }
  }
}

//Draw
void draw() {
  for (int i = 0; i < dynamicObjects.length; i++) {
    dynamicObjects[i].physics();
  }
  player.update();
  
  for (int i = 0; i < objects.length; i++) {
    objects[i].update();
  }

  background(255);
  updateCamLocation();
  rectMode(CENTER);
  translate(-camLocation.x, -camLocation.y);
  for (int i = 0; i < dynamicObjects.length; i++) {
    dynamicObjects[i].draw();
  }
  for (int i = 0; i < objects.length; i++) {
    objects[i].draw();
  }
  player.draw();
  
  odor.update(snude);
  odor.addParticle(player.location.get(),player.size.get().y);
}
