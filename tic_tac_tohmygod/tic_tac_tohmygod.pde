int gameState = 0;
int ticker = 0;
int itemSelected = 0;
int characterCount = 0;
PFont lazerFont;
boolean singlePlayerGame = true;
boolean playerOneReady = false;
Player playerOne, playerTwo;
char[] playerNameChars = new char[0];

void setup() {
  size(600, 600);
  lazerFont = createFont("Lazer84.ttf", 32);
  textFont(lazerFont);
  textAlign(CENTER,CENTER);
  frameRate(20);
}

static class EGameState
{
  static final int mainMenu=0;
  static final int playerSelection=1;
  static final int gameplay=2;
  static final int gameOver=3;
  static final int coinToss=4;
}

void draw() {
  switch (gameState) {
  case EGameState.mainMenu:
    mainMenu();
    break;

  case EGameState.playerSelection:
  playerSelection();
    break;

  case EGameState.gameplay:
    drawTicTacToeGrid();
    break;

  case EGameState.gameOver:

    break;
    
    case EGameState.coinToss:
    coinToss();
    break;
  } //end gameState switch
  ticker++;
} //end draw

void drawTicTacToeGrid() {
  background(40);
  line(width*.33, height*.1, width*.33, height*.9);
  line(width*.66, height*.1, width*.66, height*.9);
  line(width*.1, height*.33, width*.9, height*.33);
  line(width*.1, height*.66, width*.9, height*.66);
  
  textSize(15);
  fill(playerOne.playerColor);
  textAlign(LEFT);
  text(playerOne.playerName, width*.05, height*.05);
  
  fill(playerTwo.playerColor);
  textAlign(RIGHT);
  text(playerTwo.playerName, width*.95, height*.05);
} //end drawTicTacToeGrid

void resetTicker(){
  ticker = 0;
} //end resetTicker
