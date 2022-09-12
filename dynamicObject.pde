class dynamicObject {
  PVector location = new PVector(0, 0);
  PVector velocity = new PVector(0, 0);
  PVector acceleration = new PVector(0, 0);
  PVector size = new PVector(20, 20);
  float mass, airConstant;

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

  void draw() {
    registerMethod("draw", this);
  }
}

class testObject extends dynamicObject {
    testObject() {
        mass = 0.5;
        airConstant = 0.2;

    }
    void draw() {
        //registerMethod("draw", this);
        super.draw();
        noStroke();
        colorMode(RGB);
        fill(60, 120, 60);
        rect(location.x, location.y, size.x, size.y);
        print("\nLocation: " + location);
    }
}
