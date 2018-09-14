void keyPressed() {
  if (ticker > 3) {
    resetTicker();
  }
  switch (gameState) {
  case EGameState.mainMenu:
    if (keyCode == UP || keyCode == DOWN) { //if UP-DOWN, toggle the menu selection
      singlePlayerGame = !singlePlayerGame;
    } else if (key == ' ' || key == ENTER) { //if SPACE or ENTER, init characters and go to characterselectionmenu
      /* moving the initialization of players into setup
       playerOne = new Player(true);
       playerTwo = new Player(!singlePlayerGame);
       playerOne.setPlayerColor(0);
       playerTwo.setPlayerColor(1);
       playerTwo.setPlayerName("P2");
       */
      gameState=1;
    } else if ( key == 'o' || key == 'O') { //if O, open options menu
      gameState = 5;
    } else if (key == 'h' || key == 'H') {
      previousGameState=0;
      gameState = 6;//end if space or enter is pressed
    }
    break;

  case EGameState.playerSelection:
    if (sectionSelected==3 && key == ENTER) {
      if (!playerOneReady) {
        sectionSelected=0;
        if (playerOne.playerColor==1) {
          playerTwo.setPlayerColor(0);
        }
        if (playerOne.playerToken==0) {
          playerTwo.setPlayerToken(1);
        }
        playerOneReady = true;
      } else {
        gameState=4;
      }
    } else if (sectionSelected == 0) {
      //playerNameChars[] = append(playerNameChars, key);
    } // end name section



    if (keyCode == UP && sectionSelected > 0) { // UP moves the menu up
      decrementsectionSelected();
    } else if (keyCode == DOWN && sectionSelected <3) { //DOWN moves the menu down
      incrementsectionSelected();
    } else if (keyCode == LEFT) { //LEFT and RIGHT increment or decrement the selection boxes
      if (sectionSelected==1) {
        decrementTokenSelected();
      } else if (sectionSelected==2) {
        decrementColorSelected();
      }
    } else if (keyCode == RIGHT) {
      if (sectionSelected==1) {
        incrementTokenSelected();
      } else if (sectionSelected == 2 ) {
        incrementColorSelected();
      }
    }
    break;

  case EGameState.coinToss:

    if (keyCode == LEFT || keyCode == RIGHT) {
      playerOnePicksHeads = !playerOnePicksHeads;
    } else if (key == 'h' || key == 'H') {
      previousGameState=4;
      gameState = 6;
    } else if (key == ENTER) {
      if (!coinPickLockedIn) {
        coinPickLockedIn = true;
      } else {
        gameState = 2;
      }
    }
    break;

  case EGameState.gameplay:
    if (key == ' ') {
      gameBoard.playTokenOnSquare(gameBoard.squareHighlighted, playerOnesTurn);
    } else if (key == 'h' || key == 'H') {
      previousGameState=2;
      gameState = 6;
    } else if (key == CODED && keyCode == LEFT) {      
      if (gameBoard.squareHighlighted < 1) {
        gameBoard.setHighlightedSquare(8);
      } else {
        gameBoard.squareHighlighted--; //dont think this is legal
      }
    } else if (key == CODED && keyCode == RIGHT) {
      if (gameBoard.squareHighlighted > 7) {
        gameBoard.setHighlightedSquare(0);
      } else {
        gameBoard.squareHighlighted++;
      }
    }
    break;

  case EGameState.helpPopup:
    if (key==' '||key==ENTER||key==RETURN) {
      gameState=previousGameState;
    }
    break;

  case EGameState.optionsMenu:

    break;
  } //end switch
} //end keypressed
