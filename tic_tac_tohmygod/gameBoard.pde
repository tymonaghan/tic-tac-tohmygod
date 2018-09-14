//controls the appearance and behavior of the gameplay area, including background, game grid, individual game squares, and scoreboard

class GameBoard {  
  color gridLinesColor;
  color gameBoardBackgroundColor;
  int gameBoardLaserIntensity;
  int [] squareStates = new int[9];
  float[] squareXXs = new float[9];
  float[] squareYYs = new float[9];
  int squareHighlighted = 4;
  // 0 == unmarked,  1 == player1/x,  2 == player2/o

  GameBoard(color boardColor_, int lasers_) {
    for (int i = 0; i <9; i++) { //initialize the square states array to all 0s - unplayed board
      squareStates[i] = 0;
    } //end for loop to initialize square states array

    for (int xx = 0; xx < 9; xx++) { //initialize the squareXXs array
      squareXXs[xx] = 0.25+(0.25*(xx%3));
    }

    for (int yy = 0; yy < 9; yy++) { //initialize the squareYYs array
      squareYYs[yy] = 0.25 +(int(yy/3)*.25);
    }
    /*  the init loop for the 2d arrays, should i decide to bring them back
     for (int j = 0; j < 3; j++){
     for (int k = 0; k < 3; k++){
     squareXs[j][k] = 0.25+(j*0.25);
     squareYs[j][j] = 0.25+(k*0.25);
     }
     } // end for-loop to initialize X-Y arrays
     */

    gridLinesColor = color(255, 255, 150);
    gameBoardBackgroundColor = 45;
    gameBoardLaserIntensity = 1;
  }

  void drawGridLines() {
    stroke(gridLinesColor);  
    line(width*.33, height*.1, width*.33, height*.9);
    line(width*.66, height*.1, width*.66, height*.9);
    line(width*.1, height*.33, width*.9, height*.33);
    line(width*.1, height*.66, width*.9, height*.66);

    //println(squareYYs);
  } //end drawGridLines

  void squareSelector() { // the player uses LEFT and RIGHT arrows to cycle through the squares on the game board
    if (keyPressed == true && ticker > 3) {
      resetTicker();
    }
  }


  void setHighlightedSquare(int int_) { //setter for changing the squareHighlighted variable
    squareHighlighted = int_;
  }

  int getHighlightedSquare() { //getting for the squareHighlighted variable
    return squareHighlighted;
  }

  boolean checkIfSquareAvailable(int squareToCheck_) { //check if the square is open (true) or has already been played (false)
    int squareToCheck = squareToCheck_;
    if (squareStates[squareToCheck] == 0) {
      return true;
    } else {
      return false;
    }
  }//end checkifsquareavailable

  void playTokenOnSquare(int squareToPlay_, boolean playerOnesTurn_) { //function to be called when the player hits ENTER or SPACE on a square during their turn. this and the markX, markO functions are untested.
    int squareToPlay = squareToPlay_;
    boolean playerOnesTurn = playerOnesTurn_;

    //if the square is already full, return an error
    if (checkIfSquareAvailable(squareToPlay) == false) { 
      stroke(0);
      fill(255);
      strokeWeight(3);
      textFont(pixelFont);
      textAlign(CENTER, CENTER);
      textSize(20);
      rect(width/2, height/2, textWidth("invalid move"), 25);
      fill(0);
      text("invalid move", width/2, height/2);
      delayGame=true;
      //but if the square is available...
    } else {
      if (playerOnesTurn) {
        markSquareX(squareToPlay);
      } else {
        markSquareO(squareToPlay);
      }
    } //end if the square is available
  } // end playTokenOnSquare

  void markSquareX(int square_) {
    int square = square_;
    squareStates[square] = 1;
    delayGame=true;
    playerOnesTurn = false;
  }

  void markSquareO(int square_) {
    int square = square_;
    squareStates[square] = 2;
    playerOnesTurn = true;
  }

  void setGameBoardBackgroundColor(color bgCol_) { //setter for bg color
    gameBoardBackgroundColor = bgCol_;
  } //end setBoardBackgroundColor
  color getBoardBackgroundColor() { //getter for bg color
    return gameBoardBackgroundColor;
  } //get BoardBackgroundColor
  void setGridLinesColor(color gridCol_) { //setter for grid lines color
    gridLinesColor = gridCol_;
  } //end setGridLinesColor
  color getGridLinesColor() { //getter for grid lines color 
    return gridLinesColor;
  } //get gridlinescolor
  void setLaserIntensity(int intense_) { //setter for laser intensity (glowing/pulsating lines for win-streak player)
    gameBoardLaserIntensity = intense_;
  } //end setLaserIntensity
  int getLaserIntensity() { //getter for laser intensity
    return gameBoardLaserIntensity;
  }

  void drawScoreBoard() {  //scoreboard - player names and win counts
    textFont(lazerFont);
    textSize(15);
    fill(colorScheme[playerOne.playerColor]);
    textAlign(LEFT);
    text(playerOne.playerName, width*.05, height*.05); //draw p1 name
    fill(colorScheme[playerTwo.playerColor]);
    textAlign(RIGHT);
    text(playerTwo.playerName, width*.95, height*.05); //draw p2 name

    //add helper text under player names
    textFont(pixelFont);
    textSize(15);
    fill(colorScheme[5]);
    if (playerOnesTurn) {
      textAlign(LEFT);
      text("Your move", width*.05, height*.1);
      textAlign(RIGHT);
      text("Please Wait...", width*.95, height*.1);
    } else {
      textAlign(RIGHT);
      text("Your move", width*.95, height*.1);
      textAlign(LEFT);
      text("Please Wait...", width*.05, height*.1);
    }

    //add player tokens to keep track of wins
    for (int i=0; i<playerOne.victories; i++) {
      image(tokenImages[playerOne.playerToken], 20+(25*i), height*.15, 20, 20);
    }
    for (int i=0; i<playerTwo.victories; i++) {
      image(tokenImages[playerTwo.playerToken], (width-20)-(25*i), height*.15, 25, 25);
    }
  } //end drawSCoreBoard

  void drawPlayedTokens() {
    char marker = ' ';
    for (int i = 0; i < 9; i++) {
      if (gameBoard.squareStates[i] == 0) {

        //marker= ' ';
      } else if (gameBoard.squareStates[i] ==1) {
        tint(colorScheme[playerOne.playerColor]);
        image(tokenImages[playerOne.playerToken], width*squareXXs[i], height*squareYYs[i]);
        //marker = 'X';
        //fill(colorScheme[playerOne.playerColor]);
      } else if (gameBoard.squareStates[i] ==2) {     
        tint(colorScheme[playerTwo.playerColor]);
        image(tokenImages[playerTwo.playerToken], width*squareXXs[i], height*squareYYs[i]);
        //marker = 'O';
        //fill(colorScheme[playerTwo.playerColor]);
      }
      //textFont(lazerFont);
      //textSize(50);
      //textAlign(CENTER, CENTER);
      // text(marker, width*squareXXs[i], height*squareYYs[i]);
    } //end for loops
  } //end drawplayedtokens

  void checkForWinner() {
    if (squareStates[0]!=0&&squareStates[0] == squareStates[1] &&squareStates[1]==squareStates[2]) { //top row
      println("Win detected");
      assignWin(squareStates[0]);
    } else if (squareStates[3]!=0&&squareStates[3] == squareStates[4] &&squareStates[4]==squareStates[5]) { //mid row
      println("Win detected");
      assignWin(squareStates[3]);
    } else  if (squareStates[6]!=0&&squareStates[6] == squareStates[7] &&squareStates[7]==squareStates[8]) { //bottom row
      println("Win detected");
      assignWin(squareStates[7]);
    } else  if (squareStates[0]!=0&&squareStates[0] == squareStates[3] &&squareStates[3]==squareStates[6]) { //left col
      println("Win detected");
      assignWin(squareStates[0]);
    } else  if (squareStates[1]!=0&&squareStates[1] == squareStates[4] &&squareStates[4]==squareStates[7]) { //mid col
      println("Win detected");
      assignWin(squareStates[1]);
    } else  if (squareStates[2]!=0&&squareStates[2] == squareStates[5] &&squareStates[5]==squareStates[8]) { //right col
      println("Win detected");
      assignWin(squareStates[2]);
    }
  }

  void assignWin(int player_) {
    resetBoard();
    if (player_ == 1) {
      playerOne.awardMatchVictory();
    } else if (player_ == 2) {
      playerTwo.awardMatchVictory();
    }
  } 

  void resetBoard() { //clear the board: reset squareStates to all 0s
    for (int i = 0; i <9; i++) {
      squareStates[i]=0;
    }
  }//end resetBoard
}//end GameBoard class


/*
  void drawTokenX(int xpos_, int ypos_) {
 textFont(lazerFont);
 textSize(40);
 fill(colorScheme[playerOne.playerColor]);
 image(tokenImages[playerTwo.playerToken], xpos_, ypos_);
 } //end drawTokemX
 
 void drawTokenY(int xpos_, int ypos_) {
 textFont(lazerFont);
 textSize(40);
 fill(playerTwo.playerColor);
 image(tokenImages[playerTwo.playerToken], xpos_, ypos_);
 } //end drawTokenY
 */
