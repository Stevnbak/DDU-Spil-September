class Design {
  PShape[] shapes=new PShape[4];
  float[] value;

  PShape sq;
  PShape tr;
  PShape ci;
  PShape el;

  int nu;
  float sc;

  Design(float s, int n) {
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

    nu=n;
    sc=s;
  }

  void draw() {
    shapeMode(CENTER);
    shape(shapes[nu], 0, 0);
  }
}
