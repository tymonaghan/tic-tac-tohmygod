void coinToss() { //toss a virtual coin to determine who goes first (is "X").
  fill(255);
  background(35);
  if (!coinPickLockedIn) { //before the player picks heads or tails, show the selection menu.
    text("tossing coin \nto determine play order\n\n\n\n\n"+playerOne.playerName+" call it:", width/2, height*.15);

    rectMode(CENTER);  //HEADS button
    if (playerOnePicksHeads) {
      fill(colorScheme[0]);
    } else {
      fill (colorScheme[0], 100);
    }
    rect(width*.3, height *.75, width*.25, height*.10);
    fill(0);
    text("HEADS", width*.3, height*.75);

    if (!playerOnePicksHeads) {//TAILS button
      fill(colorScheme[0]);
    } else {
      fill (colorScheme[0], 100);
    }
    rect(width*.7, height*.75, width*.25, height*.10);
    fill(0);
    text("TAILS", width*.7, height*.75);

    drawSpinningCoin();
  } else {  //once the player selects heads or tails, "toss" the coin and give the result, ENTER again moves to gameplay
    if (!coinTossComplete) {
      itsHeads = getCoinResult(); //spin the coin - it will keep flipping randomly between heads & tails
    }
    println(itsHeads);
    if (playerOnePicksHeads) {
      text(playerOne.playerName+"   CALLS \nHEADS", width/2, height*.2);
    } else {
      text(playerOne.playerName+"  CALLS  \nTAILS", width/2, height*.2);
    }

    drawLandingCoin();
  }
} //end coin toss

void drawSpinningCoin() {
  if (runTimeTicker/2%3==0) {
    coin1(int(width/2), int(height*.4));
    if (drawCoinShowingHeads) {
      coinSpinningHeads(int(width/2), int(height*.4)-coinTossFallCounter);
    } else { 
      coinSpinningTails(int(width/2), int(height*.4)-coinTossFallCounter);
    }
  } else if (runTimeTicker/2%3==1) {
    coin2(int(width/2), int(height*.4));
  } else if (runTimeTicker/2%3==2) {
    coin3(int(width/2), int(height*.4));
    drawCoinShowingHeads = !drawCoinShowingHeads;
  }
}

boolean getCoinResult() {
  int coin = int(random(100));
  if (coin%2==0) {
    coinTossComplete=true;
    return true;
  } else {
    coinTossComplete=true;
    return false;
  }
}

void drawLandingCoin() {
  if (coinTossFallCounter>-150) { //while the coin is falling down
    if (runTimeTicker/2%3==0) {
      coin1(int(width/2), int(height*.4)-coinTossFallCounter);
      if (drawCoinShowingHeads) {
        coinSpinningHeads(int(width/2), int(height*.4)-coinTossFallCounter);
      } else { 
        coinSpinningTails(int(width/2), int(height*.4)-coinTossFallCounter);
      }
    } else if (runTimeTicker/2%3==1) {
      coin2(int(width/2), int(height*.4)-coinTossFallCounter);
    } else if (runTimeTicker/2%3==2) {
      coin3(int(width/2), int(height*.4)-coinTossFallCounter);
      drawCoinShowingHeads = !drawCoinShowingHeads;
      coinTossFallCounter-=15;
    }
  } else {
    showCoinTossResult();//once the coin is done falling:
  }
}

void showCoinTossResult() {
  coin1(int(width/2), int(height*.4)-coinTossFallCounter);
  //if the result is heads:
  if (itsHeads) {
    coinSpinningHeads(int(width/2), int(height*.4)-coinTossFallCounter);
    text("Its Heads!", width/2, height*.5);
    if (playerOnePicksHeads) {
      fill(255);
      text(playerOne.playerName+"GOES FIRST", width/2, height*.8);
      playerOnesTurn=true;
    } else {
      fill(255);
      text(playerTwo.playerName+"GOES FIRST", width/2, height*.8);
      playerOnesTurn=false;
    }
    //if the result is tails:
  } else { 
    coinSpinningTails(int(width/2), int(height*.4)-coinTossFallCounter);
    fill(colorScheme[0]);
    text("It's Tails!", width/2, height*.5);
    if (!playerOnePicksHeads) {
      text(playerOne.playerName+"GOES FIRST", width/2, height*.5);
      playerOnesTurn = true;
    } else {
      text(playerTwo.playerName+"GOES FIRST", width/2, height*.5);
      playerOnesTurn = false;
    }
  }
}
