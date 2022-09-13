PVector camLocation;
float camSpeed = 20;
public Player player = new Player();
public level currentLevel;
ParticleSystem odor=new ParticleSystem();
PVector temporary=new PVector(200,-100);
public HashMap<String, Boolean> inputs = new HashMap<String, Boolean>();

public ArrayList<staticObject> objects = new ArrayList<staticObject>();
public ArrayList<dynamicObject> dynamicObjects = new ArrayList<dynamicObject>();
public ArrayList<Animal> animals = new ArrayList<Animal>();

void setup() {
  size(1080, 720, P2D);
  surface.setTitle("Game Title");
  //surface.setResizable(false);
  camLocation = new PVector(0, 0);

  //Set level
  currentLevel = new level("test");

  //Add test object (green square)
  dynamicObjects.add(new testObject());
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
  for (int i = 0; i < dynamicObjects.size(); i++) {
    dynamicObjects.get(i).physics();
  }
  player.update();
  for (int i = 0; i < objects.size(); i++) {
    objects.get(i).update();
  }
  background(255);
  updateCamLocation();
  rectMode(CENTER);
  translate(-camLocation.x, -camLocation.y);
  for (int i = 0; i < dynamicObjects.size(); i++) {
    dynamicObjects.get(i).draw();
  }
  for (int i = 0; i < objects.size(); i++) {
    objects.get(i).draw();
  }
  
  odor.addParticle(player.location.get(),player.size.y,4);
  odor.update(temporary,40);

  fill(55);
  ellipse(temporary.x,temporary.y,40,40);
  
  player.draw();
}
