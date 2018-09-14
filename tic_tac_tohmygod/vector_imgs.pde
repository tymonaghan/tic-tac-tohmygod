// work in progress -- this is where i will create functions to draw the on-screen keyboard hints


void drawUpDownArrows(int xpos_, int ypos_, color col_) {
  int xpos = xpos_;
  int ypos = ypos_;
  color col = col_;
  noFill();
  stroke(col);
  rectMode(CENTER);
  rect(xpos, ypos, 60, 30, 4);
  line(xpos, ypos+15, xpos, ypos-15);

  line(xpos-15, ypos+10, xpos-15, ypos-10);
  line(xpos-15, ypos-10, xpos-20, ypos-5);
  line(xpos-15, ypos-10, xpos-10, ypos-5);

  line(xpos+15, ypos-10, xpos+15, ypos+10);
  line(xpos+15, ypos+10, xpos+20, ypos+5);
  line(xpos+15, ypos+10, xpos+10, ypos+5);
}

void drawLeftRightArrows(int xpos_, int ypos_, color col_) {
  int xpos = xpos_;
  int ypos = ypos_;
  color col = col_;
  noFill();
  stroke(col);
  rectMode(CENTER);
  rect(xpos, ypos, 60, 30, 4);
  line(xpos, ypos+15, xpos, ypos-15);

  line(xpos-5, ypos, xpos-25, ypos);
  line(xpos-25, ypos, xpos-20, ypos+5);
  line(xpos-25, ypos, xpos-20, ypos-5);

  line(xpos+5, ypos, xpos+25, ypos);
  line(xpos+25, ypos, xpos+20, ypos+5);
  line(xpos+25, ypos, xpos+20, ypos-5);
}

void coin1(int xpos_, int ypos_) {
  int xpos = xpos_;
  int ypos = ypos_;
  pushStyle();

  stroke(0);
  fill(160, 160, 160);
  ellipse(xpos, ypos, 80, 80);
  noFill();
  ellipse(xpos+3, ypos+6, 80, 80);
  popStyle();
}

void coin2(int xpos_, int ypos_) {
  int xpos = xpos_;
  int ypos = ypos_;
  pushStyle();

  stroke(0);
  fill(160, 160, 160);
  ellipse(xpos, ypos, 75, 40);
  noFill();
  ellipse(xpos+4, ypos+2, 75, 40);  
  popStyle();
}

void coin3(int xpos_, int ypos_) {
  int xpos = xpos_;
  int ypos = ypos_;
  pushStyle();
  stroke(0);
  fill(160, 160, 160);
  ellipse(xpos, ypos, 80, 15);
  noFill();
  ellipse(xpos+3, ypos+2, 80, 15);
  popStyle();
}


void coinSpinningHeads(int xpos_, int ypos_) {
  int xpos = xpos_;
  int ypos = ypos_;
  pushStyle();
  fill(0);
  image(tokenImages[playerOne.playerToken], xpos, ypos, 45, 45);
  popStyle();
}
void coinSpinningTails(int xpos_, int ypos_) {
  int xpos = xpos_;
  int ypos = ypos_;
  pushStyle();
  fill(0);
  image(tokenImages[playerTwo.playerToken], xpos, ypos, 45, 45);
  popStyle();
}

/*
void drawEnterPrompt(int xpos_, int ypos_){
 }
 
 void drawSpacebarPrompt(int xpos_, int ypos_){
 }
 
 */
