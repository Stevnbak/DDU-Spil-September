PVector camLocation;
float camSpeed = 20;
Player player = new Player();

public HashMap<String,Boolean> inputs = new HashMap<String,Boolean>();

void setup() {
  size(1080,720);
  surface.setTitle("Test Title");
  surface.setResizable(true);
  //surface.setLocation(width/2, height/2);
  camLocation = new PVector(0,0);
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
    case 37: {inputs.put("MLeft", true); break;}
    case 39: {inputs.put("MRight", true); break;}
    case 3: {inputs.put("MMid", true); break;}
  }
}
void mouseReleased() {
  switch (mouseButton) {
    case 37: {inputs.put("MLeft", false); break;}
    case 39: {inputs.put("MRight", false); break;}
    case 3: {inputs.put("MMid", false); break;}
  }
}

//Draw
void draw() {
  player.update();

  background(255);
  updateCamLocation();
  translate(-camLocation.x, -camLocation.y);

  player.draw();


  noStroke();
  colorMode(RGB);
  fill(120,60,60);
  
  ellipse(width / 2, height / 2,100,100);
  ellipse(200, 50 ,100,100);
}
