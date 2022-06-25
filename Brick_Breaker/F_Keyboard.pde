void keyPressed() {
  if (keyCode == LEFT) leftkey = true;
  if (keyCode == RIGHT) rightkey  = true;
}

void keyReleased() {
  if (keyCode == LEFT) leftkey = false;
  if (keyCode == RIGHT) rightkey  = false;
}
