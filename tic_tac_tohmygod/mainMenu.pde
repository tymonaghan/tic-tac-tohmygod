void mainMenu() {
  background(0);
  textSize(50);
  fill(#FFFF6C);
  text("TIC - TAC - \n TOHMYGOD!", width*.5,height*.250);
  textSize(30);
  if (singlePlayerGame){
    fill(255,100,255);
  } else {
    fill (255);
  } // end if /else for 1p game highlighted
  text("1P vs CPU", width/2, height*.6);
  if (!singlePlayerGame){
    fill(255,100,255);
  } else {
    fill(255);
  } //end if/else for 2p game highlighted
  text("1P vs 2P", width/2, height*.75);
  listenForKeypressMainMenu();
}

void listenForKeypressMainMenu(){
  if (keyPressed == true && ticker >3){
    ticker = 0;
    if (keyCode == UP || keyCode == DOWN) {
      singlePlayerGame = !singlePlayerGame;
    } else if (key == ' ' || key == ENTER){ //end if up or down is pressed, begin if space or enter is pressed
    playerOne = new Player(true);
    playerTwo = new Player(!singlePlayerGame);
    gameState=1;
    }//end if space or enter is pressed
  }//end if key is pressed
} //end listenforKeypressMainMenu
