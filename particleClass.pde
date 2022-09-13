class Particle extends dynamicObject {
  float lifespan;
  float radar;
  int sum;
  float factor;

  boolean alert;
  boolean nonreg;

  Particle(PVector lo, float he) {
    mass=2;
    factor=2;
    radar=40;

    location=lo;
    location.y=location.y+he/2*random(-1, 1);

    velocity=new PVector(random(-1, 1), random(-1, 1));
    velocity.mult(factor);
    size=new PVector(4, 4);

    lifespan = 255.0;

    alert=false;
    nonreg=true;
  }

  void detection(PVector po) {
    if (location.x<po.x+size.x/2 && location.x>po.x-size.y/2&&nonreg) {
      if (location.y<po.x+size.y && location.y>po.y-size.y) {
        alert=true;
        nonreg=false;
      }
    }
  }

  void physics() {
    resetAccel();
    wind();
  }

  void update(PVector po) {
    physics();
    detection(po);
    draw();
  }

  void draw() {
    super.draw();
    noStroke();
    fill(0, lifespan/2);

    if (!nonreg) {
      colorMode(RGB);
      fill(255, 0, 0, lifespan);
    }
    lifespan=lifespan-5;
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
