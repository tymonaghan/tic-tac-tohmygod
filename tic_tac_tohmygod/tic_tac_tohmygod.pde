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
boolean playerOnesTurn = true;
Player playerOne, playerTwo;
GameBoard gameBoard;
char[] playerNameChars = new char[0];

color color0 = color(#F9FA00); //yellow
color color1 = color(#00FAE3); //teal
color color2 = color(#FA00D9); //pink-magenta
color uiTextColor = color(255);

void setup() {
  size(600, 600);
  lazerFont = createFont("Lazer84.ttf", 32);
  pixelFont = createFont("pixel.otf",30);
  textFont(lazerFont);
  textAlign(CENTER, CENTER);
  frameRate(20);
  menuMusic= new SoundFile (this, "Protovision.wav");
  gameBoard = new GameBoard(color(255,150,255), 1);
}

static class EGameState // assign gamestates to ints
{
  static final int mainMenu=0; // the main menu, select 1p or 2p
  static final int playerSelection=1; //select player name, token and color
  static final int gameplay=2; //the tic-tac-toe action
  static final int gameOver=3; //when a game is finished; show score and give options (quit, rematch)
  static final int coinToss=4; //a function to randomly decide which player goes first
}

void draw() {
  //draw primarily consists of this gamestate switch which contains all the other parts of the game...
  switch (gameState) {
  case EGameState.mainMenu:
    mainMenu();
    break;
  case EGameState.playerSelection:
    playerSelection();
    break;
  case EGameState.gameplay:
    gameplay();
    break;
  case EGameState.gameOver:

    break;
  case EGameState.coinToss:
    coinToss();
    break;
  } //end gameState switch
  
  //the rest of draw just contains counters and the function for controlling game music
  ticker++;
  runTimeTicker++;
  musicManager();
  //println(gameBoard.squareStates);
  
} //end draw


void resetTicker() {  //this ticker is mainly used to avoid keys being multiple-pressed accidentally
  ticker = 0;
} //end resetTicker

void keysHaveBeenPressed() {  //used in trying to implement the ability to skip the main title fly-in
  keysHaveBeenPressed=true;
  if (runTimeTicker<100) {
  }//end if
} //end keysHaveBeenPressed

void musicManager() {  //this is overly complicated because i tried to make the music jump to the drop when the user skips the main title fly-in
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
