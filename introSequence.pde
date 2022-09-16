public LocationButton zo1;
public LocationButton le1;

public ArrayList<Button> zoomButtons = new ArrayList<Button>();
public ArrayList<Button> levelButtons = new ArrayList<Button>();
public ArrayList<PImage> zoomPictures = new ArrayList<PImage>();

void introSetup() {
  zo1=new LocationButton(new PVector(8.95, 4.44), 1.2, () -> {
    setState("zo1");
    t=0;
  }
  );

  le1=new LocationButton(new PVector(11.52, 10.46), 3, () -> {
    currentLevel = new level("3");
    setState("playing");
    dynamicObjects.remove(this);
  }
  );

  zoomButtons.add(new LocationButton(new PVector(14.82, 11.59), 1.1, () -> {
    setState(availableStates[0]);
  }
  ));

  zoomButtons.add(new LocationButton(new PVector(6.51, 16.93), 0.9, () -> {
    setState(availableStates[1]);
  }
  ));

  zoomButtons.add(new LocationButton(new PVector(9.16, 8.77), 1.0, () -> {
    setState(availableStates[2]);
  }
  ));

  /*
   interfaceButtons.add(new LocationButton(new PVector(250, 400), 50, () -> {
   println("Location");
   currentLevel = new level("1");
   setState("playing");
   dynamicObjects.remove(this);
   }
   ));
   */

  /*
  intu=new LocationButton(new PVector(8.02/w*width,3.44/h*height),2/h*height,() -> {
   setState("level1");
   }
   );
   
  /*
   interfaceButtons.add(new LocationButton(new PVector(250, 400), 50, () -> {
   println("Location");
   currentLevel = new level("1");
   setState("playing");
   dynamicObjects.remove(this);
   }
   ));
   */

  //LocationButton(PVector location, float radius, Runnable run) {
}

public PVector co=new PVector(21.69, 0.9);
public PVector si=new PVector(14.63, 10.03);

public int t=0;
public boolean ongoing=true;

public void intro1Draw() {
  t++;
  mapBackground(Danmarkskort1);
  terminalBlack();

  String[] te0={"\nBorger #3141592\nDer forlyder nyt om en krise og\nkongeriget Danmark har brug for\ndin hjælp.", "\n// Vælg dit svar\n   [1] Til tjeneste"};
  int[] l0={5, 3};
  PFont[] f0={dejaBold, dejaBoldItalic};
  color[] c0={white, orange};

  gradualTerminal(false, te0, c0, l0, f0, co, si, t, 0, 2);
}

public void intro2Draw() {
  t++;
  mapBackground(Danmarkskort1);
  terminalBlack();

  String[] te1={"\nBorger #3141592\nDer forlyder nyt om en krise og\nkongeriget Danmark har brug for\ndin hjælp.\n", "\n// Vælg dit svar\n   [1] Til tjeneste"};
  int[] l1={5, 3};
  PFont[] f1={dejaBold, dejaBoldItalic};
  color[] c1={white, orange};

  textTerminal(te1, c1, l1, f1, co, si, 0);

  String[] te2={"\n] Til tjeneste\n--------------------------------"};
  int[] l2={3};
  PFont[] f2={dejaBoldItalic};
  color[] c2={blue};

  gradualTerminal(true, te2, c2, l2, f2, co, si, t, 8, 1);
}

public void intro3Draw() {
  t++;
  mapBackground(Danmarkskort1);
  terminalBlack();

  String[] te3={"\nMiljøstyrelsen kræver din\nomgående assistance.\n\nEn vifte af fremmede arter har\nbosat sig overalt i landet.\n\nDe hærger lokale økosystemer og\ntruer fødevareforsyningen.\n\nFor vores alles skyld må du\nderfor gå i felten.", "\n// Vælg dit svar\n   [1] Jeg må vide mere\n   [2] Modtaget"};
  int[] l3={12, 4};
  PFont[] f3={dejaBold, dejaBoldItalic};
  color[] c3={white, orange};

  gradualTerminal(false, te3, c3, l3, f3, co, si, t, 0, 1);
}

public void intro4Draw() {
  t++;
  mapBackground(Danmarkskort1);
  terminalBlack();

  String[] te4={"\nMiljøstyrelsen kræver din\nomgående assistance.\n\nEn vifte af fremmede arter har\nbosat sig overalt i landet.\n\nDe hærger lokale økosystemer og\ntruer fødevareforsyningen.\n\nFor vores alles skyld må du\nderfor gå i felten.", "\n// Vælg dit svar\n   [1] Jeg må vide mere\n   [2] Modtaget"};
  int[] l4={12, 4};
  PFont[] f4={dejaBold, dejaBoldItalic};
  color[] c4={white, orange};

  textTerminal(te4, c4, l4, f4, co, si, 0);

  String[] te5={"\n] Jeg må vide mere\n--------------------------------"};
  int[] l5={3};
  PFont[] f5={dejaBoldItalic};
  color[] c5={blue};

  gradualTerminal(true, te5, c5, l5, f5, co, si, t, 16, 1);
}

public void intro5Draw() {
  t++;
  mapBackground(Danmarkskort1);
  terminalBlack();

  String[] te6={"\nIkke-hjemmehørender arter har få\nnaturlige fjender og kan derfor\nudbrede sig eksplosivt.\n\nDe destruerer habitater og\nmedbringer sygdomme.\n\nFremmede insekter og mikroorganismer\nødelægger marker og ruinerer landmænd.\n\nDer er i alt 134 invasive arter\npå dansk jord.", "\n - Miljøminister Lea Wermelin (S)", "\nCitatet er hentet fra seneste\npressemøde.", "\n// Vælg dit svar\n   [1] Modtaget"};
  int[] l6={13, 2, 3, 3};
  PFont[] f6={dejaBoldItalic, dejaBold, dejaBold, dejaBoldItalic};
  color[] c6={red, red, white, orange};

  gradualTerminal(false, te6, c6, l6, f6, co, si, t, 0, 1);
}

public void intro6Draw() {
  t++;
  mapBackground(Danmarkskort1);
  terminalBlack();

  String[] te7={"\nIkke-hjemmehørender arter har få\nnaturlige fjender og kan derfor\nudbrede sig eksplosivt.\n\nDe destruerer habitater og\nmedbringer sygdomme.\n\nFremmede insekter og mikroorganismer\nødelægger marker og ruinerer landmænd.\n\nDer er i alt 134 invasive arter\npå dansk jord.", "\n - Miljøminister Lea Wermelin (S)", "\nCitatet er hentet fra seneste\npressemøde.", "\n// Vælg dit svar\n   [1] Modtaget"};
  int[] l7={13, 2, 3, 3};
  PFont[] f7={dejaBoldItalic, dejaBold, dejaBold, dejaBoldItalic};
  color[] c7={red, red, white, orange};

  textTerminal(te7, c7, l7, f7, co, si, 0);

  String[] te8={"\n] Modtaget\n--------------------------------"};
  int[] l8={3};
  PFont[] f8={dejaBoldItalic};
  color[] c8={blue};

  gradualTerminal(true, te8, c8, l8, f8, co, si, t, 21, 1);
}

public void intro7Draw() {
  t++;
  mapBackground(Danmarkskort1);
  terminalBlack();

  String[] te9={"\nMiljøstyrelsen kræver din\nomgående assistance.\n\nEn vifte af fremmede arter har\nbosat sig overalt i landet.\n\nDe hærger lokale økosystemer og\ntruer fødevareforsyningen.\n\nFor vores alles skyld må du\nderfor gå i felten.", "\n// Vælg dit svar\n   [1] Jeg må vide mere\n   [2] Modtaget"};
  int[] l9={12, 4};
  PFont[] f9={dejaBold, dejaBoldItalic};
  color[] c9={white, orange};

  textTerminal(te9, c9, l9, f9, co, si, 0);

  String[] te10={"\n] Modtaget\n--------------------------------"};
  int[] l10={3};
  PFont[] f10={dejaBoldItalic};
  color[] c10={blue};

  gradualTerminal(true, te10, c10, l10, f10, co, si, t, 16, 1);
}

public void intro8Draw() {
  t++;
  mapBackground(Danmarkskort1);
  terminalBlack();
  zo1.draw();
  zo1.update();

  for (int i=0; i<zoomButtons.size(); i++) {
    zoomButtons.get(i).draw();
  }

  String[] te11={"\nVores algoritmer har fundet frem\ntil lokationer beasat af invasive\narter.\n\nDe er markeret med røde felter\npå dit Danmarkskort.\n\nNår du har bekæmpet dem alle\nskal du indberette dit fund og\nantal artsfæller på nettet.", "\nwww.arter.dk", "\nDet gør at eksperter kan\nkortlægge deres spredning og\npopulationer"};
  int[] l11={11, 2, 4};
  PFont[] f11={dejaBold, dejaBoldItalic, dejaBold};
  color[] c11={white, yellow, white};
  gradualTerminal(true, te11, c11, l11, f11, co, si, t, 0, 1);
  
  if (!ongoing){
    String[] te12={"<] Tryk på det røde felt."};
    int[] l12={1};
    PFont[] f12={dejaBoldItalic};
    color[] c12={white};
    textTerminal(te12, c12, l12, f12, new PVector(10.23, 4.01), si,0);
  }
}


public void zo1Draw() {
  t++;
  mapBackground(zo1P);
  terminalBlack();
  le1.update();
  le1.draw();
  
  String[] te13={"\n--------------------------------\n\nAntal elimineret:\n0/x\n\nAntal mistet:\n0/x\n\n--------------------------------"};
  int[] l13={10};
  PFont[] f13={dejaBold};
  color[] c13={green};
  textTerminal(te13, c13, l13, f13, co, si,0);
  
  String[] te14={"Lokation: Dronninglund\n(57.1949073,10.3166804)\n\nArtsnavn: Jærv"};
  int[] l14={5};
  PFont[] f14={dejaBold};
  color[] c14={white};
  gradualTerminal(false,te14, c14, l14, f14, new PVector(8.85,13.45), si,t,0,1);
}
