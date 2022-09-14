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
  if(background == null) {
    background = loadImage("world/backgroundGrass.png");
  }
  //Set state
  setState("playing");

  //Setup menu...
  menuSetup();
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
  if (key == ESC) {
    key = 0;
  }
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
  //Inputs to change state
  if(getInput("b")) setState("designing");
  if(getInput("n")) setState("playing");
  if(getInput("m")) setState("menu");

  switch (state) {
    case "playing":{ playingDraw(); break;}
    case "designing":{ designDraw(); break;}
    case "menu":{ menuDraw(); break;}
    case "loading":{ loadingDraw(); break;}
    case "complete":{ completeDraw(); break;}
  }
}

void loadingDraw() {
  //Draw background
  frameBackground();
  //Text
  fill(0);
  textSize(128);
  text("Loading", 40, 120); 
}

void completeDraw() {
  //Draw background
  frameBackground();
  //Text
  fill(0);
  textSize(128);
  text("Complete", 40, 120); 
}

PImage lastFrame;
void frameBackground() {
    background(255);
  //Background image
  textureMode(NORMAL);
  textureWrap(REPEAT);
  beginShape();
  texture(lastFrame);
  vertex(0, 0, 0, 0);
  vertex(width, 0, 1, 0);
  vertex(width, height, 1, 1);
  vertex(0, height, 0, 1);
  endShape();
  //Add gradient
  fill(255,255,255,50);
  rect(width / 2, height / 2, width, height);
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
  for (int i = 0; i < animals.size(); i++) {
    odor.update(animals.get(i).location, animals.get(i).size.x/2);
  }
  
  //Draw animals
  for (int i = 0; i < animals.size(); i++) {
    animals.get(i).draw();
  }
  //Draw player
  player.draw();
}
