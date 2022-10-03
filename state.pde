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
