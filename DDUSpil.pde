//Current saveid
int saveID;

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
public ArrayList<Decoration> decorations = new ArrayList<Decoration>();

void setup() {
  //Window...
  size(1280, 720, P2D);

  surface.setTitle("Game Title");
  surface.setResizable(true);

  //Spawn player
  player = new Player();

  //Set state
  //setState("intro1");
  setState("save");
  //setState("editor");

  //Cam location
  camLocation = new PVector(player.location.x - width / 2, player.location.y - height / 2);

  //Setup intro...
  introSetup();
  
  //Setup layout
  layoutSetup();
}

void updateCamLocation() {
  PVector centerLocation = new PVector(camLocation.x + width/2, camLocation.y + height /2);
  float xDistance = centerLocation.x - player.location.x;
  float yDistance = centerLocation.y - player.location.y;
  camLocation.x -= xDistance / camSpeed;
  camLocation.y -= yDistance / camSpeed;
}

void death() {
  println("Dead!");
  setState("zo" + currentLevel.name);
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
  if (state.equals("save")) {
    if (!overview) {
      if (key == BACKSPACE) {
        if (inputText.length() > 0) {
          inputText = inputText.substring(0, inputText.length()-1);
        }
      } else if (key == ENTER || key == RETURN || key == DELETE || key == CODED) {
      } else {
        inputText += key;
      }
    }
  };
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
  rectMode(CENTER);
  if (getInput("ESC")&&intro==false) {
    setState("menu");
  }

  if ((getInput("p")||getInput("P"))&&state=="playing") {
    setState("pause");
    cooldown=0;
  }

  if ((getInput("p")||getInput("P"))&&state=="pause"&&cooldown>10) {
    setState("playing");
  }

  if ((getInput("r")||getInput("R"))&&state=="pause") {
    currentLevel = new level(currentLevel.name);
    killed=0;
    escaped=0;
    player.velocity=new PVector(0, 0);
    setState("playing");
  }

  switch (state) {
  case "playing":
    {
      playingDraw();
      break;
    }
  case "designing":
    {
      designDraw();
      break;
    }
  case "menu":
    {
      menuDraw();
      break;
    }
  case "save":
    {
      saveMenuDraw();
      break;
    }
  case "loading":
    {
      loadingDraw();
      break;
    }
  case "complete":
    {
      completeDraw();
      break;
    }
  case "editor":
    {
      editorDraw();
      break;
    }
  case "intro1":
    {
      if (getInput("1")) {
        t=0;
        setState("intro2");
      }
      intro1Draw();
      break;
    }
  case "intro2":
    {
      if (!ongoing) {
        ongoing=true;
        t=0;
        setState("intro3");
      }
      intro2Draw();
      break;
    }
  case "intro3":
    {
      if (getInput("1")) {
        t=0;
        setState("intro4");
      }
      if (getInput("2")) {
        t=0;
        setState("intro7");
      }
      intro3Draw();
      break;
    }
  case "intro4":
    {
      if (!ongoing) {
        t=0;
        setState("intro5");
      }
      intro4Draw();
      break;
    }
  case "intro5":
    {
      if (getInput("1")) {
        t=0;
        ongoing=true;
        setState("intro6");
      }
      intro5Draw();
      break;
    }
  case "intro6":
    {
      if (!ongoing) {
        t=0;
        setState("intro8");
      }
      intro6Draw();
      break;
    }
  case "intro7":
    {
      if (!ongoing) {
        t=0;
        setState("intro8");
      }
      intro7Draw();
      break;
    }
  case "intro8":
    {
      intro8Draw();
      break;
    }
  case "1":
    {
      zo1Draw();
      break;
    }
  case "2":
    {
      zo2Draw();
      break;
    }
  case "3":
    {
      zo3Draw();
      break;
    }
  case "deathSuicide":
    {
      if (getInput("1")) {
        t=0;
        setState(currentLevel.name);
      }
      deathSuicideDraw();
      break;
    }
  case "deathDrowned":
    {
      if (getInput("1")) {
        t=0;
        setState(currentLevel.name);
      }
      deathDrownedDraw();
      break;
    }
  case "pause":
    {
      pauseDraw();
      break;
    }
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

PImage lastFrame;
void frameBackground() {
  camLocation = new PVector (0, 0);
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
  fill(255, 255, 255, 50);
  rect(width / 2, height / 2, width, height);
}

void playingDraw() {
  windupdate(currentLevel);
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
  //Draw decoration objects
  for (int i = 0; i < decorations.size(); i++) {
    decorations.get(i).draw();
  }
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
  windInfoDraw();
}
