
import java.util.Iterator;

class ParticleSystem {
  ArrayList<Particle> particles;
  int level;

  ParticleSystem() {
    particles=new ArrayList<Particle>();
    level=0;
  }

  void addParticle(PVector lo,float he) {
    particles.add(new Particle(lo,he));
  }

  void update(PVector po) {
    Iterator<Particle>it=particles.iterator();

    while (it.hasNext()) {
      Particle p=it.next();
      
      if (p.alert){
        level++;
        p.alert=false;
      }
      
      if (p.isDead()) {
        it.remove();
      }
      
      p.update(po);
      p.draw();
    }
  }
}
