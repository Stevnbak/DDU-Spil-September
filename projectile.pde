class Projectile extends dynamicObject {
  float startTime = 0;
  float area;
  Design design;

  Projectile(PVector startLocation, float startPower, PVector startDirection, float si, int nu) {
    size=new PVector(si, si);
    design=new Design(si, nu);

    //mass=design.mass[nu];
    //airConstant=design.form[nu];
    
    //gotta fix
    //up area, more airresistance,
    area=1.5;
    //more mass, less airresistance
    mass=0.06;
    airConstant = 0.0022;

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
      if (inside) {
        //Hit animal
        animals.get(i).health -= 50;
        dynamicObjects.remove(this);
        continue;
      }
    }

    super.draw();
    //println("Velocity: " + velocity);
    float angle=velocity.heading();

    pushMatrix();
    translate(location.x, location.y);
    rotate(angle+PI/2);
    design.draw();
    noStroke();
    popMatrix();
  }
  
   void airResistance() {
    PVector wind=currentLevel.wind.get();
    
    PVector drag=velocity.get();
    drag.mult(-1);
    drag.add(wind.mult(100));
    float magnitude=drag.mag()*drag.mag()*airConstant*area;
    drag.normalize();
    
    addForce(drag.mult(magnitude));
  }
  
  void gravity() {
    PVector gravity = new PVector(0, 8);
    addForce(gravity.mult(mass));
  }

  void physics() {
    resetAccel();
    gravity();
    airResistance();
    
    if (isInside(this, player)) {
      if (millis() > startTime + 500) {
        t=0;
        ongoing=true;
        intro=false;
        killed=0;
        escaped=0;
        setState("deathSuicide");
      }
    }
  }
}
