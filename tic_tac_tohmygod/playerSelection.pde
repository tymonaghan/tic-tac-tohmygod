void playerSelection() { //player name, token, and color selection before gameplay.
  background(25);
  if (!playerOneReady) { //P1 always needs to do this process, and will go first. once they are done, playerOneReady will be set to true, and it can let P2 customize or begin the game depending on whether its a 1p or 2p game.
    fill(255);
    textSize(45);
    text("Player One", width/2, height *.15);
    textSize(35);
    //fill(colorScheme[playerOne.playerColor]);
    text(playerOne.playerName, width/2, height*.25);
    tint(colorScheme[playerOne.playerColor]);
    image(tokenImages[playerOne.playerToken], width*.4+textWidth(playerOne.playerName), height *.24);
    tint(255);

    textSize(30);
    fill(255);
    text("Name", width*.225, height *.4);
    pushStyle();
    stroke(255);
    fill(150, 50);
    rect(width*.6, height*.4, width*.45, height*.085);
    popStyle();

    text("Token", width*.225, height*.55);
    for (int i=0; i<6; i++) { //draw thw row of tokenImages[]
      image(tokenImages[i], (width*.385)+55*i, height*.55, 45, 45);
    } //end for-loop

    text("Color", width*.225, height*.7);
    rectMode(CENTER);
    for (int j=0; j<6; j++) { //draw color swatches for player to pick from
      fill(colorScheme[j]);
      rect((width*.385)+55*j, height *.7, 45, 45);
    }// end for-loop to draw color swatches

    textAlign(CENTER);
    fill(255);
    text("Ready!", width/2, height*.9);

    sectionHighlightBox(sectionSelected);
    if (sectionSelected==1) {
      playerOne.setPlayerToken(tokenHighlightBox());
    } else if (sectionSelected == 2) {
      playerOne.setPlayerColor(colorHighlightBox());
    }// end if
  }  //if player one is not ready yet
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

void incrementColorSelected(){
  if (colorSelected <5){
  colorSelected++;
  } else {
    colorSelected = 0;
  }
}
void decrementColorSelected() {
  if (colorSelected >0){
  colorSelected--;
  } else {
    colorSelected = 5;
  }
}

void incrementTokenSelected(){
  if (tokenSelected <5){
  tokenSelected++;
  } else {
    tokenSelected = 0;
  }
}
void decrementTokenSelected() {
  if (tokenSelected >0){
  tokenSelected--;
  } else {
    tokenSelected = 5;
  }
}

void playerNameEntry(int playerNumber_) {

  listenForKeypressPlayerName();
}

void listenForKeypressPlayerName() {
  if (keyPressed == true && ticker >3) {
    if (key == ENTER) {
      //String namestring = str(playerNameChars);
      println("player name char array:"+playerNameChars);
    } else {//end if ENTER is pressed
      /*playerNameChars[characterCount] = key;
       playerNameChars = append (playerNameChars, key);
       if (playerNumber_ == 1) {
       playerOne.setPlayerName(namestring);
       } else if (playerNumber_ ==2) {
       playerTwo.setPlayerName(namestring);
       }*/
      resetTicker();
    }
  }// end if key pressed
} //end listenforKeypressPlayerName

void playerTokenSelect(int playerNumber_) {
}

void playerColorSelect(int playerNumber_) {
}
