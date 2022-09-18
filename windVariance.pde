public int n=0;
public float ang=0;
public float val=0;
public float k=1;
public float[] prev=new float[2];

void windupdate(level variant){
    if (n==0){
      ang=0;
      val=random(0,PI);
      prev[0]=2*val;
      variant.wind=new PVector(k*sin(prev[0]),k*cos(prev[0]));
      val=random(0,PI);
      prev[1]=prev[0]+PI/2+val;
    }
    
    else if (n%240==0){
      variant.wind=new PVector(k*sin(prev[1]),k*cos(prev[1]));
      prev[0]=prev[1];
      val=random(0,PI);
      prev[1]=prev[0]+PI/2+val;
    }
  }
 
 void windInfoDraw(){
   pushMatrix();
   popMatrix();
 }
