class Particle extends dynamicObject {
  float lifespan;
  int sum;
  float factor;

  boolean alert;
  boolean nonreg;

  Particle(PVector lo, float he) {
    mass=2;
    factor=2;

    location=lo;
    location.y=location.y+he/2*random(-1, 1);

    velocity=new PVector(random(-1, 1), random(-1, 1));
    velocity.mult(factor);
    size=new PVector(6, 6);

    lifespan =200;

    alert=false;
    nonreg=true;
  }

  void detection(PVector po,float ra) {
    if ((location.x-po.x)*(location.x-po.x)+(location.y-po.y)*(location.y-po.y)<=ra*ra){
      alert=true;
        nonreg=false;
    }
    
    /*
    if (location.x<po.x+radar/2 && location.x>po.x-radar/2/2&&nonreg) {
      if (location.y<po.x+radar/2 && location.y>po.y-radar/2) {
        alert=true;
        nonreg=false;
      }
    }
    */
  }

  void physics() {
    resetAccel();
    wind();
  }

  void update(PVector po,float ra) {
    physics();
    detection(po,ra);
    draw();
  }

  void draw() {
    super.draw();
    noStroke();
    fill(0,lifespan);

    if (!nonreg) {
      colorMode(RGB);
      fill(180, 0, 0, lifespan);
    }
    lifespan=lifespan-2;
    ellipse(location.x, location.y, size.x, size.y);
  }

  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}
