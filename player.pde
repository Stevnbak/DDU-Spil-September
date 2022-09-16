class Player extends dynamicObject {
  //Object definitions
  float standardAccel = 0.25, jumpPower = 15;
  boolean isTouchingGround = false;
  boolean isTouchingWall = false;
  float wallJumpCooldown = 200, lastWallJump = 0, wall = 1;
  //Textures
  PImage playerTexture;

  //Constructor
  Player() {
    mass = 5;
    maxVelocity.x = 8;
    airConstant = 0;
    size = new PVector(60, 97);
    playerTexture = loadImage("player/player_stand.png");
  }

  float currentPower = 0;
  float maxPower = 30;
  int delta=1;
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
      if (isTouchingGround) 
      {
        inputs.put("w",false);
        inputs.put(" ",false);
        addForce(new PVector(0, -jumpPower));
        lastWallJump = millis();
      } else if (isTouchingWall && millis() >= lastWallJump + wallJumpCooldown) {
        inputs.put("w",false);
        inputs.put(" ",false);
        lastWallJump = millis();
        addForce(new PVector(wall * 1 * jumpPower , -jumpPower * 1));
      }
    }
    if (getInput("MLeft")) {
      currentPower=currentPower+(0.5*delta);
      if (currentPower > maxPower){
        delta =-1;
        currentPower=maxPower;
      }
      
      else if (currentPower<0){
        delta = 1;
        currentPower=0;
    }
      
    } else if (currentPower > 0) {
      shootProjectile(new PVector(mouseX + camLocation.x, mouseY + camLocation.y), currentPower);
      currentPower = 0;
    }
    isTouchingGround = false;
    isTouchingWall = false;
  }

  void physics() {
    resetAccel();
    gravity();
  }


  //Animations
  int frameTime = 0, anim = 2;
  void animations() {
    if (isTouchingGround == false) {
      if (velocity.y < 0) {
        playerTexture = loadImage("player/player_jump.png");
      } else {
        playerTexture = loadImage("player/player_fall.png");
      }
    } else if (getInput("d") || getInput("a")) {
      if (frameTime < millis()) {
        if (anim == 1) anim = 2;
        else if (anim == 2) anim =1;
        playerTexture = loadImage("player/player_walk" + anim+ ".png");
        frameTime = millis() + 100;
      }
    } else if (velocity.x < -0.5 || velocity.x > 0.5) {
      playerTexture = loadImage("player/player_slide.png");
    } else {
      playerTexture = loadImage("player/player_stand.png");
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
    if (getInput("MLeft")) {
      aimProjectile(new PVector(mouseX + camLocation.x, mouseY + camLocation.y), currentPower);
    }

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
    if(side == right) {
      isTouchingWall = true;
      wall = 1;
    }
    if(side == left) {
      isTouchingWall = true;
      wall = -1;
    }
  }

  //Shooting
  void shootProjectile(PVector targetLocation, float power) {
    //println("Shooting... with power: " + power);
    PVector direction = new PVector(targetLocation.x - location.x, targetLocation.y - location.y);
    direction.normalize();
    Projectile newProj = new Projectile(location.get(), power, direction.get(), 8, 2);
    dynamicObjects.add(newProj);
  }
  
  //Aiming
  void aimProjectile(PVector targetLocation, float power) {
    PVector direction = new PVector(targetLocation.x - location.x, targetLocation.y - location.y);
    direction.normalize();
    direction.mult(2.5);
    float d=8;
    float s=3;

    for (int i=0; i<=power/s; i++)
    {
      fill(55);
      if (i==power/s-(power/s%1))
      {
        ellipse(location.x+direction.x*d*i, location.y+direction.y*d*i, d, d);

        float posx, posy, radius = d/2, ang, dang=0.01, percentage=(power/s)%1;
        pushMatrix();
        translate(location.x+direction.x*d*(i+1), location.y+direction.y*d*(i+1));
        if (percentage>0.5) {
          rotate(direction.heading()-PI);
          ang = 0;
          beginShape();
          noStroke();
          for ( int n = 0; n <= 360; n++) {
            posx = radius * sin(ang);
            posy = radius * cos(ang);
            if ( sin(ang) >0 && sin(ang) < 1 ) {
              vertex(posx, posy);
            }
            ang += dang;
          }
          endShape(CLOSE);

          if (percentage-0.5>0) {
            rotate(PI);
            ang = 0;
            beginShape();
            noStroke();
            for ( int n = 0; n <= 360; n++) {
              posx = radius * sin(ang);
              posy = radius * cos(ang);
              if ( sin(ang) >0 && sin(ang) < 2*percentage-1 ) {
                vertex(posx, posy);
              }
              ang += dang;
            }
            endShape(CLOSE);
          }
        } else {
          rotate(direction.heading()-PI);
          ang = 0;
          beginShape();
          noStroke();
          for ( int n = 0; n <= 360; n++) {
            posx = radius * sin(ang);
            posy = radius * cos(ang);
            if ( sin(ang) >1-(percentage*2) && sin(ang) < 1 ) {
              vertex(posx, posy);
            }
            ang += dang;
          }
          endShape(CLOSE);
        }
        popMatrix();
      } else {
        ellipse(location.x+direction.x*d*i, location.y+direction.y*d*i, d, d);
      }
    }
  }
}
