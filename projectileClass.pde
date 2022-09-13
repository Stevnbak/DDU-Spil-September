class Projectile extends dynamicObject {
  int n;
  float startTime = 0;
  Projectile(PVector startLocation, float startPower, PVector startDirection,float si,int nu) {
    location = startLocation.get();
    velocity = startDirection.get().mult(startPower);
    airConstant = 0;
    startTime = millis();
    size=new PVector(si,si);
    n=nu;
  }

  void collision(float locationValue, int side) {
    dynamicObjects.remove(this);
  }

  void draw() {
    //Collision?
    for (int i = 0; i < animals.size(); i++) {
      boolean inside = isInside(this, animals.get(i));
      if(inside) {
        //Hit animal
        println("Hit animal");
      }
    }
    if (isInside(this, player)) {
      if(millis() > startTime + 500) {
        println("Dead!");
        exit();
      }
    }
    super.draw();
    //println("Velocity: " + velocity);
    Design arrow=new Design(size.x,n);
    float angle=velocity.heading();
    
    pushMatrix();
    translate(location.x,location.y);
    rotate(angle+PI/2);
    arrow.draw();
    stroke(55);
    strokeWeight(size.x/3);
    line(-size.x/2, 0, 0, size.x*4);
    noStroke();
    popMatrix();
  }
}
