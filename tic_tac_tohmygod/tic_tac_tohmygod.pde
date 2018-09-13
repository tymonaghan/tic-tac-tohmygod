import processing.sound.*; //<>//
SoundFile menuMusic;

int gameState = 0;
int ticker = 0;
int runTimeTicker = 0;
int sectionSelected = 0;
int colorSelected = 0;
int tokenSelected = 0;
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
color[] colorScheme = new color[8];
PImage[] tokenImages = new PImage[6];



void setup() {
  size(600, 600);
  frameRate(20);
  initializeObjectsAndArrays();
}

static class EGameState // assign gamestates to ints
{
  static final int mainMenu=0; // the main menu, select 1p or 2p
  static final int playerSelection=1; //select player name, token and color
  static final int gameplay=2; //the tic-tac-toe action
  static final int gameOver=3; //when a game is finished; show score and give options (quit, rematch)
  static final int coinToss=4; //a function to randomly decide which player goes first
  static final int optionsMenu=5; //menu to alter appearance and gameplay settings
  static final int helpPopup=6; //help popup to apper over game board if user presses H during gameplay
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

  case EGameState.helpPopup:
    helpPopup();
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

void keyPressed() {
  switch (gameState) {

  case EGameState.mainMenu:
    if (ticker>3) {  
      ticker = 0;
      if (keyCode == UP || keyCode == DOWN) {
        singlePlayerGame = !singlePlayerGame;
      } else if (key == ' ' || key == ENTER) { //end if up or down is pressed, begin if space or enter is pressed
      playerOne = new Player(true);
  playerTwo = new Player(!singlePlayerGame);
  playerOne.setPlayerColor(3);
  playerTwo.setPlayerColor(4);
        gameState=1;
      }//end if space or enter is pressed
    }//end if key is pressed
    break;

  case EGameState.playerSelection:
    if (ticker >3) {
      resetTicker();
      if (keyCode == UP && sectionSelected > 0) {
        decrementsectionSelected();
      } else if (keyCode == DOWN && sectionSelected <3) {
        incrementsectionSelected();
      } else if (key == ENTER) {
        gameState=2; // i am setting this to 2:gameplay right now, but it should go back to 4:coin toss later
      } else if (keyCode == LEFT) {
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
    } //end if ticker >3 -- do everything in here to prevent double-presses
    break;

  case EGameState.gameplay:
    if (key == ' ') {
      gameBoard.playTokenOnSquare(gameBoard.squareHighlighted, playerOnesTurn);
    } 
    if (key == 'h' || key == 'H') {
      gameState = 6;
    }
    break;

  case EGameState.helpPopup:
    if (key==' '||key==ENTER||key==RETURN) {
      gameState=2;
    }
  } //end switch
} //end keypressed

void initializeObjectsAndArrays() {
  lazerFont = createFont("Lazer84.ttf", 32);
  pixelFont = createFont("pixel.otf", 30);
  textFont(lazerFont);
  textAlign(CENTER, CENTER);
  menuMusic= new SoundFile (this, "Protovision.wav");
  gameBoard = new GameBoard(color(255, 150, 255), 1);
  colorScheme[0] = color(250,250,0); //yellow
  colorScheme[1]= color(0,250,250); //teal
  colorScheme[2] = color(250,0,250); //pink-magenta
  colorScheme[3] = color(255, 100, 100); //red
  colorScheme[4] = color(100, 255, 100); //green
  colorScheme[5] =  color(255); // white
  colorScheme[6] = color(0); //black
  colorScheme[7] = color(155); //gray
  for (int i = 0; i < 6; i++) {
    tokenImages[i] = loadImage("image"+i+".png");
  }
      imageMode(CENTER);

} //end initializeObjectsandArrays
