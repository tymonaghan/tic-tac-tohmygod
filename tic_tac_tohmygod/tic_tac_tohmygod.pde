import processing.sound.*;
SoundFile menuMusic;

int gameState = 0;
int ticker = 0;
int runTimeTicker = 0;
int itemSelected = 0;
int characterCount = 0;
PFont lazerFont;
PFont pixelFont;
boolean singlePlayerGame = true;
boolean firstRun = true;
boolean keysHaveBeenPressed = false;
boolean playerOneReady = false;
Player playerOne, playerTwo;
char[] playerNameChars = new char[0];

color color0 = color(#F9FA00); //yellow
color color1 = color(#00FAE3); //teal
color color2 = color(#FA00D9); //pink-magenta
color gameBoardColor = color0;


void setup() {
  size(600, 600);
  lazerFont = createFont("Lazer84.ttf", 32);
  pixelFont = createFont("pixel.otf",30);
  textFont(lazerFont);
  textAlign(CENTER, CENTER);
  frameRate(20);
  menuMusic= new SoundFile (this, "Protovision.wav");
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
  runTimeTicker++;
  musicManager();
  println(PFont.list());
} //end draw

void drawTicTacToeGrid() {
  background(40);
  

  textSize(15);
  fill(playerOne.playerColor);
  textAlign(LEFT);
  text(playerOne.playerName, width*.05, height*.05);

  fill(playerTwo.playerColor);
  textAlign(RIGHT);
  text(playerTwo.playerName, width*.95, height*.05);
} //end drawTicTacToeGrid

void resetTicker() {
  ticker = 0;
} //end resetTicker

void keysHaveBeenPressed() {
  keysHaveBeenPressed=true;
  if (runTimeTicker<100) {
  }//end if
} //end keysHaveBeenPressed

void musicManager() {
  if (firstRun) { //this is just so the music plays once without looping. i'm sure there's a more elegant way to achieve this
    menuMusic.play();
    firstRun = !firstRun;
  }
  //if player presses key before slide-in is complete, skip the music ahead:
  if (keysHaveBeenPressed && runTimeTicker<100) {
   // menuMusic.stop();
   // menuMusic.cue(1.7);
  // menuMusic.play();
  }
  //to repeat music:
  if (!menuMusic.isPlaying() && runTimeTicker>100) {
    menuMusic.cue(5);
    //menuMusic.play();
  } //to loop menu music from the 5 second mark (skipping fade in)
} //end music manager
