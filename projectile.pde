class Projectile extends dynamicObject {
  float startTime = 0;
  
  Design design;
  
  Projectile(PVector startLocation, float startPower, PVector startDirection,float si,int nu) {
    size=new PVector(si,si);
    design=new Design(si,nu);
    
    //mass=design.mass[nu];
    //airConstant=design.form[nu];
    
    location = startLocation.get();
    velocity = startDirection.get().mult(startPower);
    startTime = millis();
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
    float angle=velocity.heading();
    
    pushMatrix();
    translate(location.x,location.y);
    rotate(angle+PI/2);
    design.draw();
    noStroke();
    popMatrix();
  }
  
  /*
  void airResistance() {
    PVector resistance=velocity.get();
    float speed = resistance.mag();
    
    float magnitude = constant*speed*speed*drag*area;
    resistance.mult(-1);
    resistance.normalize();
    resistance.mult(magnitude);
    addForce(resistance);
  }
  
  void wind() {
  }
  */
}
