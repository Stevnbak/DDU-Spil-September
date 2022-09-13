class dynamicObject {
  PVector location = new PVector(100, 100);
  PVector velocity = new PVector(0, 0);
  PVector acceleration = new PVector(0, 0);
  PVector size = new PVector(20, 20);
  PVector maxVelocity = new PVector(-1, -1);
  float mass = 1, airConstant = 0;

  void draw() {
    //Update location...
    velocity.add(acceleration.mult(mass));
    if (maxVelocity.x > -1) velocity.x = constrain(velocity.x, -maxVelocity.x, maxVelocity.x);
    if (maxVelocity.y > -1) velocity.y = constrain(velocity.y, -maxVelocity.y, maxVelocity.y);
    location.add(velocity);
  }

  //Add force to object function
  void addForce(PVector force) {
    //print("Force added: " + force);
    acceleration.add(new PVector(force.x / mass, force.y / mass));
    //print("New total acceleration: " + acceleration + "\n");
  }

  //Reset object acceleration
  void resetAccel() {
    //print("Frame start \n");
    acceleration = new PVector(0, 0);
  }
  //Physics
  void physics() {
    resetAccel();
    gravity();
    wind();
    airResistance();
  }

  //Gravity
  void gravity() {
    PVector gravity = new PVector(0, 1);
    addForce(gravity);
  }

  //Air resistance
  void airResistance() {
    PVector drag = velocity.get();
    float speed = drag.mag();
    float area = size.y;
    float magnitude = (speed * (area / 500)) * airConstant;
    drag.mult(-1);
    drag.normalize();
    drag.mult(magnitude);
    //print("\nSpeed: " + speed + "\nArea:" + area + "\nMagnitude: " + magnitude + "\nLuftmodstand: " + drag);
    addForce(drag);
  }

  //Wind
  void wind() {
    PVector wind = currentLevel.wind;
    //print("\nWind:" + wind);
    addForce(wind.get());
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


  //Collision function
  void collision(float locationValue, int side) {
    //println("1");
    if (side == left || side == right) {
      location.x = locationValue;
      velocity.x = 0;
    }
    if (side == bottom || side == top) {
      location.y = locationValue;
      velocity.y = 0;
    }
  }
}
