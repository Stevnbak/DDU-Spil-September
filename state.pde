public String state;
String[] availableStates = {"playing", "designing", "loading", "menu", "complete", "editor"};

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
    if(newState == state) return;
    if(state == "playing") {
        saveFrame("data/game/frame.png");
        lastFrame = loadImage("game/frame.png");
    }
    if(newState == "editor") editorSetup();
    state = newState;
  } else {
    println("State (" + newState + ") is not allowed as a state...");
  }
}
