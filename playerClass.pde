class Player extends dynamicObject {
  //Object definitions
  float standardAccel = 0.25, jumpPower = 8;
  boolean isTouchingGround = false;

  //Textures
  PImage playerTexture;

  Player() {
    mass = 5;
    maxVelocity.x = 8;
    airConstant = 0;
    size = new PVector(60, 97);
  }

  //Color value
  PVector colorValue = new PVector(2, 230, 36);

  void update() {
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
    isTouchingGround = false;
    //println("Player location: " + location);
  }

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

  float c1 = 0, c2 = 1, c3 = 1, c4 = 0;
  void draw() {
    super.draw();
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

  //Bounce function
  void collision(float locationValue, float side) {
    super.collision(locationValue, side);
    if (side == top) {
      isTouchingGround = true;
    }
  }
}
