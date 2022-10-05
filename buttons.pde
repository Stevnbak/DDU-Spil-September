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
        ownAction();
        action.run();
        inputs.put("MLeft", false);
      }
    }

    //Draw button
    draw();
  }

  void ownAction() {

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

  boolean finished=false;

  LocationButton(PVector newLocation, float radius, Runnable run) {
    super(new PVector(newLocation.x / w * width, newLocation.y / h * height), new PVector(radius/h*height * 2, radius/h*height * 2), color(221, 0, 0), "", run);
  }


  void alter(){
    finished=true;
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

class CharacterButton extends Button {

  boolean selected = false;
  PImage characterImg;

  CharacterButton(PVector newLocation, float w, String text, Runnable run) {
    super(new PVector(newLocation.x,newLocation.y), new PVector(w, w * 1.6), 15, text, run);
    characterImg = loadImage("/player/"+text+"/stand.png");
  }

  void ownAction() {
    for (int i = 0; i < charButtons.size(); i++) {
      charButtons.get(i).selected = false;
    }
    selected = true;
  }

  void draw() {
    colorMode(RGB);
    if (hover) {
      stroke(0);
    }
    if (selected) {
      stroke(0,200,50);
    }
    textureMode(NORMAL);
    fill(0,0,0,0);
    rect(location.x, location.y, size.x, size.y);
    
    noStroke();
    beginShape();
      texture(characterImg);
      vertex(location.x - size.x/2, location.y - size.y/2, 0, 0);
      vertex(location.x + size.x/2, location.y - size.y/2, 1, 0);
      vertex(location.x + size.x/2, location.y + size.y/2, 1, 1);
      vertex(location.x - size.x/2, location.y + size.y/2, 0, 1);
    endShape();
    noStroke();
  }
}

class SavesButton extends Button {
  SavesButton(PVector newLocation, PVector newSize, String text, Runnable run) {
    super(new PVector(newLocation.x/w*width,newLocation.y/h*height), new PVector(newSize.x/w*width,newSize.y/h*height), 15, text, run);
  }
  void draw() {
    fill(colorValue);
    if (hover) {
      size.x+=6;
      size.y+=6;
      rect(location.x, location.y, size.x, size.y);
      size.x-=6;
      size.y-=6;
    } else {
      rect(location.x, location.y, size.x, size.y);
    }
    
    String[] text={"Filip\n33%"};
    int[] lines={2};
    PFont[] fonts={dejaBold10};
    color[] colors={white};
    
    textTerminala(text, colors, lines, fonts, new PVector(location.x-(size.x/2)+size.y/6,location.y-(size.y/3)), size, 0);
    
     String[] text1={"|||"};
    int[] lines1={1};
    PFont[] fonts1={dejaBold};
    color[] colors1={red };
    
    textTerminala(text1, colors1, lines1, fonts1, new PVector(location.x+(size.x/2)+size.y/6,location.y-(size.y/3)), size, 0);
    
    /*
    noStroke();
    //textFont(font);
    textSize(size.y / 4 * 3);
    textAlign(CENTER, CENTER);
    text(text, location.x, location.y);
    textAlign(LEFT);
    */
  }
}
