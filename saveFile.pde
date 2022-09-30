ArrayList<Integer> availableSaveIDs = new ArrayList<Integer>();
ArrayList<SavesButton> saveButtons = new ArrayList<SavesButton>();

Boolean overview = true;

ArrayList<Button> newButtons = new ArrayList<Button>();
String inputText = "";
int inputDifficulty = 1;


void saveMenuSetup() {
  //Update avialableSaveIDs from database info
  availableSaveIDs.add(1);
  availableSaveIDs.add(2);//Remove for actual data...
  //Create buttons
  for (int i = 0; i < availableSaveIDs.size(); i++) {
    int ID = availableSaveIDs.get(i);
    saveButtons.add(new SavesButton(new PVector((width / 2) - 50, (height / 3) + i * 60), new PVector(100, 50), nameGet(ID), () -> {
      loadSave(ID);
    }
    ));
  }
  while (saveButtons.size() < 4) {
    saveButtons.add(new SavesButton(new PVector((width / 2) - 50, (height / 3) + (saveButtons.size()) * 60), new PVector(100, 50), "No save", () -> {
      showSaveCreation();
    }
    ));
  }
}

void saveMenuDraw() {
  background(255);
  if (overview) {
    //Show available...
    for (int i = 0; i < saveButtons.size(); i++) {
      saveButtons.get(i).update();
    }
  } else {
    //Create new:
    pushMatrix();
    translate(-camLocation.x, -camLocation.y);
    for (int i = 0; i < newButtons.size(); i++) {
      newButtons.get(i).update();
    }
    popMatrix();
    
    textSize(20);
    textAlign(CENTER);
    if (inputText.length() >= 16) {
      inputText = inputText.substring(0, 16);
    }
    text("Navn: " + inputText, width / 2, 200);
    textAlign(LEFT);
  }
}

void showSaveCreation() {
  overview = false;
  //Create save button
  newButtons.add(new Button(new PVector(width /2, height /2), new PVector(250, 50), 155, "Create new save", () -> {
    createSave(inputText, inputDifficulty);
    loadSave(saveID);
  }));
  //Create difficulty buttons
  newButtons.add(new Button(new PVector(width /2 - 125, height /3), new PVector(100, 50), 155, "Easy", () -> {
    inputDifficulty = 0;
    newButtons.get(1).colorValue = color(0,255,0);
    newButtons.get(2).colorValue = 155;
    newButtons.get(3).colorValue = 155;
  }));
  newButtons.add(new Button(new PVector(width /2, height /3), new PVector(100, 50), color(0,255,0), "Medium", () -> {
    inputDifficulty = 1;
    newButtons.get(2).colorValue = color(0,255,0);
    newButtons.get(1).colorValue = 155;
    newButtons.get(3).colorValue = 155;
  }));
  newButtons.add(new Button(new PVector(width /2 + 125, height /3), new PVector(100, 50), 155, "Hard", () -> {
    inputDifficulty = 2;
    newButtons.get(3).colorValue = color(0,255,0);
    newButtons.get(2).colorValue = 155;
    newButtons.get(1).colorValue = 155;
  }));
}

void loadSave(int newID) {
  saveID = newID;
  println("Loaded save with ID: " + saveID);
  if (introGet()) {
    setState("menu");
  } else {
    setState("intro1");
  }
}
