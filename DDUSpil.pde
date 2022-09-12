PVector camLocation;
float camSpeed = 20;
public Player player = new Player();

public HashMap<String, Boolean> inputs = new HashMap<String, Boolean>();

staticObject[] objects = new staticObject[2];

void setup() {
  size(1080, 720, P2D);
  surface.setTitle("Game Title");
  surface.setResizable(true);
  camLocation = new PVector(0, 0);
  objects[0] = new staticObject(new PVector(0, height), new PVector(width * 2000, 50));
  objects[1] = new staticObject(new PVector(width / 2, height - 50), new PVector(200, 500));
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

//Physics
void physics() {
  player.resetAccel();
  gravity(player);
  //airResistance(player);
}

//Gravity
void gravity(dynamicObject object) {
    PVector gravity = new PVector(0, 1);
    object.addForce(gravity);
}

//Air resistance
void airResistance(dynamicObject object) {
    PVector drag = object.velocity.get();
    float speed = drag.mag();
    float area = object.size.x * object.size.y;
    float magnitude = object.airConstant * speed * speed * (area / 100);
    drag.mult(-1);
    drag.normalize();
    drag.mult(magnitude);
    //print("Luftmodstand: " + drag + "\n");
    object.addForce(drag);
}

//Wind
void wind() {

}

//Draw
void draw() {
  physics();
  for (int i = 0; i < objects.length; i++) {
    objects[i].update();
  }
  player.update();

  background(255);
  updateCamLocation();
  rectMode(CENTER);
  translate(-camLocation.x, -camLocation.y);


  for (int i = 0; i < objects.length; i++) {
    objects[i].draw();
  }
  player.draw();
}
