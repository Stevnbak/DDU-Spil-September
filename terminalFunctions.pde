public float w=33.87;
public float h=19.05;

void mapBackground(PImage back) {
  background(255);
  textureMode(NORMAL);
  textureWrap(REPEAT);
  beginShape();
  texture(back);
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

void gradualTerminal(boolean u,String[] texts,color[] colours,int[] lines,PFont[] fonts,PVector corner,PVector size,int t,int d,int f){
  float w=33.87;
  float h=19.05;
  int total=0;
  
  for (int i=0;i<texts.length;i++){
    textFont(fonts[i]);
    colorMode(RGB);
    fill(colours[i]);
    
    int s=t-total;
    total=total+texts[i].length();
     
    float offset=d;
    for (int n=0;n<=i;n++){
      if (n!=i){
        offset=offset+lines[n];
      }
    }
    offset=offset*24;
    
    rectMode(CORNER);
    if (s<texts[i].length()){
          text(texts[i].substring(0,s),corner.x/w*width,corner.y/h*height+offset,size.x/w*width,lines[i]*24);
          break;
    }
    else{
      text(texts[i],corner.x/w*width,corner.y/h*height+offset,size.x/w*width,lines[i]*24);
    }
    
    if (i+1==texts.length&&u){
      ongoing=false;
    }
  }
}

void textTerminal(String[] texts,color[] colours,int[] lines,PFont[] fonts,PVector corner,PVector size,int d){
  
  for (int i=0;i<texts.length;i++){
    textFont(fonts[i]);
    colorMode(RGB);
    fill(colours[i]);
        
    float offset=d;
    for (int n=0;n<=i;n++){
      if (n!=i){
        offset=offset+lines[n];
      }
    }
    offset=offset*24;
    
    rectMode(CORNER);
    text(texts[i],corner.x/w*width,corner.y/h*height+offset,size.x/w*width,lines[i]*24);
    rectMode(CENTER);
  }
}

void textTerminala(String[] texts,color[] colours,int[] lines,PFont[] fonts,PVector corner,PVector size,int d){
  
  for (int i=0;i<texts.length;i++){
    textFont(fonts[i]);
    colorMode(RGB);
    fill(colours[i]);
        
    float offset=d;
    for (int n=0;n<=i;n++){
      if (n!=i){
        offset=offset+lines[n];
      }
    }
    offset=offset*24;
    
    rectMode(CORNER);
    text(texts[i],corner.x,corner.y+offset,size.x,lines[i]*24);
    rectMode(CENTER);
  }
}
