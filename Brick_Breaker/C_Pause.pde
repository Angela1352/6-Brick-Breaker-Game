void pause() {

  theme.pause();

  strokeWeight(10);
  stroke(255);
  fill(0);
  rect(400, 350, 550, 420);
  image(image5, 400, 400, 430, 310);

  //paused text
  textFont(font1);
  textSize(60);
  fill(255);
  text("paused", 402, 190);
  fill(blue);
  text("paused", 398, 190);

  //unpause button
  strokeWeight(4);
  fill(green);
  tactile(720, 22, 60, 45);
  rect(750, 40, 60, 45);
  stroke(255);
  strokeWeight(5);
  triangle(737, 26, 737, 54, 764, 42);
}


void pauseClicks() {
  if (mouseX > 720 && mouseX < 780 && mouseY > 22 && mouseY < 67) {
    mode = GAME;
    theme.play();
    bounce.rewind();
    bounce.play();
  }
}
