int gameState = 0;

void setup(){
  size(600,600);
}

static class EGameState
{
  static final int mainMenu=0;
  static final int playerSelection=1;
  static final int gameplay=2;
  static final int gameOver=3;
}

void draw(){
  switch (gameState) {
    case EGameState.mainMenu:
    mainMenu();
    break;
    
    case EGameState.playerSelection:
    
    break;
    
    case EGameState.gameplay:
    drawTicTacToeGrid();
    break;
    
    case EGameState.gameOver:
    
    break;
  } //end gameState switch
} //end draw

void drawTicTacToeGrid(){
  line(width*.33, height*.1, width*.33, height*.9);
  line(width*.66, height*.1, width*.66, height*.9);
  line(width*.1, height*.33, width*.9, height*.33);
  line(width*.1, height*.66, width*.9, height*.66);
} //end drawTicTacToeGrid

void mainMenu(){
  background(0);
  text("1P vs CPU", width/2, height*.5);
  text("1P vs 2P", width/2, height*.75);
}
