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
