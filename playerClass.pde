class Player {
  //Object definitions
  float mass = 5;
  float bounceFactor = random(0.850, 0.950);
  float size = 50;
  float standardAccel = 0.25;
  float jumpPower = 15;
  float maxVelocity = 10;
  boolean isTouchingGround = false;

  //Color value
  PVector colorValue = new PVector(2, 230, 36);

  //Physics vectors
  PVector location = new PVector(0, 0);
  PVector velocity = new PVector(0, 0);
  PVector acceleration = new PVector(0, 0);

  void update() {
    //Gravity
    PVector gravity = new PVector(0, 1);
    addForce(gravity);

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
    print("Acceleration: " + acceleration + "\n");
    //Update location...
    velocity.add(acceleration.mult(mass));
    velocity.x = constrain(velocity.x, -maxVelocity, maxVelocity);
    location.add(velocity);
    isTouchingGround = false;
  }

  void draw() {
    noStroke();
    colorMode(RGB);
    fill(60, 120, 60);
    rect(location.x, location.y, size, size);
  }

  //Reset object acceleration
  void resetAccel() {
    //print("Frame start \n");
    acceleration = new PVector(0, 0);
  }
  //Add force to object function
  void addForce(PVector force) {
    //print("Force added: " + force);
    acceleration.add(new PVector(force.x / mass, force.y / mass));
    //print("New total acceleration: " + acceleration + "\n");
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
    print("Friction: " + friction + "\n");
    addForce(friction);
  }
  //Drag in liquid
  void drag(float dragConstant) {
    PVector drag = velocity.get();
    float speed = drag.mag();
    float dragMag = dragConstant * speed * speed * (size / 10);
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
    if (location.x + (size / 2) >= x && location.x - (size / 2) <= x + w) {
      //Bottom
      if (location.y - (size / 2) <= y + h && location.y + (size / 2) >= y + h) {
        bounce( y + h + (size / 2), 1);
        friction(friction, 0);
      }
      //Top
      if (location.y + (size / 2) >= y && location.y - (size / 2) <= y) {
        bounce(y - (size / 2), 1);
        friction(friction, 0);
      }
    }
    //X-Collision
    if (location.y + (size / 2) - 5 >= y && location.y - (size / 2) + 5 <= y + h) {
      //Left
      if (location.x + (size / 2) >= x && location.x - (size / 2) <= x) {
        bounce(x - (size / 2), 0);
        friction(friction, 1);
      }
      //Right
      if (location.x - (size / 2) <= x + w && location.x + (size / 2) >= x + w) {
        bounce( x + w + (size / 2), 0);
        friction(friction, 1);
      }
    }
  }
}
