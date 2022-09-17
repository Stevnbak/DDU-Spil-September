public void deathSuicideDraw(){
  t++;
  mapBackground(lastFrame);
  filter(GRAY);
  fill(0, 153, 204, 44);
  rectMode(CORNER);
  rect(0,0,width,height);
  rectMode(CENTER);
  
  terminalBlack();
  
  String[] te15={"\n","MISSION MISLYKKET"};
  int[] l15={1,3};
  PFont[] f15={dejaBold,dejaBoldLarge};
  color[] c15={red,red};
  textTerminal(te15, c15, l15, f15, co, si,0);
  
  String[] te16={"Du skød dig selv med en af dine\negne pile.\n\nDanmark står nu uden frelser","\n// [1] Genopstå fra dødsriget"};
  int[] l16={4,2};
  PFont[] f16={dejaBold,dejaBoldItalic};
  color[] c16={white,orange};
  gradualTerminal(false,te16, c16, l16, f16, co, si,t,4,1);
}

public void deathDrownedDraw(){
  t++;
  mapBackground(lastFrame);
  filter(GRAY);
  fill(0, 153, 204, 44);
  rectMode(CORNER);
  rect(0,0,width,height);
  rectMode(CENTER);
  
  terminalBlack();
  
  String[] te15={"\n","MISSION MISLYKKET"};
  int[] l15={1,3};
  PFont[] f15={dejaBold,dejaBoldLarge};
  color[] c15={red,red};
  textTerminal(te15, c15, l15, f15, co, si,0);
  
  String[] te16={"Du druknede da du hoppede i vandet\nuden redningsvest.\n\nDanmark står nu uden frelser","\n// [1] Genopstå fra dødsriget"};
  int[] l16={4,2};
  PFont[] f16={dejaBold,dejaBoldItalic};
  color[] c16={white,orange};
  gradualTerminal(false,te16, c16, l16, f16, co, si,t,4,1);
}
