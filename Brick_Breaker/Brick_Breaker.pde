// Angela Chen
// 2-3
// May 4, 2022


import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;


//mode framework
int mode;
final int INTRO     = 1;
final int GAME      = 2;
final int PAUSE     = 3;
final int GAMEOVER  = 4;


//colour palette
color blue        = #86BBD8;
color green       = #99C479;
color purple      = #705674;

color brickC1     = #A5682A;
color brickC2     = #FF2F2F;
color brickC3     = #4C9DDD;
color brickC4     = #44AE69;


//key variables
boolean leftkey, rightkey;


//entity variables
float px, pd; //paddle
float bx, by, bd; //ball
float vx, vy;


//sound variables
Minim minim;
AudioPlayer theme, bounce, gameover, miss, win;


//Arrays Variables
int [] x;
int [] y;
boolean [] alive;
int brickd;
int n;
int tempx, tempy;


//other variables
PImage image1, image2, image3, image4, image5;
PFont font1, font2, font3;
int counter;
int score, lives;


void setup() {
  size(800, 700);
  textAlign(CENTER, CENTER);
  imageMode(CENTER);
  rectMode(CENTER);

  mode = INTRO;

  //initialize keyboard
  leftkey = rightkey = false;

  image1  = loadImage("image1.jpg");
  image2  = loadImage("image2.jpg");
  image3  = loadImage("image3.jpg");
  image4  = loadImage("image4.jpg");
  image5  = loadImage("image5.jpg");

  font1   = createFont("font1.otf", 100);
  font2   = createFont("font2.ttf", 100);

  counter = 0;

  //initialize entities
  px = width/2;
  pd = 120;

  bx = width/2;
  by = 450;
  bd = 20;

  vx = 0; //random(-12, 12)
  vy = 5;

  brickd = 50;
  n = 24;
  x = new int[n];
  y = new int[n];
  alive = new boolean [n];

  tempx = 110;
  tempy = 100;
  int i = 0;
  while (i < n) {
    x[i] = tempx;
    y[i] = tempy;
    alive[i] = true;
    tempx += 120;
    if (tempx > width-70) {
      tempx = 110;
      tempy += 100;
    }
    i += 1;
  }

  score = 0;
  lives = 3;

  minim = new Minim(this);
  theme      = minim.loadFile("theme.mp3");
  gameover   = minim.loadFile("gameover.mp3");
  win        = minim.loadFile("win.mp3");
  bounce     = minim.loadFile("bounce.mp3");
  miss       = minim.loadFile("miss.mp3");
}


void draw() {
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == GAMEOVER) {
    gameover();
  } else {
    println("Mode error: " + mode);
  }
}
