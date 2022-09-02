class Player {
  PVector location = new PVector(0, 0);

  void update() {
    if (getInput("a")) {
      location.x -= 5;
    }
    if (getInput("d")) {
      location.x += 5;
    }
    if (getInput("w")) {
      location.y -= 5;
    }
    if (getInput("s")) {
      location.y += 5;
    }
  }



  void draw() {
    noStroke();
    colorMode(RGB);
    fill(60, 120, 60);
    ellipse(location.x, location.y, 100, 100);
  }
}
