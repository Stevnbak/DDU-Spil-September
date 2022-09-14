public String state;
String[] availableStates = {"playing", "designing", "loading", "menu", "complete", "editor","intro"};

boolean isAvailable(String[] arr, String val) {
  for (int i = 0; i < arr.length; i++) {
    if (arr[i] == val) {
      return true;
    }
  }
  return false;
}

public void setState(String newState) {
  Danmarkskort1 = loadImage("navigation/Danmarkskort1.png");
  Danmarkskort2 = loadImage("navigation/Danmarkskort2.jpeg");
  dejaRegular=createFont("fonts/dejaRegular.ttf", 16);
  dejaItalic=createFont("fonts/dejaItalic.ttf", 16);
  dejaBold=createFont("fonts/dejaBold.ttf", 16);
  dejaBoldItalic=createFont("fonts/dejaBoldItalic.ttf", 16);
  
  white=color(255,255,255);
  orange=color(216,101,16);

  if (isAvailable(availableStates, newState)) {
    if (newState == state) return;
    if (state == "playing") {
      saveFrame("data/game/frame.png");
      lastFrame = loadImage("game/frame.png");
    }
    if (newState == "editor") editorSetup();
    state = newState;
  } else {
    println("State (" + newState + ") is not allowed as a state...");
  }
}
