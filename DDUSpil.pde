//Camera stuff
PVector camLocation;
float camSpeed = 20;
int total;

//Player stuff
public Player player;

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
  //Window...
  size(1280, 720, P2D);
  surface.setTitle("Game Title");
  surface.setResizable(true);

  //Spawn player
  player = new Player();
  
  
  //Set state
  setState("intro1");
  //setState("editor");

  //Cam location
  camLocation = new PVector(player.location.x - width / 2, player.location.y - height / 2);

  //Setup menu...
  menuSetup();
  
  //Setup intro...
  introSetup();
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
  if (key == ESC) {
    inputs.put("ESC", true);
    key = 0;
    return;
  }
  inputs.put(key + "", true);
}
void keyReleased() {
  if (key == ESC) {
    inputs.put("ESC", false);
    key = 0;
    return;
  }
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
  if(getInput("i")){
    t=0;
    setState("intro1");
  }
  if (getInput("1")&&state=="intro1"){
    t=0;
    setState("intro2");
  }
  if ((!ongoing)&&state=="intro2"){
    ongoing=true;
    t=0;
    setState("intro3");
  }
  if (getInput("1")&&state=="intro3"){
    t=0;
    setState("intro4");
  }
  if ((!ongoing)&&state=="intro4"){
    t=0;
    setState("intro5");
  }
  if (getInput("1")&&state=="intro5"){
    t=0;
    setState("intro6");
  }
  if (getInput("2")&&state=="intro3"){
    t=0;
    setState("intro7");
  }
  if ((!ongoing)&&(state=="intro7"||state=="intro6")){
    t=0;
    setState("intro8");
  }

  switch (state) {
    case "playing":{ playingDraw(); break;}
    case "designing":{ designDraw(); break;}
    case "menu":{ menuDraw(); break;}
    case "loading":{ loadingDraw(); break;}
    case "complete":{ completeDraw(); break;}
    case "editor":{ editorDraw(); break;}
    case "intro1":{intro1Draw();break;}
    case "intro2":{intro2Draw();break;}
    case "intro3":{intro3Draw();break;}
    case "intro4":{intro4Draw();break;}
    case "intro5":{intro5Draw();break;}
    case "intro6":{intro6Draw();break;}
    case "intro7":{intro7Draw();break;}
    case "intro8":{intro8Draw();break;}
    case "zo1":{zo1Draw();break;}
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
  camLocation = new PVector (0,0);
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
  odor.update();
  
  //Draw animals
  for (int i = 0; i < animals.size(); i++) {
    animals.get(i).draw();
  }
  //Draw player
  player.draw();

  //HUD
  translate(camLocation.x, camLocation.y);
  //Draw completion counter
  completion();
}
