ArrayList<Integer> availableSaveIDs = new ArrayList<Integer>();
ArrayList<Button> saveButtons = new ArrayList<Button>();

Boolean overview = true;

ArrayList<Button> newButtons = new ArrayList<Button>();
String inputText = "";
int inputDifficulty = 1;
String inputCharacter = "";


void saveMenuSetup() {
  //Update avialableSaveIDs from database info
   availableSaveIDs = getSaves();
  //Create buttons
  for (int i = 0; i < availableSaveIDs.size(); i++) {
    int ID = availableSaveIDs.get(i);
    //Delete button
    saveButtons.add(new Button(new PVector((width / 2) + 25, (height / 3) + i * 60), new PVector(50, 50), 255, "X", () -> {
      deleteSave(ID);
    }));
    //Load button
    saveButtons.add(new SavesButton(new PVector(w/2,6.77+i*2.76+1.75/2), new PVector(8.74,1.75), nameGet(ID), () -> {
      loadSave(ID);
    }));
  }
  while (saveButtons.size() < (4 + availableSaveIDs.size())) {
    saveButtons.add(new SavesButton(new PVector(w/2,6.77 + (saveButtons.size() - availableSaveIDs.size()) * 2.76+1.75/2), new PVector(8.74,1.75), "No save", () -> {
      showSaveCreation();
    }));
  }
}

void saveMenuDraw() {
  mapBackground(global);
  
  if (overview) {
    //Show available...
    for (int i = 0; i < saveButtons.size(); i++) {
      saveButtons.get(i).update();
    }
  } else {
    //Create new:
    for (int i = 0; i < newButtons.size(); i++) {
      newButtons.get(i).update();
    }
    
    textSize(50);
    textAlign(CENTER);
    if (inputText.length() >= 16) {
      inputText = inputText.substring(0, 16);
    }
    text("Navn: " + inputText, width / 2, 200);
    textAlign(LEFT);
  }
}

void deleteSave(int ID) {
  println("ID to delete: " + ID);
}

void showSaveCreation() {
  overview = false;
  //Create save button
  newButtons.add(new Button(new PVector(width /2, height /2 - 125), new PVector(250, 50), 155, "Create new save", () -> {
    createSave(inputText, inputDifficulty, inputCharacter);
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
  newButtons.add(new Button(new PVector(width / 2, height / 2), new PVector(100, 50), 155, "Default", () -> {
    inputCharacter = "default";
  }));
}

void loadSave(int newID) {
  saveID = newID;
  //Update difficulty
  difficulty = difficultyGet(saveID);
  playerCharacter = characterGet();
  println("Loaded save with ID: " + saveID);
  if (introGet()) {
    setState("menu");
    intro = false;
  } else {
    setState("intro1");
  }
  //Wind variance thing:
  j = 480 - 120 * difficulty;
}
