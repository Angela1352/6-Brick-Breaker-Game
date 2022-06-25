void reset() {
  mode = INTRO;

  leftkey = rightkey = false;

  //initialize entities
  px = width/2;
  pd = 120;

  bx = width/2;
  by = 450;
  bd = 20;

  vx = 0;
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
      tempy += 80;
    }
    i += 1;
  }

  score = 0;
  lives = 3;
}
