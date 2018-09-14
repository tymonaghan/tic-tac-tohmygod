TIC-TAC-TOHMYGOD!
======
*9/14* I finally got the customizable player names to work - the key was copying things into temporary arrays of the correct size; creating a playerNameCharsTyped counter variable was very helpful. 

*9/14:* Approaching feature-complete... P1 and P2 can customize their player colors and tokens (still not names, though). Then, they can toss a coin to decide which player goes first. Then they can mark squares on a tic tac toe board alternately, and if one player wins outright via rows or columns, the game will assign the player a win (wins are tracked on the scoreboard), clear the board, and start a new game (the play order will continue from the previous game). Major missing items now are the ability to add a player name, a customization/options screen (both for game rules and visuals), tracking for diagonal wins and tie games, and music for the rest of the game besides the main menu - as well as a ton of refactoring.

*9/13:* This is coming along nicely. The main menu works well, the player selection screen is making good progress, the game board draws properly and players can place their X/O tokens on the board. Still need to make the player name input work (that has been a really tricky part for me), add the "coin toss" to determine who goes first, and add end-game logic (detect and respond when a player has won or when the game is a draw).

*9/7:* The version-zero-point-one branch was my wishful thinking that I could recover some of the work I failed to save the other night, but there isn't much to it, so I won't be using it. But it's a good refresher on how branches work, I've never really needed to use them before. 

["Lazer 84" font](http://sunrise-digital.net/font.html) by Juan Hodgson / Sunrise Digital 

"Protovision" menu music by Kavinsky

Player token images and all other copyrighted materials used under fair use copyright exception with the following rationale:
- this software is non-commercial and primarily for academic purposes, 
- the copyrighted material is not used in its entirety and is remixed/repurposed significantly
- the use of these materials in this software will not effect the commercial viability of any such materials
