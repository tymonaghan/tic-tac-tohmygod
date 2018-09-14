class Player {
  int victories = 0;
  String playerName;
  boolean isHuman;
  int playerColor;
  int playerToken;
  int playerNameCharsTyped;

  Player(boolean human_) {
    isHuman = human_;
    playerName = "playername";
    playerToken = 0;
    playerNameCharsTyped = 0;
  }

  void takeTurn() { //start keeping track of and drawing which square the player has selected. 
    //gameBoard.squareSelector();
    this.turnPreviewer();
  }

  //shows a semi-transparent token to preview which square the player has selected
  void turnPreviewer() {
    fill(255, 150);
    rectMode(CENTER);
    int tempnum = gameBoard.getHighlightedSquare();
    rect(width*gameBoard.squareXXs[tempnum], height*gameBoard.squareYYs[tempnum], width*.2, height*.2);
  } //end turnpreviewer


  void setPlayerName(String name_) {
    playerName = name_;
  } //end set player name 

  void setPlayerColor (int colorIndex_) {
    int colorIndex = colorIndex_;
    println(colorIndex);
    playerColor = colorIndex;
  } // end set player color

  int getPlayerColor() {
    return playerColor;
  }

  void setPlayerToken (int token_) {
    playerToken = token_;
  } //end set player token

  void awardMatchVictory() {
    victories++;
  }

  void showCustomizationMenu() {

    fill(255);
    textSize(35);
    //fill(colorScheme[this.playerColor]);
    text(this.playerName, width/2, height*.25);
    tint(colorScheme[this.playerColor]);
    image(tokenImages[this.playerToken], width*.5+(textWidth(this.playerName)*.5+50), height *.24);
    tint(255);

    textSize(30);
    fill(255);
    text("Name", width*.225, height *.4);
    pushStyle();
    stroke(255);
    fill(150, 50);
    rect(width*.6, height*.4, width*.45, height*.085);
    fill(255);
    pushStyle();
    textFont(pixelFont);
    textSize(12);
    textAlign(RIGHT);
    //text("press ENTER\nto confirm",width*.85, height*.4);
    popStyle();
    for (int i = 0; i < this.playerNameCharsTyped; i++) { //write the players name in the box as they type    
      textAlign(LEFT);
      text(this.playerName, width*.4, height*.415);
    }
    popStyle();

    text("Token", width*.225, height*.55); //Player Token Picker Section
    for (int i=0; i<6; i++) { //draw thw row of tokenImages[]
      image(tokenImages[i], (width*.385)+55*i, height*.55, 45, 45);
    } //end for-loop

    text("Color", width*.225, height*.7); //Player Color Picker Section
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
      this.setPlayerToken(tokenHighlightBox());
    } else if (sectionSelected == 2) {
      this.setPlayerColor(colorHighlightBox());
    }// end if
  }

  void resetPlayerNameChars() {
    this.playerNameCharsTyped = 0;
  } // end resetPlayerNameChars

  void incrementPlayerNameChars() {
    if (playerNameCharsTyped < playerNameChars.length-1) {
      this.playerNameCharsTyped++;
    }
  } // end increment player name chars

  void collectPlayerName() {
    char[] tempChars = new char[playerNameCharsTyped];
    arrayCopy(playerNameChars, tempChars, playerNameCharsTyped);
    String tempString = new String(tempChars);
    setPlayerName(tempString);
  }
} //end Player class
