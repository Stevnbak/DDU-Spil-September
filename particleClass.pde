
class Particle extends dynamicObject {
  float lifespan;
  int sum;

  boolean alert;
  boolean nonreg;

  Particle(PVector lo, float he) {
    mass=0.5;

    location=lo;
    location.y=location.y+he/2*random(-1, 1);

    velocity=new PVector(random(-1, 1), random(-1, 1));
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
    //Collisions
    for (int i = 0; i < objects.length; i++) {
      boxCollision(objects[i].location.x - objects[i].size.x / 2, objects[i].location.y - objects[i].size.y/2, objects[i].size.x, objects[i].size.y);
    }
  }

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

  void boxCollision(float x, float y, float w, float h) {
    if (location.x + (size.x / 2) >= x && location.x - (size.x / 2) <= x + w) {
      if (location.y - (size.y / 2) <= y + h && location.y + (size.y / 2) >= y + h) {
        bounce( y + h + (size.y / 2), 1);
      }
      if (location.y + (size.y / 2) >= y && location.y - (size.y / 2) <= y) {
        bounce(y - (size.y / 2), 1);
      }
    }
    if (location.y + (size.y / 2) - 1 >= y && location.y - (size.y / 2) + 1 <= y + h) {
      if (location.x + (size.x / 2) >= x && location.x - (size.x / 2) <= x) {
        bounce(x - (size.x / 2), 0);
      }
      if (location.x - (size.x / 2) <= x + w && location.x + (size.x / 2) >= x + w) {
        bounce( x + w + (size.x / 2), 0);
      }
    }
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
