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
}
