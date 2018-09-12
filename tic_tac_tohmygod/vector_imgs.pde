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
/*
void drawEnterPrompt(int xpos_, int ypos_){
 }
 
 void drawSpacebarPrompt(int xpos_, int ypos_){
 }
 
 */
