void mainMenu() {
  int titleXPosition = int(-(width*.5));
  int titleFlyinSpeed = ticker * 6;
  //one-time functions at the beginning of main menu

  background(0);
  if (!keysHaveBeenPressed && runTimeTicker<100) { //if the program has just started and no keys have been pressed, let the main title fly in
    titleMenuSlideIn(titleXPosition, titleFlyinSpeed);
  } else { //if the title has finished flying in or keys have been pressed, show and flash the title
    displayMainMenu();
    comingSoonBadge(); //coming soon badge for 1p option on main menu
  }
  if (keyPressed==true) {
    keysHaveBeenPressed(); //stupid keysHaveBeenPressed toggle for trying to implement title fly-in skipping
  }
}

void comingSoonBadge() { //show a red "COMING SOON" badge over the 1p option, when highlighted.
  if (singlePlayerGame) {
    pushMatrix();
    translate(width/2, height*.6);
    rotate(PI/8);

    pushStyle();
    textFont(pixelFont);
    textSize(20);
    fill(255, 0, 0);
    textAlign(CENTER);
    rectMode(CENTER);
    text("Coming Soon", 0, 0);
    stroke(255, 0, 0);
    strokeWeight(3);
    noFill();
    rect(0, -5, textWidth("Coming Soon")+5, 25);
    
    popStyle();
    popMatrix();
    //I can't quite get this to rotate the way i want it to..
  }
}

void titleMenuSlideIn(int xPos_, int speed_) {  //initial main title fly-in
  int xPosition = xPos_;
  int speed = speed_;
  textSize(50);
  fill(runTimeTicker);
  text("TIC - TAC - \n TOHMYGOD!", xPosition+speed, height*.250);
} //emd titleMenuSlideIn

void displayMainMenu() { //the main menu once the fly-in is complete
  textSize(50);
  fill(color(titleColorFlasher()));
  //change text to slide in and get color as it goes
  text("TIC - TAC - \n TOHMYGOD!", width*.5, height*.250);
  textSize(30);
  if (singlePlayerGame) {
    fill(255, 100, 255,100); //highlight the coming soon in a pale purple
    //fill(255);  // don't highlight the selection when the COMING SOON badge is already there, leave it white
  } else {
    fill (255);
  } // end if /else for 1p game highlighted
  text("1P vs CPU", width/2, height*.6);

  if (!singlePlayerGame) {
    fill(255, 100, 255);
  } else {
    fill(255);
  } //end if/else for 2p game highlighted
  text("1P vs 2P", width/2, height*.75);

  //drawUpDownArrows(int(width*.2),int(height*.9)); //hints to use arrow keys to navigate
  
  //listenForKeypressMainMenu(); //there must be  a better way to handle input but this works for now
}


int titleColorFlasher() { //flash colors for main title.. could maybe use elsewhere, like grid laser effect
  int returnColor = (0);
  if (ticker/3%3==0) {
    returnColor=color(249, 250, 0); //yellow
  } else if (ticker/3%3==1) {
    returnColor=color(#00FAE3); //teal
  } else if (ticker/3%3==2) {
    returnColor= color(#FA00D9); //magenta/pink
  } 
  return returnColor;
}//end titleColorFlasher




//========================================
//==========COIN TOSS =====================
void coinToss() { //toss a virtual coin to determine who goes first (is "X"). untested
  fill(255);
  background(35);
  text("tossing coin \nto determine play order\n\n\n"+playerOne.playerName+" select", width/2, height*.33);

  rectMode(CENTER);
  fill(255, 255, 100);
  rect(width*.3, height *.75, width*.25, height*.10);
  fill(0);
  text("HEADS", width*.3, height*.75);

  fill(255, 255, 225);
  rect(width*.7, height*.75, width*.25, height*.10);
  fill(0);
  text("TAILS", width*.7, height*.75);

  if (keyPressed && ticker >3) {
    if (key == ENTER) {
      gameState=2;
    } //end if ENTER pressed
  } //end if keypressed
} //end coin toss
