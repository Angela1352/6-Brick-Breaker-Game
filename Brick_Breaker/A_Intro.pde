void intro() {
  theme.play();
  reset();

  //background pictures
  background(0);
  image(image2, 400, 540, 800, 500);
  image(image1, 400, 180, 800, 400);


  //Brick Breaker Text
  fill(0);
  textFont(font2);
  textSize(110);
  text("BR I C K", 400, 180);
  text("BREA K ER", 400, 320);
  fill(255);
  text("BR I C K", 402, 185);
  text("BREA K ER", 402, 325);


  //play text
  counter = counter + 1;
  if (counter < 40) {
    fill(0);
    textFont(font1);
    textSize(40);
    text("click anywhere to play", 400, 510);
    fill(green);
    text("click anywhere to play", 405, 510);
  } else if (counter > 40 ) {
    if (counter == 60) {
      counter = 0;
    }
  }
}


void introClicks() {
  mode = GAME;
}
