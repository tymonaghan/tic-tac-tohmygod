class GameBoard {
  color gridLinesColor;
  color gameBoardBackgroundColor;
  int gameBoardLaserIntensity;
  int [] squareStates = new int[9];
  /*int square0state;
   int square1state;
   int square2state;
   int square3state;
   int square4state;
   int square5state;
   int square6state;
   int square7state;
   int square8state;  */
  // 0 == unmarked,  1 == player1/x,  2 == player2/o

  GameBoard(color boardColor_, int lasers_) {
    for (int i = 0; i <9; i++) { //initialize the square states array to all 0s - unplayed board
      squareStates[i] = 0;
    } //end for loop to initialize square states array

    gridLinesColor = color0;
    gameBoardBackgroundColor = 45;
    gameBoardLaserIntensity = 1;
  }

  void drawGridLines() {
    stroke(gameBoardColor);  
    line(width*.33, height*.1, width*.33, height*.9);
    line(width*.66, height*.1, width*.66, height*.9);
    line(width*.1, height*.33, width*.9, height*.33);
    line(width*.1, height*.66, width*.9, height*.66);
  } //end drawGridLines

  boolean checkIfSquareAvailable(int squareToCheck_) {
    int squareToCheck = squareToCheck_;
    // if (squareToCheck
    return true;
  }

  void playTokenOnSquare(int squareToPlay_, boolean playerOnesTurn_) {
    int squareToPlay = squareToPlay_;
    boolean playerOnesTurn = playerOnesTurn_;

    //if the square is already full, return an error
    if (checkIfSquareAvailable(squareToPlay) == false) {
      text("invalid move", 0, 0);

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
  }

  void markSquareO(int square_) {
    int square = square_;
    squareStates[square] = 2;
  }

  void setGameBoardBackgroundColor(color bgCol_) {
    gameBoardBackgroundColor = bgCol_;
  } //end setBoardBackgroundColor

  void setGridLinesColor(color gridCol_) {
    gridLinesColor = gridCol_;
  } //end setGridLinesColor

  void setLaserIntensity(int intense_) {
    gameBoardLaserIntensity = intense_;
  } //end setLaserIntensity

  color getBoardBackgroundColor() {
    return gameBoardBackgroundColor;
  } //get BoardBackgroundColor

  color getGridLinesColor() {
    return gridLinesColor;
  } //get gridlinescolor

  int getLaserIntensity() {
    return gameBoardLaserIntensity;
  }
} //end gameBoard class
