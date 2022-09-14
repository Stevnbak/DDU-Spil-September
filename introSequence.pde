
public PVector co=new PVector(21.69, 0.9);
public PVector si=new PVector(14.63, 10.03);

public int t=0;
public boolean ongoing=true;

public void intro1Draw(){
  t++;
  mapBackground();
  terminalBlack();
  
  String[] te0={"\nBorger #3141592\nDer forlyder nyt om en krise og\nkongeriget Danmark har brug for\ndin hjælp.", "\n// Vælg dit svar\n   [1] Til tjeneste"};
  int[] l0={5, 3};
  PFont[] f0={dejaBold, dejaBoldItalic};
  color[] c0={white,orange};
  
  gradualTerminal(false,te0, c0,l0, f0, co, si,t,0,2);
}

public void intro2Draw(){
  t++;
  mapBackground();
  terminalBlack();
  
  String[] te1={"\nBorger #3141592\nDer forlyder nyt om en krise og\nkongeriget Danmark har brug for\ndin hjælp.\n", "\n// Vælg dit svar\n   [1] Til tjeneste"};
  int[] l1={5, 3};
  PFont[] f1={dejaBold, dejaBoldItalic};
  color[] c1={white,orange};
  
  textTerminal(te1,c1,l1,f1,co,si,0);
  
  String[] te2={"\n] Til tjeneste\n--------------------------------"};
  int[] l2={3};
  PFont[] f2={dejaBoldItalic};
  color[] c2={blue};
  
  gradualTerminal(true,te2, c2,l2, f2, co, si,t,8,1);
}

public void intro3Draw(){
  t++;
  mapBackground();
  terminalBlack();
  
  String[] te3={"\nMiljøstyrelsen kræver din\nomgående assistance.\n\nEn vifte af fremmede arter har\nbosat sig overalt i landet.\n\nDe hærger lokale økosystemer og\ntruer fødevareforsyningen.\n\nFor vores alles skyld må du\nderfor gå i felten.","\n// Vælg dit svar\n   [1] Jeg må vide mere\n   [2] Modtaget"};
  int[] l3={12, 4};
  PFont[] f3={dejaBold, dejaBoldItalic};
  color[] c3={white,orange};
  
  gradualTerminal(false,te3, c3,l3, f3, co, si,t,0,1);
}

public void intro4Draw(){
  t++;
  mapBackground();
  terminalBlack();
  
  String[] te4={"\nMiljøstyrelsen kræver din\nomgående assistance.\n\nEn vifte af fremmede arter har\nbosat sig overalt i landet.\n\nDe hærger lokale økosystemer og\ntruer fødevareforsyningen.\n\nFor vores alles skyld må du\nderfor gå i felten.","\n// Vælg dit svar\n   [1] Jeg må vide mere\n   [2] Modtaget"};
  int[] l4={12, 4};
  PFont[] f4={dejaBold, dejaBoldItalic};
  color[] c4={white,orange};
  
  textTerminal(te4,c4,l4,f4,co,si,0);
  
  String[] te5={"\n] Jeg må vide mere\n--------------------------------"};
  int[] l5={3};
  PFont[] f5={dejaBoldItalic};
  color[] c5={blue};
  
  gradualTerminal(true,te5, c5,l5, f5, co, si,t,16,1);
}

public void intro5Draw(){
  t++;
  mapBackground();
  terminalBlack();
  
  String[] te6={"\nIkke-hjemmehørender arter har få\nnaturlige fjender og kan derfor\nudbrede sig eksplosivt.\n\nDe destruerer habitater og\nmedbringer sygdomme.\n\nFremmede insekter og mikroorganismer\nødelægger marker og ruinerer landmænd.\n\nDer er i alt 134 invasive arter\npå dansk jord.","\n - Miljøminister Lea Wermelin (S)","\nCitatet er hentet fra seneste\npressemøde.","\n// Vælg dit svar\n   [1] Modtaget"};
  int[] l6={13,2,3,3};
  PFont[] f6={dejaBoldItalic, dejaBold,dejaBold,dejaBoldItalic};
  color[] c6={red,red,white,orange};
  
  gradualTerminal(false,te6, c6,l6, f6, co, si,t,0,1);
}

public void intro6Draw(){
  t++;
  mapBackground();
  terminalBlack();
  
  String[] te7={"\nIkke-hjemmehørender arter har få\nnaturlige fjender og kan derfor\nudbrede sig eksplosivt.\n\nDe destruerer habitater og\nmedbringer sygdomme.\n\nFremmede insekter og mikroorganismer\nødelægger marker og ruinerer landmænd.\n\nDer er i alt 134 invasive arter\npå dansk jord.","\n - Miljøminister Lea Wermelin (S)","\nCitatet er hentet fra seneste\npressemøde.","\n// Vælg dit svar\n   [1] Modtaget"};
  int[] l7={13,2,3,3};
  PFont[] f7={dejaBoldItalic, dejaBold,dejaBold,dejaBoldItalic};
  color[] c7={red,red,white,orange};
  
  textTerminal(te7,c7,l7,f7,co,si,0);
  
  String[] te8={"\n] Modtaget\n--------------------------------"};
  int[] l8={3};
  PFont[] f8={dejaBoldItalic};
  color[] c8={blue};
  
  gradualTerminal(true,te8, c8,l8, f8, co, si,t,21,1);
}

public void intro7Draw(){
  t++;
  mapBackground();
  terminalBlack();
  
  String[] te9={"\nMiljøstyrelsen kræver din\nomgående assistance.\n\nEn vifte af fremmede arter har\nbosat sig overalt i landet.\n\nDe hærger lokale økosystemer og\ntruer fødevareforsyningen.\n\nFor vores alles skyld må du\nderfor gå i felten.","\n// Vælg dit svar\n   [1] Jeg må vide mere\n   [2] Modtaget"};
  int[] l9={12, 4};
  PFont[] f9={dejaBold, dejaBoldItalic};
  color[] c9={white,orange};
  textTerminal(te9, c9,l9, f9, co, si,0);
}

public void intro8Draw(){
 //røde plet, en enkelt
 //tryk på, komme rundt
}
