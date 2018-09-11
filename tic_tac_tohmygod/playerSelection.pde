void playerSelection() { //player name, token, and color selection before gameplay.
  background(25);
  if (!playerOneReady) { //P1 always needs to do this process, and will go first. once they are done, playerOneReady will be set to true, and it can let P2 customize or begin the game depending on whether its a 1p or 2p game.
    fill(255);
    textSize(45);
    text("Player One", width/2, height *.15);
    textSize(35);
    fill(playerOne.playerColor);
    text(playerOne.playerName, width/2, height*.25);

    textSize(30);
    fill(255);
    text("Name", width*.25, height *.4);
    pushStyle();
    stroke(255);
    fill(150, 50);
    rect(width*.6, height*.4, width*.45, height*.085);
    popStyle();
    text("Token", width*.25, height*.55);
    text("Color", width*.25, height*.7);
    highlightBox();
    listenForKeypressPlayerSelection();
    if (itemSelected ==0) {
      playerNameEntry(1);
    } else if (itemSelected == 1) {
      playerTokenSelect(1);
    } else if (itemSelected == 2) {
      playerColorSelect(1);
    }
  } //if player one is not ready yet
}//end playerSelection

void highlightBox() {
  int highlightBoxYOffset = int(height*(0.4+(itemSelected * 0.15)));
  stroke(255, 255, 100);
  fill(255, 255, 100, 40);
  rectMode(CENTER);
  rect(width*.5, highlightBoxYOffset, width*.8, height*.15);
} //end highlightBox

void listenForKeypressPlayerSelection() {
  if (keyPressed && ticker > 3) {
    if (keyCode == UP && itemSelected > 0) {
      decrementItemSelected();
    } else if (keyCode == DOWN && itemSelected <2) {
      incrementItemSelected();
    } else if (key == ENTER) {
      gameState=2; // i am setting this to 2:gameplay right now, but it should go back to 4:coin toss later
      resetTicker();
    }
    resetTicker();
  }
}

void incrementItemSelected() {
  itemSelected++;
}

void decrementItemSelected() {
  itemSelected--;
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
