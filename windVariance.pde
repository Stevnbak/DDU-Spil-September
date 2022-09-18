public float n=0;
public float j=480;
public float ang=0;
public float val=0;
public float k=0.1;
public float[] prev=new float[2];

void windupdate(level variant){
    if (n==0){
      ang=0;
      val=random(0,PI);
      prev[0]=2*val;
      variant.wind=new PVector(k*cos(prev[0]),k*(-sin(prev[0])));
      val=random(0,PI);
      prev[1]=(prev[0]%(2*PI))+PI/2+val;
    }
    
    else if (n%j==0){
      prev[0]=prev[1];
      variant.wind=new PVector(k*cos(prev[0]),k*(-sin(prev[0])));
      val=random(0,PI);
      prev[1]=(prev[0]%(2*PI))+PI/2+val;
    }
  }
 
 void windInfoDraw(){
   n++;
   float x=0.65/w*width+85;
   float y=8/h*height;
   
   noStroke();
   fill(0,204);
   ellipse(x,y,170,170);
   fill(255,204);
   stroke(255);
   line(x,y,85*cos(prev[0])+x,85*(-sin(prev[0]))+y);
  
   if (prev[0]>prev[1]){
     float fraction=(n%j)/j;
     float angle=prev[0]-(fraction*(prev[0]-prev[1]));
 
     line(x,y,85*cos(angle)+x,85*(-sin(angle))+y);
   }
   
   else{
     float fraction=(n%j)/j;
     float angle=prev[0]-(fraction*(2*PI-(prev[1]-prev[0])));
     line(x,y,85*cos(angle)+x,85*(-sin(angle))+y);
   }
   
   stroke(255,0,0);
   line(x,y,85*cos(prev[1])+x,85*(-sin(prev[1]))+y);
   noStroke();
   
   
   
 }
