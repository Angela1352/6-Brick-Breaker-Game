void game() {
  image(image4, 400, 400, 1400, 800);

  //paddles: draw & move
  strokeWeight(1);
  fill(purple);
  circle(px, 710, pd);

  if (leftkey == true) px = px - 7;
  if (rightkey == true) px = px + 7;


  //ball: draw, move, bounce
  fill(255);
  strokeWeight(0);
  circle(bx, by, bd);

  bx = bx + vx;
  by = by + vy;

  if (dist(bx, by, px, 710) < bd/2 + pd/2) { //paddle bounce
    vx = (bx - px)/10;
    vy = (bd - pd)/10;
    bounce.rewind();
    bounce.play();
  }

  if (by < bd/2 ) { //bounce off top || by > height-bd/2
    vy *= -1;
  }

  if (bx < bd/2 || bx > width-bd/2) { //bounce off side
    vx *= -1;
  }

  //paddle & ball limits
  if (px <= 60 ) {
    px =  60;
  }

  if (px >= 740) {
    px = 740;
  }

  //pause button
  strokeWeight(4);
  fill(green);
  tactile(720, 22, 60, 45);
  rect(750, 40, 60, 45);
  strokeWeight(8);
  stroke(255);
  line(740, 27, 740, 50);
  line(760, 27, 760, 50);

  //score + lives board
  textFont(font1);
  textSize(24);
  fill(255);
  text("score:", 270, 30);
  text("lives:", 470, 30);
  textSize(20);
  text(score, 340, 33);
  text(lives, 530, 33);

  //scoring + dying
  if (by > 720) {
    lives -= 1;
    bx = width/2;
    by = 450;
    miss.rewind();
    miss.play();
    px = width/2;
    pd = 120;
  }

  //brick
  int i = 0;
  while (i < n) {
    if (alive[i] == true) {
      manageBrick(i);
    }
    i++;
  }


  if (score == 24) {
    mode = GAMEOVER;
    win.rewind();
    win.play();
  } else if (lives == 0) {
    mode = GAMEOVER;
    gameover.rewind();
    gameover.play();
  }
}


void gameClicks() {
  if (mouseX > 720 && mouseX < 780 && mouseY > 22 && mouseY < 67) {
    mode = PAUSE;
    bounce.rewind();
    bounce.play();
  }
}


void manageBrick(int i) {
  strokeWeight(2);
  stroke(255);
  if (y[i] == 100) fill(brickC1);
  if (y[i] == 180) fill(brickC2);
  if (y[i] == 260) fill(brickC3);
  if (y[i] == 340) fill(brickC4);
  circle(x[i], y[i], brickd);
  if (dist(bx, by, x[i], y[i]) < bd/2 + brickd/2) {
    vx = (bx - x[i])/5;
    vy = (by - y[i])/5;
    alive[i] = false;
    score++;
    bounce.rewind();
    bounce.play();
  }
}


void tactile(int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    stroke(255);
  } else {
    stroke(blue);
  }
}
