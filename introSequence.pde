public LocationButton zo1;
public LocationButton le1;
public boolean intro=true;

public ArrayList<Button> zoomButtons = new ArrayList<Button>();
public ArrayList<Button> levelButtons = new ArrayList<Button>();
public float cooldown;

void introSetup() {
  zoomButtons.add(new LocationButton(new PVector(8.95, 4.44), 1.2, () -> {
    setState("1");
    t=0;
  }
  ));

  zoomButtons.add(new LocationButton(new PVector(14.62, 10.84), 1.1, () -> {
    setState("2");
    t=0;
  }
  ));

  zoomButtons.add(new LocationButton(new PVector(6.44, 15.63), 0.9, () -> {
    setState("3");
    t=0;
  }
  ));

  levelButtons.add(new LocationButton(new PVector(11.52, 10.46), 3, () -> {
    introSet(true);
    currentLevel = new level("1");
    setState("playing");
  }
  ));

  levelButtons.add(new LocationButton(new PVector(11.96, 9.71), 3, () -> {
    currentLevel = new level("2");
    setState("playing");
  }
  ));

  levelButtons.add(new LocationButton(new PVector(11.40, 6.28), 3, () -> {
    currentLevel = new level("3");
    setState("playing");
  }
  ));
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
  zoomButtons.get(0).update();

  for (int i=0; i<zoomButtons.size(); i++) {
    zoomButtons.get(i).draw();
  }

  String[] te11={"\nVores algoritmer har fundet frem\ntil lokationer beasat af invasive\narter.\n\nDe er markeret med røde felter\npå dit Danmarkskort.\n\nNår du har bekæmpet dem alle\nskal du indberette dit fund og\nantal artsfæller på nettet.", "\nwww.arter.dk", "\nDet gør at eksperter kan\nkortlægge deres spredning og\npopulationer", "\n// Tryk på det øverste røde felt."};
  int[] l11={11, 2, 4, 2};
  PFont[] f11={dejaBold, dejaBoldItalic, dejaBold, dejaBoldItalic};
  color[] c11={white, yellow, white, orange};
  gradualTerminal(true, te11, c11, l11, f11, co, si, t, 0, 1);
}


public void zo1Draw() {
  t++;
  mapBackground(zo1P);
  terminalBlack();
  levelButtons.get(0).update();
  levelButtons.get(0).draw();

  String[] te13={"\n--------------------------------\nAntal elimineret:\n"+scoreE[0]+"/"+(scoreE[0]+scoreM[0])+"\n\nAntal mistet:\n"+scoreM[0]+"/"+(scoreE[0]+scoreM[0])+"\n--------------------------------", "\nDen galiziske sumpkrebs\nfortrænger hjemmehørende krebs\nog overfører skadelig krebsepest.\n\nDen blev importeret fra Tyrkiet\ntil konsum i efterkrigstiden,\nog har etableret sig i en del\nsmåvande."};
  int[] l13={8, 10};
  PFont[] f13={dejaBold, dejaBoldItalic};
  color[] c13={green, white};
  textTerminal(te13, c13, l13, f13, co, si, 0);

  String[] te14={"Lokation: Dronninglund\n(57.1949073,10.3166804)\n\nArtsnavn: Galizisk sumpkrebs\nMiljø: Skovmose\nSkalering: 0.08"};
  int[] l14={7};
  PFont[] f14={dejaBold};
  color[] c14={white};
  gradualTerminal(false, te14, c14, l14, f14, new PVector(8.85, 13.45), si, t, 0, 1);
}

public void zo2Draw() {
  t++;
  mapBackground(zo2P);
  terminalBlack();
  levelButtons.get(1).update();
  levelButtons.get(1).draw();

  String[] te13={"\n--------------------------------\nAntal elimineret:\n0/x\n\nAntal mistet:\n0/x\n--------------------------------", "\nVaskebjørnen truer diversiteten\nved at udkonkurrere mårdyr og\nplyndre fuglereder. Den kan også\noverføre rabies til ræve, hunde\nog mennesker.\n\nHvis der etableres en fast\nbestand, kan den være nær umulig\nat udrydde."};
  int[] l13={8, 10};
  PFont[] f13={dejaBold, dejaBoldItalic};
  color[] c13={green, white};
  textTerminal(te13, c13, l13, f13, co, si, 0);

  String[] te14={"Lokation: Hørsholm\n(55.8835140,12.5049241)\n\nArtsnavn: Vaskebjørn\nMiljø: Løvskov\nSkalering: 0.40"};
  int[] l14={7};
  PFont[] f14={dejaBold};
  color[] c14={white};
  gradualTerminal(false, te14, c14, l14, f14, new PVector(9.07, 12.95), si, t, 0, 1);
}

public void zo3Draw() {
  t++;
  mapBackground(zo3P);
  terminalBlack();
  levelButtons.get(2).update();
  levelButtons.get(2).draw();

  String[] te13={"\n--------------------------------\nAntal elimineret:\n0/x\n\nAntal mistet:\n0/x\n--------------------------------", "\nMinken er et effektivt rovdyr og\nkan have en betydelig negativ\neffekt på fugle og små pattedyr.\nDen reducerer også hjemmehørende\nrovdyrs fødegrundlag.\n\nDen er udbredt i hele Danmark,\nmen ved jagt og fældefangst kan\nden begræneses."};
  int[] l13={8, 10};
  PFont[] f13={dejaBold, dejaBoldItalic};
  color[] c13={green, white};
  textTerminal(te13, c13, l13, f13, co, si, 0);

  String[] te14={"Lokation: Padborg\n(54.8331230,9.3568590)\n\nArtsnavn: Mink\nMiljø: Løvskov\nSkalering: 0.32"};
  int[] l14={7};
  PFont[] f14={dejaBold};
  color[] c14={white};
  gradualTerminal(false, te14, c14, l14, f14, new PVector(8.33, 9.53), si, t, 0, 1);
}

public void completeDraw() {
    mapBackground(Danmarkskort2);
    t++;
    String[] te11={"\nEfter at have frelst Danmark\nindkaldes du til Amalienborg for\nat modtage din hæder.\n\nDu bliver der mødt af en\nstorsmilende regent", "\nI Guds åsyn udnævnes de til\nridder af Elefantordenen som tak\nfor deres afgørende indsats mod\ninvasive arter og indberetning\npå arter.dk.", "\n-H.M. Dronning Margrethe II"};
    int[] l11={7, 6, 2};
    PFont[] f11={dejaBold, dejaBoldItalic, dejaBold};
    color[] c11={(0), (0), (0)};
    gradualTerminal(false, te11, c11, l11, f11, co.get().sub(new PVector(0,-0.3)), si, t, 0, 1);
}

public void menuDraw() {
  mapBackground(Danmarkskort1);
  terminalBlack();

  for (int i = 0; i < zoomButtons.size(); i++) {
    zoomButtons.get(i).update();
    zoomButtons.get(i).draw();
  }

  String[] te11={"\nBorger [#314159]\nDette er din navigationsmenu.\n\nHer kan du vælge mellem dine\nudryddelsesmissioner.\n\nNår du fuldfører en vil dets\nfelt skifte farve til grøn.\n\nKlar dem alle og indkasser din\nbelønning.", "\n// Liste over kommandoer\n   [esc] åbner menuen\n   [p] pauser missionen"};
  int[] l11={12, 4};
  PFont[] f11={dejaBold, dejaBoldItalic};
  color[] c11={white, orange};
  textTerminal(te11, c11, l11, f11, co, si, 0);
}

public void pauseDraw() {
  cooldown++;
  mapBackground(lastFrame);
  filter(GRAY);
  fill(0, 153, 204, 44);
  rectMode(CORNER);
  rect(0,0,width,height);
  rectMode(CENTER);
  
  terminalBlack();
  String[] te15={"\n--------------------------------\nMissionen sat på pause\n--------------------------------","\n//Liste over kommandoer\n   [p] genoptager missionen\n   [r] genstarter missionen"};
  int[] l15={4,4};
  PFont[] f15={dejaBold,dejaBoldItalic};
  color[] c15={white,orange};
  textTerminal(te15, c15, l15, f15, co, si,0);
}
