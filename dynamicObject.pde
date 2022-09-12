class dynamicObject {
  PVector location = new PVector(100, 100);
  PVector velocity = new PVector(0, 0);
  PVector acceleration = new PVector(0, 0);
  PVector size = new PVector(20, 20);
  float mass, airConstant, maxVelocity = -1;

  void draw() {
    //Update location...
    velocity.add(acceleration.mult(mass));
    if (maxVelocity > -1) {
      velocity.x = constrain(velocity.x, -maxVelocity, maxVelocity);
      velocity.y = constrain(velocity.y, -maxVelocity, maxVelocity);
    }
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
    print("\nWind:" + wind);
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


  //Collisions...
  //Bounce function
  void bounce(float locationValue, float axis) {
    if (axis == 0) {
      location.x = locationValue;
      velocity.x = 0;
    }
    if (axis == 1) {
      location.y = locationValue;
      velocity.y = 0;
    }
  }
  void boxCollision(float x, float y, float w, float h, float frictionC) {
    //Y-Collision
    if (location.x + (size.x / 2) >= x && location.x - (size.x / 2) <= x + w) {
      //Bottom
      if (location.y - (size.y / 2) <= y + h && location.y + (size.y / 2) >= y + h) {
        bounce( y + h + (size.y / 2), 1);
        friction(frictionC, 0);
      }
      //Top
      if (location.y + (size.y / 2) >= y && location.y - (size.y / 2) <= y) {
        bounce(y - (size.y / 2), 1);
        friction(frictionC, 0);
      }
    }
    //X-Collision
    if (location.y + (size.y / 2) - 1 >= y && location.y - (size.y / 2) + 1 <= y + h) {
      //Left
      if (location.x + (size.x / 2) >= x && location.x - (size.x / 2) <= x) {
        bounce(x - (size.x / 2), 0);
        friction(frictionC, 1);
      }
      //Right
      if (location.x - (size.x / 2) <= x + w && location.x + (size.x / 2) >= x + w) {
        bounce( x + w + (size.x / 2), 0);
        friction(frictionC, 1);
      }
    }
  }
}

class testObject extends dynamicObject {
  testObject() {
    mass = 0.5;
    airConstant = 0.2;
    maxVelocity = 10;
  }
  void draw() {
    super.draw();
    noStroke();
    colorMode(RGB);
    fill(60, 120, 60);
    rect(location.x, location.y, size.x, size.y);
    //print("\nLocation: " + location);
  }
}
