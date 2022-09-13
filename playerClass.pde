class Player extends dynamicObject {
  //Object definitions
  float standardAccel = 0.25, jumpPower = 8;
  boolean isTouchingGround = false;

  //Textures
  PImage playerTexture;

  //Constructor
  Player() {
    mass = 5;
    maxVelocity.x = 8;
    airConstant = 0;
    size = new PVector(60, 97);
  }

  float currentPower = 0;
  float maxPower = 30;
  //Update function
  void update() {
    //Physics...
    physics();
    //Textures
    animations();

    //Inputs
    if (getInput("a")) {
      addForce(new PVector(-standardAccel, 0));
    }
    if (getInput("d")) {
      addForce(new PVector(standardAccel, 0));
    }
    if (getInput("w") || getInput(" ")) {
      if (isTouchingGround) addForce(new PVector(0, -jumpPower));
    }
    if(getInput("MLeft")) {
      currentPower += 1;
      if (currentPower > maxPower) currentPower = maxPower;
    } else if(currentPower > 0) {
      shootProjectile(new PVector(mouseX + camLocation.x, mouseY + camLocation.y), currentPower);
      currentPower = 0;
    }
    isTouchingGround = false;
    //println("Player location: " + location);
  }

  //Animations
  int frameTime = 0, anim = 2;
  void animations() {
    if (isTouchingGround == false) {
      if (velocity.y < 0) {
        playerTexture = loadImage("player_jump.png");
      } else {
        playerTexture = loadImage("player_fall.png");
      }
    } else if (velocity.x < -0.2 || velocity.x > 0.2) {
      if (frameTime < millis()) {
        if (anim == 1) anim = 2;
        else if (anim == 2) anim =1;
        playerTexture = loadImage("player_walk" + anim+ ".png");
        frameTime = millis() + 100;
      }
    } else {
      playerTexture = loadImage("player_stand.png");
    }
  }

  //Draw
  float c1 = 0, c2 = 1, c3 = 1, c4 = 0;
  void draw() {
    //Update location...
    velocity.add(acceleration.mult(mass));
    if (maxVelocity.x > -1) velocity.x = constrain(velocity.x, -maxVelocity.x, maxVelocity.x);
    if (maxVelocity.y > -1) velocity.y = constrain(velocity.y, -maxVelocity.y, maxVelocity.y);
    location.add(velocity);
    //Draw...
    noStroke();
    colorMode(RGB);
    textureMode(NORMAL);
    beginShape();
    texture(playerTexture);
    if (getInput("d")) {
      c1 = 0;
      c2 = 1;
      c3 = 1;
      c4 = 0;
    } else if (getInput("a")) {
      c1 = 1;
      c2 = 0;
      c3 = 0;
      c4 = 1;
    }
    vertex(location.x - size.x/2, location.y - size.y/2, c1, 0);
    vertex(location.x + size.x/2, location.y - size.y/2, c2, 0);
    vertex(location.x + size.x/2, location.y + size.y/2, c3, 1);
    vertex(location.x - size.x/2, location.y + size.y/2, c4, 1);
    endShape();
  }

  //Collision function
  void collision(float locationValue, int side) {
    super.collision(locationValue, side);
    if (side == top) {
      isTouchingGround = true;
    }
  }

  //Shooting
  void shootProjectile(PVector targetLocation, float power) {
    //println("Shooting... with power: " + power);
    PVector direction = new PVector(targetLocation.x - location.x, targetLocation.y - location.y);
    direction.normalize();
    Projectile newProj = new Projectile(location.get(), power, direction.get());
    dynamicObjects.add(newProj);
  }
}

class Projectile extends dynamicObject {

  float startTime = 0;
  Projectile(PVector startLocation, float startPower, PVector startDirection) {
    location = startLocation.get();
    velocity = startDirection.get().mult(startPower);
    airConstant = 0;
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
    noStroke();
    colorMode(RGB);
    fill(155,155,0);
    rect(location.x, location.y, size.x, size.y);
  }
}
