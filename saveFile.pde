ArrayList<Integer> availableSaveIDs = new ArrayList<Integer>();
ArrayList<Button> saveButtons = new ArrayList<Button>();

Boolean overview = true;

ArrayList<Button> newButtons = new ArrayList<Button>();
ArrayList<CharacterButton> charButtons = new ArrayList<CharacterButton>();
String inputText = "";
int inputDifficulty = 1;
String inputCharacter = "";

void saveMenuSetup() {
  //Update avialableSaveIDs from database info
  availableSaveIDs = getSaves();
  //Reset buttons
  saveButtons = new ArrayList<Button>();
  newButtons = new ArrayList<Button>();
  charButtons = new ArrayList<CharacterButton>();
  inputText = "";
  inputDifficulty = 1;
  inputCharacter = "";
  //Create buttons
  for (int i = 0; i < availableSaveIDs.size(); i++) {
    int ID = availableSaveIDs.get(i);
    //Delete button
    saveButtons.add(new Button(new PVector((w/2+5)/w*width,(6.77+i*2.76+1.75/2-0.15)/h*height), new PVector(50,1.75/h*height), 255, "x", () -> {
      deleteSave(ID);
    }));
    //Load button
    int percent = 0;
    int time=0;
    for(int l = 1; l <= 3; l++) {
      int[] data = specLevelGet(ID, l);
      if (data[0] > 0 && data[1] < 5 - difficulty) {
        percent += 33;
      }
      time=time+data[2]/1000;
    }

    saveButtons.add(new SavesButton(new PVector(w/2,6.77+i*2.76+1.75/2), new PVector(8.74,1.75), nameGet(ID) + "\n" + percent + "%   " + deathGet(ID)+"†   "+time+"s", difficultyGet(ID), () -> {
      loadSave(ID);
      nameID=nameGet(saveID);
    }));
  }
  while (saveButtons.size() < (4 + availableSaveIDs.size())) {
    saveButtons.add(new SavesButton(new PVector(w/2,6.77 + (saveButtons.size() - availableSaveIDs.size()) * 2.76+1.75/2), new PVector(8.74,1.75), "No save", 4, () -> {
      showSaveCreation();
    }));
  }
}

public boolean MD=true;

void saveMenuDraw() {
  
  if (overview) {
    mapBackground(global);
    //Show available...
    for (int i = 0; i < saveButtons.size(); i++) {
      saveButtons.get(i).update();
    }
  } else {
     mapBackground(global2);
    //Create new:
    for (int i = 0; i < newButtons.size(); i++) {
      newButtons.get(i).update();
    }
    for (int i = 0; i < charButtons.size(); i++) {
      charButtons.get(i).update();
    }
    fill(0,240);
    rectMode(CORNER);
    rect(12.44/w*width,3.84/h*height,8.74/w*width,1.76/h*height);
    
    if (inputText.length() >= 16) {
      inputText = inputText.substring(0, 16);
    }
    
    String[] texts=new String[1];
    if (MD){
      texts[0]="Brugernavn:\n"+inputText+"|";
    }
    else{
      texts[0]="Brugernavn:\n"+inputText;
    }
    
    color[] colours={white};
    int[] lines={2};
    PFont[] fonts={dejaBold10};
    
    PVector corner=new PVector(12.44+0.3,3.84+0.3);
    PVector size=new PVector(8.74,h);
    
    textTerminal(texts,colours,lines,fonts,corner,size,0);
    
    int[] linesd={1};
    String[] textsd={"   Let        Normal       Svær"};
    
    PVector cornerd=new PVector(12.44+0.3,3.84+0.3+2.93+0.3);

    textTerminal(textsd,colours,linesd,fonts,cornerd,size,0);


    if (frameCount%45==0){
      MD=!MD;
    }
    
    PVector corner1=new PVector(12.44+0.3,3.84+0.3+11.5);
    String[] textsc={"              Bekræft"};
    textTerminal(textsc,colours,lines,fonts,corner1,size,0);
    
  }
}

void deleteSave(int ID) {
  println("ID to delete: " + ID);
  removeSave(ID);
  saveMenuSetup();
}

void showSaveCreation() {
  overview = false;
  //Create save button
  newButtons.add(new SavesButton(new PVector(w/2,6.77+3*2.76+1.75/2), new PVector(8.74,1.75), "Bekræft", -1, () -> {
    createSave(inputText, inputDifficulty, inputCharacter);
    loadSave(saveID);
    nameID=nameGet(saveID);
  }));
  //Create difficulty buttons
  newButtons.add(new Button(new PVector((13.9+2.88*0)/w*width,7.66/h*height), new PVector(2.91/w*width,1.81/h*height), 24, "", () -> {
    inputDifficulty = 0;
    newButtons.get(1).colorValue = color(dgreen);
    newButtons.get(2).colorValue =24;
    newButtons.get(3).colorValue = 24;
  }));
  newButtons.add(new Button(new PVector((13.9+2.88*1)/w*width,7.66/h*height), new PVector(2.91/w*width,1.81/h*height), dyellow, "", () -> {
    inputDifficulty = 1;
    newButtons.get(2).colorValue = color(dyellow);
    newButtons.get(1).colorValue = 24;
    newButtons.get(3).colorValue = 24;
  }));
  newButtons.add(new Button(new PVector((13.9+2.88*2)/w*width,7.66/h*height), new PVector(2.91/w*width,1.81/h*height), 24, "", () -> {
    inputDifficulty = 2;
    newButtons.get(3).colorValue = color(dred);
    newButtons.get(2).colorValue = 24;
    newButtons.get(1).colorValue = 24;
  }));
  //Ad character butttons
  charButtons.add(new CharacterButton(new PVector(width/2-4.38/2/w*width,13.55/h*height), 60, "default", () -> {
    inputCharacter = "default";
    
    charButtons.get(0).characterImg=loadImage("player/default/stand.png");
    charButtons.get(1).characterImg=loadImage("player/female/standg.png");
    charButtons.get(2).characterImg=loadImage("player/adventurer/standg.png");
    charButtons.get(3).characterImg=loadImage("player/zombie/standg.png");
    charButtons.get(4).characterImg=loadImage("player/soldier/standg.png");
  }));
  charButtons.add(new CharacterButton(new PVector(width/2+4.38/2/w*width,13.55/h*height), 60, "female", () -> {
    inputCharacter = "female";
   
    charButtons.get(0).characterImg=loadImage("player/default/standg.png");
    charButtons.get(1).characterImg=loadImage("player/female/stand.png");
    charButtons.get(2).characterImg=loadImage("player/adventurer/standg.png");
    charButtons.get(3).characterImg=loadImage("player/zombie/standg.png");
    charButtons.get(4).characterImg=loadImage("player/soldier/standg.png");
  }));
  charButtons.add(new CharacterButton(new PVector(width/2,10.36/h*height), 60, "adventurer", () -> {
    inputCharacter = "adventurer";
    
    charButtons.get(0).characterImg=loadImage("player/default/standg.png");
    charButtons.get(1).characterImg=loadImage("player/female/standg.png");
    charButtons.get(2).characterImg=loadImage("player/adventurer/stand.png");
    charButtons.get(3).characterImg=loadImage("player/zombie/standg.png");
    charButtons.get(4).characterImg=loadImage("player/soldier/standg.png");
  }));
  charButtons.add(new CharacterButton(new PVector(width/2-4.38/3*2/w*width,10.36/h*height), 60, "zombie", () -> {
    inputCharacter = "zombie";
    
    charButtons.get(0).characterImg=loadImage("player/default/standg.png");
    charButtons.get(1).characterImg=loadImage("player/female/standg.png");
    charButtons.get(2).characterImg=loadImage("player/adventurer/standg.png");
    charButtons.get(3).characterImg=loadImage("player/zombie/stand.png");
    charButtons.get(4).characterImg=loadImage("player/soldier/standg.png");
  }));
  charButtons.add(new CharacterButton(new PVector(width/2+4.38/3*2/w*width,10.36/h*height), 60, "soldier", () -> {
    inputCharacter = "soldier";
    
    charButtons.get(0).characterImg=loadImage("player/default/standg.png");
    charButtons.get(1).characterImg=loadImage("player/female/standg.png");
    charButtons.get(2).characterImg=loadImage("player/adventurer/standg.png");
    charButtons.get(3).characterImg=loadImage("player/zombie/standg.png");
    charButtons.get(4).characterImg=loadImage("player/soldier/stand.png");
  }));
  
  charButtons.get(0).characterImg=loadImage("player/default/stand.png");
  
  newButtons.get(0).colorValue=color(1,62,82);
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
