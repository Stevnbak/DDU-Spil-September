public String state;
String[] availableStates = {"playing", "designing", "loading", "save", "menu", "complete", "editor","intro1","intro2","intro3","intro4","intro5","intro6","intro7","intro8","intro9","1","2","3","deathSuicide","deathDrowned","pause"};

boolean isAvailable(String[] arr, String val) {
  for (int i = 0; i < arr.length; i++) {
    if (arr[i] == val) {
      return true;
    }
  }
  return false;
}

public void setState(String newState) {
  if (isAvailable(availableStates, newState)) {
    if (newState == state) return;
    Danmarkskort1 = loadImage("navigation/Danmarkskort1.png");
    Danmarkskort2 = loadImage("navigation/Danmarkskort2.jpeg");
    zo1P = loadImage("navigation/zo1.png");
    zo2P = loadImage("navigation/zo2.png");
    zo3P = loadImage("navigation/zo3.png");

    
    dejaRegular=createFont("fonts/dejaRegular.ttf", 16);
    dejaItalic=createFont("fonts/dejaItalic.ttf", 16);
    dejaBold=createFont("fonts/dejaBold.ttf", 16);
    dejaBoldItalic=createFont("fonts/dejaBoldItalic.ttf", 16);
    dejaBoldLarge=createFont("fonts/dejaBold.ttf", 24);
    
    white = color(255,255,255);
    orange = color(216,101,16);
    blue = color(0,176,241);
    red = color(217,17,57);
    yellow = color(227,215,113);
    green = color(0,176,80);

    if (state == "playing") {
      saveFrame("data/game/frame.png");
      lastFrame = loadImage("game/frame.png");
    }
    
    if (newState == "editor") editorSetup();
    if(newState == "save") saveMenuSetup();
    state = newState;
  } else {
    println("State (" + newState + ") is not allowed as a state...");
  }
}
