class Player extends dynamicObject {
  //Object definitions
  float bounceFactor = random(0.850, 0.950), standardAccel = 0.25, jumpPower = 15, maxVelocity = 10;
  boolean isTouchingGround = false;

  //Textures
  PImage playerTexture;

  Player() {
    mass = 5;
    airConstant = 0;
    size = new PVector(60, 97);
  }

  //Color value
  PVector colorValue = new PVector(2, 230, 36);

  void update() {
    //Textures
    animations();

    //Inputs
    if (getInput("a")) {
      addForce(new PVector(-standardAccel, 0));
    }
    if (getInput("d")) {
      addForce(new PVector(standardAccel, 0));
    }
    if (getInput("w") || getInput(" ")) {
      if (isTouchingGround) addForce(new PVector(0, -jumpPower));
    }

    //Update location...
    velocity.add(acceleration.mult(mass));
    velocity.x = constrain(velocity.x, -maxVelocity, maxVelocity);
    location.add(velocity);
    isTouchingGround = false;
  }

  void animations() {
    if (isTouchingGround) {
      playerTexture = loadImage("player_stand.png");
    }
    else {
      playerTexture = loadImage("player_jump.png");
    }
  }


  void draw() {
    noStroke();
    colorMode(RGB);
    //fill(60, 120, 60);
    //rect(location.x, location.y, size.x, size.y);
    textureMode(NORMAL);
    beginShape();
    texture(playerTexture);
    vertex(location.x - size.x/2, location.y - size.y/2, 0, 0);
    vertex(location.x + size.x/2, location.y - size.y/2, 1, 0);
    vertex(location.x + size.x/2, location.y + size.y/2, 1, 1);
    vertex(location.x - size.x/2, location.y + size.y/2, 0, 1);
    endShape();
  }

  //Friction function
  PVector lastFriction = new PVector(0, 0, 0);
  void friction(float frictionC, float axis) {
    //print("Velocity (Friction): " + velocity + "\n");
    float normal = 1;
    float frictionMag = frictionC * normal;
    PVector friction = velocity.get();
    friction.mult(-1);
    friction.normalize();
    friction.mult(frictionMag);
    if (-lastFriction.x == friction.x) {
      lastFriction = friction.get();
      friction.x = 0;
    }
    if (-lastFriction.y == friction.y) {
      lastFriction = friction.get();
      friction.y = 0;
    }
    if (axis == 0) friction.y = 0;
    if (axis == 1) friction.x = 0;
    //print("Friction: " + friction + "\n");
    addForce(friction);
  }
  //Drag in liquid
  void drag(float dragConstant) {
    PVector drag = velocity.get();
    float speed = drag.mag();
    float dragMag = dragConstant * speed * speed * (size.x * size.y / 20);
    drag.mult(-1);
    drag.normalize();
    drag.mult(dragMag);
    //print("Drag: " + drag + "\n");
    addForce(drag);
  }


  //Collisions...
  //Bounce function
  void bounce(float locationValue, float axis) {
    if (axis == 0) {
      location.x = locationValue;
      velocity.x = 0;
      //velocity.x *= -bounceFactor;
      //if(velocity.x > 1) velocity.x = round(velocity.x);
    }
    if (axis == 1) {
      location.y = locationValue;
      velocity.y = 0;
      isTouchingGround = true;
      //velocity.y *= -bounceFactor;
      //if(velocity.y > 1) velocity.y = round(velocity.y);
    }
  }
  void boxCollision(float x, float y, float w, float h, float friction) {
    //Y-Collision
    if (location.x + (size.x / 2) >= x && location.x - (size.x / 2) <= x + w) {
      //Bottom
      if (location.y - (size.y / 2) <= y + h && location.y + (size.y / 2) >= y + h) {
        bounce( y + h + (size.y / 2), 1);
        friction(friction, 0);
      }
      //Top
      if (location.y + (size.y / 2) >= y && location.y - (size.y / 2) <= y) {
        bounce(y - (size.y / 2), 1);
        friction(friction, 0);
      }
    }
    //X-Collision
    if (location.y + (size.y / 2) - 5 >= y && location.y - (size.y / 2) + 5 <= y + h) {
      //Left
      if (location.x + (size.x / 2) >= x && location.x - (size.x / 2) <= x) {
        bounce(x - (size.x / 2), 0);
        friction(friction, 1);
      }
      //Right
      if (location.x - (size.x / 2) <= x + w && location.x + (size.x / 2) >= x + w) {
        bounce( x + w + (size.x / 2), 0);
        friction(friction, 1);
      }
    }
  }
}
