public ArrayList<button> menuButtons = new ArrayList<button>();

public void menuDraw() {
  //Draw background
  frameBackground();
  //Text
  fill(0);
  textSize(128);
  text("Menu", 40, 120); 
  //Display buttons
  for (int i = 0; i < menuButtons.size(); i++) {
    menuButtons.get(i).update();
  }
}
public void menuSetup() {
    //Create buttons
    menuButtons.add(new button(new PVector(100, 200), new PVector(200, 50), color(155, 155, 0), "Play", () -> {println("Play");}));
    menuButtons.add(new button(new PVector(100, 300), new PVector(200, 50), color(155, 0, 155), "Options", () -> {println("Options");}));
    menuButtons.add(new button(new PVector(100, 400), new PVector(200, 50), color(0, 155, 155), "Exit", () -> {println("Exit");}));
}

class button {
    PVector location;
    PVector size;
    color colorValue;
    String text;
    PFont font;
    boolean hover = false;
    Runnable action;

    button(PVector location, PVector size, color colorValue, String text, Runnable run) {
        this.location = location;
        this.size = size;
        this.colorValue = colorValue;
        this.text = text;
        this.action = run;
        this.font = createFont("Arial", size.y / 4 * 3, true);
    }

    void update() {
        //Mouse hover?
        hover();
        
        //Click?
        if(getInput("MLeft")) {
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
        if(hover) {
            stroke(0);
        } else {
            noStroke();
        }
        rect(location.x, location.y, size.x, size.y);
        fill(0);
        noStroke();
        textFont(font);
        text(text, location.x - textWidth(text) / 2, location.y + (textHeight(text) / 2));
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
            PShape character = font.getShape(c); // create character vector
            for (int i = 0; i < character.getVertexCount(); i++) {
                minY = min(character.getVertex(i).y, minY);
                maxY = max(character.getVertex(i).y, maxY);
            }
        }
        final float textHeight = maxY - minY;
        return textHeight;
    }
}