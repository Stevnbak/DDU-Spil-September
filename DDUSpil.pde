PVector camLocation;
float camSpeed = 20;
Player player = new Player();

public boolean[] keyInputs;

void setup() {
  size(1080,720);
  surface.setTitle("Test Title");
  surface.setResizable(true);
  //surface.setLocation(width/2, height/2);
  camLocation = new PVector(0,0);
  
    keyInputs = new boolean[4];
    keyInputs[0] = false;
    keyInputs[1] = false;
    keyInputs[2] = false;
    keyInputs[3] = false;
}

void updateCamLocation() {
    PVector centerLocation = new PVector(camLocation.x + width/2, camLocation.y + height /2);
    float xDistance = centerLocation.x - player.location.x;
    float yDistance = centerLocation.y - player.location.y;
    camLocation.x -= xDistance / camSpeed;
    camLocation.y -= yDistance / camSpeed;
}

 void keyPressed() {
   switch (key) {
      case 'a': {keyInputs[0] = true;break;}
      case 'd': {keyInputs[1] = true;break;}
      case 'w': {keyInputs[2] = true;break;}
      case 's': {keyInputs[3] = true;break;}
      default: {};
   }
  }
  
  void keyReleased() {
    switch (key) {
      case 'a': {keyInputs[0] = false;break;}
      case 'd': {keyInputs[1] = false;break;}
      case 'w': {keyInputs[2] = false;break;}
      case 's': {keyInputs[3] = false;break;}
      default: {};
   }
  }

void draw() {
  //print("{"+keyInputs[0]+", "+keyInputs[1]+", "+keyInputs[2]+", "+keyInputs[3]+",]\n");
  player.update();
  
  background(255);
  updateCamLocation();
  translate(-camLocation.x, -camLocation.y);

  player.draw();


  noStroke();
  colorMode(RGB);
  fill(120,60,60);
  
  ellipse(width / 2, height / 2,100,100);
  ellipse(200, 50 ,100,100);
}
