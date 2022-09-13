//Camera stuff
PVector camLocation;
float camSpeed = 20;

//Player stuff
public Player player = new Player();

//Level stuff
public level currentLevel;

//Background
PImage background;

//Particle stuff
ParticleSystem odor = new ParticleSystem();
PVector temporary = new PVector(200, -100);

//Inputs
public HashMap<String, Boolean> inputs = new HashMap<String, Boolean>();

//Object lists
public ArrayList<staticObject> staticObjects = new ArrayList<staticObject>();
public ArrayList<dynamicObject> dynamicObjects = new ArrayList<dynamicObject>();
public ArrayList<Animal> animals = new ArrayList<Animal>();

void setup() {
  //Window size
  size(1080, 720, P2D);
  //Title
  surface.setTitle("Game Title");
  //surface.setResizable(false);
  camLocation = new PVector(0, 0);
  //Set level
  currentLevel = new level("test");
  //Set state
  setState("playing");
  //Loads background
  background = loadImage("backgroundColorGrass.png");
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
  switch (state) {
    case "playing":{ playingDraw(); break;}
    case "design":{ designDraw(); break;}
    case "menu":{ menuDraw(); break;}
    case "loading":{ loadingDraw(); break;}
    case "complete":{ completeDraw(); break;}
  }
}

void designDraw() {

}

void loadingDraw() {

}

void menuDraw() {

}

void completeDraw() {

}

void playingDraw() {
  //Update dynamic object physics
  for (int i = 0; i < dynamicObjects.size(); i++) {
    dynamicObjects.get(i).physics();
  }
  //Update player (including physics)
  player.update();
  //Update static objects (Including collisions with dynamic objects...)
  for (int i = 0; i < staticObjects.size(); i++) {
    staticObjects.get(i).update();
  }
  //Update camera location
  updateCamLocation();
  //Draw background
  background(255);
  textureMode(NORMAL);
  textureWrap(REPEAT);
  beginShape();
  texture(background);
  vertex(0, 0, 0, 0);
  vertex(width, 0, 1, 0);
  vertex(width, height, 1, 1);
  vertex(0, height, 0, 1);
  endShape();
  //Set rect mode
  rectMode(CENTER);
  //Move everything according to camera location
  translate(-camLocation.x, -camLocation.y);
  //Draw dynamic objects
  for (int i = 0; i < dynamicObjects.size(); i++) {
    dynamicObjects.get(i).draw();
  }
  //Draw static objects
  for (int i = 0; i < staticObjects.size(); i++) {
    staticObjects.get(i).draw();
  }
  //Particle stuff...
  odor.addParticle(player.location.get(), player.size.get().y, 4);
  odor.update(temporary, 40);

  fill(55);
  ellipse(temporary.x, temporary.y, 40, 40);
  //Draw player
  player.draw();
}
