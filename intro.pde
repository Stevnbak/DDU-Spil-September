
PImage Danmarkskort1;
PImage Danmarkskort2;
PFont dejaRegular;
PFont dejaItalic;
PFont dejaBold;
PFont dejaBoldItalic;

color white;
color orange;

void mapBackground() {
  background(255);
  textureMode(NORMAL);
  textureWrap(REPEAT);
  beginShape();
  texture(Danmarkskort1);
  vertex(0, 0, 0, 0);
  vertex(width, 0, 1, 0);
  vertex(width, height, 1, 1);
  vertex(0, height, 0, 1);
  endShape();
}

void terminalBlack() {
  noStroke();
  rectMode(CORNER);
  fill(0,255-51);
  rect(width*0.62178919,0, width*0.33362858, height);
  rectMode(CENTER);
}

void terminalDannebrog() {
  background(255);
  textureMode(NORMAL);
  textureWrap(REPEAT);
  beginShape();
  texture(Danmarkskort2);
  vertex(0, 0, 0, 0);
  vertex(width, 0, 1, 0);
  vertex(width, height, 1, 1);
  vertex(0, height, 0, 1);
  endShape();
}

void textTerminal(String[] texts,color[] colours,int[] lines,PFont[] fonts,PVector corner,PVector size ){
  float w=33.87;
  float h=19.05;
  
  for (int i=0;i<texts.length;i++){
    textFont(fonts[i]);
    fill(colours[i]);
    
    float offset=0;
    for (int n=0;n<=i;n++){
      if (n!=i){
        offset=offset+lines[n];
      }
    }
    offset=offset*16;
    text(texts[i],corner.x/w*width,corner.y/h*height+offset,size.x/w*width,size.y/h*height);
  }
}


public void introDraw() {
  
}
