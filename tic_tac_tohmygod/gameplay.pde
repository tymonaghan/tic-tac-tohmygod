void gameplay(){  // main gameplay loop - draw bg and grid, and players take turns sequentially
  background(gameBoard.getBoardBackgroundColor());
  gameBoard.drawGridLines();
  gameBoard.drawScoreBoard();
  
  if (playerOnesTurn){
    playerOne.takeTurn();
  } else {
    playerTwo.takeTurn();
  }
  
}//end gameplay
