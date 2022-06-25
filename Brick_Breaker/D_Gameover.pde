void gameover() {
  theme.pause();
  image(image3, 400, 350, 1100, 700);

  fill(blue);
  textFont(font2);
  textSize(50);
  if (lives > 0) {
    text("YOU WIN", 400, 70);
  } else {
    text("TRY AGAIN", 400, 70);
  }

  fill(purple);
  textFont(font1);
  textSize(40);
  fill(255);
  text("<click to play again>", 403, 610);
  fill(purple);
  text("click to play again", 400, 610);
}

void gameoverClicks() {
  mode = INTRO;
  theme.rewind();
  reset();
}
