class Button {
  PVector location;
  PVector size;
  color colorValue;
  String text;
  PFont font;
  boolean hover = false;
  boolean finished=false;
  Runnable action;

  Button(PVector location, PVector size, color colorValue, String text, Runnable run) {
    this.location = location.get();
    this.size = size.get();
    this.colorValue = colorValue;
    this.text = text;
    this.action = run;
    this.font = createFont("Arial", size.y / 4 * 3, true);
  }
  
  void alter(){
    finished=true;
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
    rect(location.x, location.y, size.x, size.y);
    fill(0);
    noStroke();
    //textFont(font);
    textSize(size.y / 4 * 3);
    textAlign(CENTER, CENTER);
    text(text, location.x , location.y );
    textAlign(LEFT);
  }

  void hover() {
    if (mouseX >= location.x - (size.x / 2) && mouseX <= location.x + (size.x / 2) && mouseY >= location.y - (size.y / 2) && mouseY <= location.y + (size.y / 2)) {
      hover = true;
    } else {
      hover = false;
    }
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
    float diameter = size.x;
    int maximum=210;
    if (hover) {
      diameter += 20;
    }
    
    noFill();
    strokeWeight(diameter/maximum);

    for (int i=0; i<maximum; i++) {
      if (!finished) {
        stroke(192, 0, 0, i);
      } else {
        stroke(0,176,80,i);
      }

      ellipse(location.x, location.y, diameter-diameter*i/maximum, diameter-diameter*i/maximum);
    }
    noStroke();
  }
}

class SavesButton extends Button {
  SavesButton(PVector location, PVector size, String text, Runnable run) {
    super(location, size, 155, text, run);
  }
  void draw() {
    fill(colorValue);
    if (hover) {
      stroke(0);
    } else {
      noStroke();
    }
    rect(location.x, location.y, size.x, size.y);
    fill(0);
    noStroke();
    //textFont(font);
    textSize(size.y / 4 * 3);
    textAlign(CENTER, CENTER);
    text(text, location.x, location.y);
    textAlign(LEFT);
  }
}
