class Design {
  PShape[] shapes=new PShape[4];
  float[] form={1.15,0.5,0.47,0.04};
  float[] mass={0.01,0.01,0.01,0.01};
  
  PShape sq;
  PShape tr;
  PShape ci;
  PShape el;

  int n;
  float s;

  Design(float sc, int nu) {
    n=nu;
    s=sc;
    
    sq=createShape(RECT, 0, 0, s, s);
    sq.setFill(color(55));
    sq.setStroke(false);

    tr=createShape(TRIANGLE, -s/2, s/2, s/2, s/2, 0, -s/2);
    tr.setFill(color(55));
    tr.setStroke(false);

    ci=createShape(ELLIPSE, 0, 0, s, s);
    ci.setFill(color(55));
    ci.setStroke(false);

    el=createShape(ELLIPSE, 0, 0, s, s*2);
    el.setFill(color(55));
    el.setStroke(false);

    shapes[0]=sq;
    shapes[1]=tr;
    shapes[2]=ci;
    shapes[3]=el;
  }

  void draw() {
    shapeMode(CENTER);
    shape(shapes[n], 0, 0);
    stroke(55);
    strokeWeight(s/3);
    line(-s/2, 0, 0, s*4);
  }
}
