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

  void update() {
    Iterator<Particle>it=particles.iterator();

    while (it.hasNext()) {
      Particle p = it.next();

      if (p.isDead()) {
        it.remove();
      }

      for (int i = 0; i < staticObjects.size(); i++) {
        checkCollision(staticObjects.get(i), p);
      }
      
      p.update();
    }
  }
}

class Particle extends dynamicObject {
  float lifespan;
  int sum;
  float factor;
  float loss;

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

    nonreg=true;
  }

  boolean detection(Animal animal) {
    if (isInside(animal, this)) {
      return true;
    }
    return false;
  }

  void physics() {
    resetAccel();
    wind();
  }

  void update() {
    physics();
    for (int i = 0; i < animals.size(); i++) {
       boolean detected = detection(animals.get(i));
       if(detected) {
        nonreg = false;
        animals.get(i).threat += 1;
       }
    }
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