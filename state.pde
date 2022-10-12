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

    println("State (" + state +") changed to " + newState);
    state = newState;

    if( newState == "deathSuicide" || newState == "deathDrowned") deathSet(deathGet(saveID) + 1);deathCountID=deathGet(saveID);
    println(deathGet(saveID) + 1);

    if (newState == "menu" || newState == "1" || newState == "2" || newState == "3") refreshLevelInfo();
    if (newState == "editor") editorSetup();
    if (newState == "save") saveMenuSetup();
  } else {
    println("State (" + newState + ") is not allowed as a state...");
  }
}
