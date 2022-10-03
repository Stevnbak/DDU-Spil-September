public float n=0;
public float j=480 - 120 * difficultyGet(saveID);
public float ang=0;
public float val=0;
public float k=0.06;
public float[] prev=new float[2];

void windupdate(level variant) {
  if (n==0) {
    ang=0;
    val=random(0, PI);
    prev[0]=2*val;
    variant.wind=new PVector(k*cos(prev[0]), k*(-sin(prev[0])));
    val=random(0, PI);
    
    prev[1]=(prev[0]%(2*PI))+PI/2+val;
  } else if (n%j==0) {
    prev[0]=prev[1];
    variant.wind=new PVector(k*cos(prev[0]), k*(-sin(prev[0])));
    val=random(0, PI);
    prev[1]=(prev[0]%(2*PI))+PI/2+val;
  }
}

void windInfoDraw() {
  n++;
  float x=0.65/w*width+95;
  float y=8/h*height;
 
  stroke(0);
  strokeWeight(3);
  noFill();
  ellipse(x,y,85,85);
  line(x, y, 85*cos(prev[0])+x, 85*(-sin(prev[0]))+y);

  if (prev[0]>prev[1]) {
    for (int i=0; i<=(n%j); i++) {
      float fraction=(i%j)/j;
      float angle=prev[0]-(fraction*(prev[0]-prev[1]));
      line(x, y, 85*0.5*cos(angle)+x, 85*0.5*(-sin(angle))+y);
    }
  } else {
    for (int i=0; i<=(n%j); i++) {
      float fraction=(i%j)/j;
      float angle=prev[0]-(fraction*(2*PI-(prev[1]-prev[0])));
      line(x, y, 85*0.5*cos(angle)+x, 85*0.5*(-sin(angle))+y);
    }
  }
  
  for (int i=0;i<=85;i=i+5){
    pushMatrix();
    translate(x,y);
    line(cos(prev[1])*(i-1),-sin(prev[1])*(i-1),cos(prev[1])*i,-sin(prev[1])*i);
    popMatrix();
  }
  noStroke();
}
