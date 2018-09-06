class Player {
  int victories = 0;
  String playerName;
  boolean isHuman;
  color playerColor;
  int playerToken;
  
  Player(boolean human_){
    isHuman = human_;
  }
  
  void setPlayerName(String name_){
    playerName = name_;
  } //end set player name 
  
  void setPlayerColor (color col_){
    playerColor = col_;
  } // end set player color
  
  void setPlayerToken (int token_){
    playerToken = token_;
  } //end set player token
} //end Player class
