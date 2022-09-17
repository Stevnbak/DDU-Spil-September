class Button {
  PVector location;
  PVector size;
  color colorValue;
  String text;
  PFont font;
  boolean hover = false;
  Runnable action;

  Button(PVector location, PVector size, color colorValue, String text, Runnable run) {
    this.location = location.get();
    this.size = size.get();
    this.colorValue = colorValue;
    this.text = text;
    this.action = run;
    this.font = createFont("Arial", size.y / 4 * 3, true);
  }

  void update() {
    //Mouse hover?
    hover();

    //Click?
    if (getInput("MLeft")) {
      if (hover) {
        action.run();
        inputs.put("MLeft", false);
      }
    }

    //Draw button
    draw();
  }

  void draw() {
    fill(colorValue);
    if (hover) {
      stroke(0);
    } else {
      noStroke();
    }
    rect(location.x + camLocation.x, location.y + camLocation.y, size.x, size.y);
    fill(0);
    noStroke();
    //textFont(font);
    text(text, location.x + camLocation.x - textWidth(text) / 2, location.y + camLocation.y + (textHeight(text) / 2));
  }

  void hover() {
    if (mouseX >= location.x - (size.x / 2) && mouseX <= location.x + (size.x / 2) && mouseY >= location.y - (size.y / 2) && mouseY <= location.y + (size.y / 2)) {
      hover = true;
    } else {
      hover = false;
    }
  }


  float textHeight(String txt) {
    float minY = Float.MAX_VALUE;
    float maxY = Float.NEGATIVE_INFINITY;
    for (Character c : txt.toCharArray()) {
      PShape character = font.getShape(c);
      for (int i = 0; i < character.getVertexCount(); i++) {
        minY = min(character.getVertex(i).y, minY);
        maxY = max(character.getVertex(i).y, maxY);
      }
    }
    final float textHeight = maxY - minY;
    return textHeight;
  }
}

class LocationButton extends Button {
  LocationButton(PVector newLocation, float radius, Runnable run) {
    super(new PVector(newLocation.x / w * width, newLocation.y / h * height), new PVector(radius/h*height * 2, radius/h*height * 2), color(221, 0, 0), "", run);
  }
  
  void update() {
    hover();
    if (getInput("MLeft")) {
      if (hover) {
        action.run();
        inputs.put("MLeft", false);
        ongoing=true;
      }
    }
  }
  
  void draw() {
    float radius = size.x;
    if (hover) {
      radius += 10;
    }
    noStroke();
    float h = 0;
    for (int r = (int)radius; r > 0; --r) {
      fill(221, 0, 0, h);
      ellipse(location.x, location.y, r, r);
      h += radius / (255);
    }
    fill(0);
    //textFont(font);
    text(text, location.x - textWidth(text) / 2, location.y + (textHeight(text) / 2));
  }
}
