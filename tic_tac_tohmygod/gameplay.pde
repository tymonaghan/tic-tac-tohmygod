void gameplay() {  // main gameplay loop - draw bg and grid, and players take turns sequentially
  background(gameBoard.getBoardBackgroundColor());
  gameBoard.drawGridLines();
  gameBoard.drawScoreBoard();
  gameBoard.drawPlayedTokens();  
  gameBoard.checkForWinner();
  if (playerOnesTurn) {
    playerOne.takeTurn();
  } else {
    playerTwo.takeTurn();
  }
} //end gameplay


void helpPopup() {
  pushStyle();
  stroke(25);
  strokeWeight(3);
  fill(240);
  rectMode(CENTER);
  rect(width/2, height/2, width*.75, height*.75);
  fill(0);
  textFont(pixelFont);
  textSize(16);
  text("Tic Tac Tohmygod \n How to Play: \n\n\n Use      ARROW KEYS \n to select a square. \n Press [SPACE] to mark that square.\n\nPress [ENTER] or [SPACE]\nTo return to game.", width/2, height/2);
  drawLeftRightArrows(int(width*.43), int(height*.48), 0); //i kind of just hard-coded where theses show up right now, they aren't actually flowing with the text.
  popStyle();
}//end helpPopup
