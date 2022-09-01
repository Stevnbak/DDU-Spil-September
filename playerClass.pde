class Player {
  PVector location = new PVector(0, 0);

  void update() {
    if (keyInputs[0]) {
      location.x -= 5;
    }
    if (keyInputs[1]) {
      location.x += 5;
    }
    if (keyInputs[2]) {
      location.y -= 5;
    }
    if (keyInputs[3]) {
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
