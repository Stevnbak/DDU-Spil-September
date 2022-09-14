import java.util.Iterator;

class ParticleSystem {
  ArrayList<Particle> particles;
  int amount;

  ParticleSystem() {
    particles=new ArrayList<Particle>();
    amount=0;
  }

  void addParticle(PVector lo, float he, int fr) {
    if (frameCount % fr==0)
    {
      particles.add(new Particle(lo.get(), he));
    }
  }

  void update(PVector po, float ra) {
    Iterator<Particle>it=particles.iterator();

    while (it.hasNext()) {
      Particle p = it.next();

      if (p.alert) {
        amount++;
        p.alert=false;
      }

      if (p.isDead()) {
        it.remove();
      }

      for (int i = 0; i < staticObjects.size(); i++) {
        checkCollision(staticObjects.get(i), p);
      }
      
      p.update(po, ra);
    }
  }
}

class Particle extends dynamicObject {
  float lifespan;
  int sum;
  float factor;
  float loss;

  boolean alert;
  boolean nonreg;

  Particle(PVector lo, float he) {
    mass=2;
    factor=2;
    loss=-0.4;

    location=lo;
    location.y=location.y+he/2*random(-1, 1);

    velocity=new PVector(random(-1, 1), random(-1, 1));
    velocity.mult(factor);
    size=new PVector(6, 6);

    lifespan =200;

    alert=false;
    nonreg=true;
  }

  void detection(PVector po, float ra) {
    if ((location.x-po.x)*(location.x-po.x)+(location.y-po.y)*(location.y-po.y)<=ra*ra) {
      alert=true;
      nonreg=false;
    }
  }

  void physics() {
    resetAccel();
    wind();
  }

  void update(PVector po, float ra) {
    physics();
    detection(po, ra);
    draw();
  }

  void draw() {
    super.draw();
    noStroke();
    fill(0, lifespan);

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

  void collision(float locationValue, int side) {
    if (side == left || side == right) {
      location.x = locationValue;
      velocity.x = velocity.x*loss;
    }
    if (side == bottom || side == top) {
      location.y = locationValue;
      velocity.y = velocity.y*loss;
    }
  }

  void friction(float frictionC, float axis) {
  }
}