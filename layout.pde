void layoutSetup(){
    Danmarkskort1 = loadImage("navigation/Danmarkskort1.png");
    Danmarkskort2 = loadImage("navigation/Danmarkskort2.jpeg");
    zo1P = loadImage("navigation/zo1.png");
    zo2P = loadImage("navigation/zo2.png");
    zo3P = loadImage("navigation/zo3.png");
    global=loadImage("navigation/global.png");
    cross=loadImage("navigation/cross.png");
       
    dejaRegular=createFont("fonts/dejaRegular.ttf", 16);
    dejaItalic=createFont("fonts/dejaItalic.ttf", 16);
    dejaBold=createFont("fonts/dejaBold.ttf", 16);
    dejaBoldItalic=createFont("fonts/dejaBoldItalic.ttf", 16);
    
    dejaRegular10=createFont("fonts/dejaRegular.ttf", 14);
    dejaItalic10=createFont("fonts/dejaItalic.ttf", 14);
    dejaBold10=createFont("fonts/dejaBold.ttf", 14);
    dejaBoldItalic10=createFont("fonts/dejaBoldItalic.ttf", 14);
    
    dejaBoldLarge=createFont("fonts/dejaBold.ttf", 24);
    
    white = color(255,255,255);
    orange = color(216,101,16);
    blue = color(0,176,241);
    red = color(217,17,57);
    yellow = color(227,215,113);
    green = color(0,176,80);
}

PImage Danmarkskort1;
PImage Danmarkskort2;
PImage zo1P;
PImage zo2P;
PImage zo3P;
PImage global;
PImage cross;

PFont dejaRegular;
PFont dejaItalic;
PFont dejaBold;
PFont dejaBoldItalic;

PFont dejaRegular10;
PFont dejaItalic10;
PFont dejaBold10;
PFont dejaBoldItalic10;

PFont dejaBoldLarge;

color white;
color orange;
color blue;
color red;
color yellow;
color green;
