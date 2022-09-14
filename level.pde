PVector mapSize;
class level {
  PVector wind = new PVector(0, 0);
  //ArrayList<staticObject> objects = new ArrayList<staticObject>();
  PVector spawnLocation = new PVector(width /2, height / 2);

  level(String levelName) {
    String[] lines = loadStrings("levels/" + levelName + ".map");
    for (int i = 0; i < lines.length; i++) {
      if(lines[i].length() <= 2) continue;
      if(lines[i].charAt(0) == '/' && lines[i].charAt(1) == '/') continue;
      String[] temp = split(lines[i], ":");
      String type = trim(temp[0]);
      String[] values = split(temp[1].replace("[", "").replace("]", "").replace(" ",""), ",");
      if (type.equals("object")) {
        if(values.length != 4) {
          println("Error: object line " + i + " has incorrect number of values");
        } else {
          staticObjects.add(new staticObject(new PVector(int(values[0]), -int(values[1])), new PVector(int(values[2]), int(values[3])), ""));
        }
      } else if (type.equals("spawn")) {
        player.location = new PVector(int(values[0]), -int(values[1]));
      } else if (type.equals("animal")) {
        animals.add(new Animal(new PVector(int(values[0]), -int(values[1])), int(values[2]), new PVector(int(values[3]), int(values[4]))));
      } else if (type.equals("size")) {
        mapSize = new PVector(int(values[0]), int(values[1]));
        //Side wall exits?
        if(int(values[0]) != 0)  {
          //Left wall
          staticObjects.add(new staticObject(new PVector(-int(values[0]) / 2 - 50, -int(values[1]) / 2), new PVector(100, int(values[1]) + 200), "none.png"));
          //Right wall
          staticObjects.add(new staticObject(new PVector(int(values[0]) / 2 + 50, -int(values[1]) / 2), new PVector(100, int(values[1]) + 200), "none.png"));
          //Add roof
          staticObjects.add(new staticObject(new PVector(0, -int(values[1]) - 250), new PVector(int(values[0]), 500), "none.png"));
        } else {
          //Add "infinite" roof
          staticObjects.add(new staticObject(new PVector(0, -int(values[1]) - 250), new PVector(width * 2000, 500), "none.png"));
        }
      } else if (type.equals("background")) {
        background = loadImage("world/" + values[0].replace((char)'"',' ').trim());
      } else if (type.equals("wind")) {
        wind = new PVector(float(values[0]), float(values[1]));
        println("Wind set to " + wind);
      }
    }
    //Add "infinite" floor
    staticObjects.add(new staticObject(new PVector(0, height / 2), new PVector(width * 2000, height), ""));
  }
}

void editorSetup() {
  currentLevel = new level("test");
  camLocation = new PVector(player.location.x - width / 2, player.location.y - height / 2);
  coordinateFont = createFont("Arial", 30, true);
  loadBtn = new Button(new PVector(100, height - 50), new PVector(200,50), color(0,0,200), "Load level", () -> {
    println("Loaded level");
    staticObjects = new ArrayList<staticObject>();
    animals = new ArrayList<Animal>();
    currentLevel = new level("test");
  });
}
Button loadBtn;
PFont coordinateFont;

PVector P1;
PVector P2;
int lastP;

void editorDraw() {
  background(255);
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

  //Move camera
  if (getInput("a")) {
    camLocation.x -= 5;
  }
  if (getInput("d")) {
    camLocation.x += 5;
  }
  if (getInput("w")) {
    camLocation.y -= 5;
  }
  if (getInput("s")) {
    camLocation.y += 5;
  }
  //Set rect mode
  rectMode(CENTER);
  //Move everything according to camera location
  translate(-camLocation.x, -camLocation.y);
  //Draw static objects
  for (int i = 0; i < staticObjects.size(); i++) {
    staticObjects.get(i).draw();
  }
  //Draw animals
  for (int i = 0; i < animals.size(); i++) {
    animals.get(i).draw();
  }
  //Draw player
  player.draw();
  //Draw mouse coordinates
  String text = "[" + (int)(mouseX + camLocation.x) + "; " + (int)-(mouseY + camLocation.y) + "]";
  fill(0);
  textFont(coordinateFont);
  text(text, (mouseX + camLocation.x), (mouseY  + camLocation.y));

  //Button
  loadBtn.location = new PVector(100, height - 50);
  loadBtn.update();

  //Points on screen
  if(getInput("MLeft")) {
    inputs.put("MLeft", false);
    if(lastP == 2) {
      P1 = new PVector(mouseX + camLocation.x, -(mouseY + camLocation.y)); lastP = 1;
    } else {
      P2 = new PVector(mouseX + camLocation.x, -(mouseY + camLocation.y)); lastP = 2;
    }
  }
  if(getInput("ESC")) {
    P1 = null;
    P2 = null;
  }
  fill(0);
  noStroke();
  if(P1 != null) {
    ellipse(P1.x, -P1.y, 5,5);
  }
  if(P2 != null) {
    ellipse(P2.x, -P2.y, 5,5);
  }
  if(P1 != null && P2 != null) {
    double xDist = Math.round(Math.abs(P2.x-P1.x));
    double yDist = Math.round(Math.abs(P2.y-P1.y));
    stroke(0);
    line(P1.x,-P1.y,P2.x,-P2.y);
    textFont(coordinateFont);
    textSize(25);
    String distText = "X: " + (int)xDist + " Y: " + (int)yDist;
    double y = -min(P1.y, P2.y) + 25;
    double x = (max(P1.x,P2.x) - (xDist / 2)) - (textWidth(distText) / 2);
    fill(0);
    noStroke();
    text(distText, (float)x, (float)y);
  }


  //Draw borders
  stroke(0);
  line(mapSize.x / 2, 0, mapSize.x / 2, -mapSize.y / 2);
  line(-mapSize.x / 2, 0, -mapSize.x / 2, -mapSize.y / 2);
  line(-mapSize.x / 2, -mapSize.y / 2, mapSize.x / 2, -mapSize.y / 2);
  noStroke();
}
