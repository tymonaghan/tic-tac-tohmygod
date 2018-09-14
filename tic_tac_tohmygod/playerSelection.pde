void playerSelection() { //player name, token, and color selection before gameplay.
  background(25);
  if (!playerOneReady) { //P1 always needs to do this process, and will go first. once they are done, playerOneReady will be set to true, and it can let P2 customize or begin the game depending on whether its a 1p or 2p game.
    fill(255);
    textSize(45);
    text("Player One", width/2, height *.15);
    playerOne.showCustomizationMenu();
  } else {   //if player one is not ready yet
    fill(255);
    textSize(45);
    text("Player Two", width/2, height *.15);
    playerTwo.showCustomizationMenu();
  }
}//end playerSelection

void sectionHighlightBox(int selection_) {
  int highlightBoxYOffset = int(height*(0.4+(selection_ * 0.15)));
  if (selection_ == 3) {
    pushStyle();
    stroke(255, 255, 100);
    strokeWeight(3);
    fill(255, 255, 100, 40);
    rect(width/2, height*.88, width/2, height*.1);
    popStyle();
  } else {
    stroke(255, 255, 100);
    fill(255, 255, 100, 5);
    rectMode(CENTER);
    rect(width*.5, highlightBoxYOffset, width*.8, height*.15);
  }
} //end sectionHighlightBox

color colorHighlightBox() {
  pushStyle();
  strokeWeight(2);
  stroke(titleColorFlasher());
  noFill();

  rect((width*.385)+55*colorSelected, height *.7, 45, 45);
  popStyle();
  return colorSelected;
}

int tokenHighlightBox() {
  pushStyle();
  strokeWeight(2);
  stroke(titleColorFlasher());
  noFill();

  rect((width*.385)+55*tokenSelected, height *.55, 45, 45);
  popStyle();
  return tokenSelected;
}

void incrementsectionSelected() {
  sectionSelected++;
}

void decrementsectionSelected() {
  sectionSelected--;
}

void incrementColorSelected() {
  if (colorSelected <5) {
    colorSelected++;
  } else {
    colorSelected = 0;
  }
}
void decrementColorSelected() {
  if (colorSelected >0) {
    colorSelected--;
  } else {
    colorSelected = 5;
  }
}

void incrementTokenSelected() {
  if (tokenSelected <5) {
    tokenSelected++;
  } else {
    tokenSelected = 0;
  }
}
void decrementTokenSelected() {
  if (tokenSelected >0) {
    tokenSelected--;
  } else {
    tokenSelected = 5;
  }
}
