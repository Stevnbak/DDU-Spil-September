public void deathSuicideDraw(){
  t++;
  mapBackground(lastFrame);
  filter(GRAY);
  fill(0, 153, 204, 44);
  rectMode(CORNER);
  rect(0,0,width,height);
  rectMode(CENTER);
  
  terminalBlack();
  
  String[] te15={"\n--------------------------------\nMission mislykket\n--------------------------------"};
  int[] l15={4};
  PFont[] f15={dejaBold};
  color[] c15={red};
  textTerminal(te15, c15, l15, f15, co, si,0);
  
  String[] te16={"\nDu skød dig selv med en af dine\negne pile.\n\nDanmark står nu uden frelser","\n// [1] Genopstå fra dødsriget"};
  int[] l16={5,2};
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
  
  String[] te15={"\n--------------------------------\nMission mislykket\n--------------------------------"};
  int[] l15={4};
  PFont[] f15={dejaBold};
  color[] c15={red};
  textTerminal(te15, c15, l15, f15, co, si,0);
  
  String[] te16={"\nDu druknede da du hoppede i vandet\nuden badevinger.\n\nDanmark står nu uden frelser","\n// [1] Genopstå fra dødsriget"};
  int[] l16={4,2};
  PFont[] f16={dejaBold,dejaBoldItalic};
  color[] c16={white,orange};
  gradualTerminal(false,te16, c16, l16, f16, co, si,t,4,1);
}
