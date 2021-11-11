import javax.swing.*;
//objects 
ScoreDisp scoreDisp;
LivesDisp lives;
Ship ship;
Player player;
LeftDebris[] leftDebris;
RightDebris[] rightDebris;
//Current game data
int livesLost = 0;             //keeps track of the number of lives lost in the current game
int score = 0;                 //high score of the current game
int maxLivesPerGame = 3;       //maximum number of lives that can be lost before the game ends
//Tournament data
int maxNumberOfGames; //maximum number of games in a tournament
int numberOfGamesPlayed = 0;   //number of games played, so far, in the tournament

void setup() {
  frameRate(45);
  size(600, 600);
  noCursor();
  background(0);

  scoreDisp = new ScoreDisp(25, 15);
  lives = new LivesDisp(475, 15);
  ship = new Ship(width/2, height-100, 100, 60);
  maxNumberOfGames = Integer.parseInt(JOptionPane.showInputDialog("Welcome to SpaceDust Dodgers\n\n Please enter the number of games you would like to play: ", "3"));
  player = new Player(JOptionPane.showInputDialog("Enter the player name (max 6 chars: "), maxNumberOfGames);
  leftDebris = new LeftDebris[25];
  rightDebris = new RightDebris[25]; 

  for (int i = 1; i <= leftDebris.length; i++)
  {
    leftDebris[i-1] = new LeftDebris();
    rightDebris[i-1] = new RightDebris();
  }
}

void draw() {
  background(0);

  ship.update();
  ship.display();
  scoreDisp.display();
  lives.display();
  for (int i=0; i < leftDebris.length; i++) {
    leftDebris[i].update();
    leftDebris[i].display();
    rightDebris[i].update();
    rightDebris[i].display();

    //draw the leftDebris at its new location and check for a collision with the ship
    if (livesLost < maxLivesPerGame) {  
      //Set variable to true if leftDebris or rightDebris and ship are overlapping, false if not 
      boolean hitship = ((leftHitShip(ship, leftDebris[i])||rightHitShip(ship, rightDebris[i]))||(leftHitShip(ship, leftDebris[i])&&rightHitShip(ship, rightDebris[i])));
      if (hitship== true) {
        ship.respawn();
        leftDebris[i].respawnLeft();
        rightDebris[i].respawnRight();
        livesLost++;//increase the liveLost in the current game by 1, Debris hits the ship
      }
    }
  }
  if (livesLost >= maxLivesPerGame) {
    //If the player has no lives left in the current game
    player.addScore(score);
    numberOfGamesPlayed++;        
    //If the player has more games left in the tournament, 
    //display their score and ask them if they want to continue with the tournament.
    if (numberOfGamesPlayed < maxNumberOfGames) {
      int reply = JOptionPane.showConfirmDialog(null, 
        "Game Over! You scored " + score + ".\nWould you like to play the next game in your tournament?", 
        "Play next game?", 
        JOptionPane.YES_NO_OPTION);
      if (reply == JOptionPane.YES_OPTION) {
        //player chooses to play the next game in their tournament.
        resetGame();
      } else if (reply == JOptionPane.NO_OPTION) {
        //player chooses to leave the tournament early.
        tournamentOver();
      }
    } else {
      //the player has no more games left in the tournament 
      tournamentOver();
    }
  }
}




//method prepares for the next game by reseting the variables that store the current game information.
void resetGame()
{
  println("Game Over!");
  println("Starting a new game...");
  livesLost = 0;          //resets the lives lost in the current game to zero
  score = 0;              //resets the score of the current game to zero
}
void tournamentOver()
{
  JOptionPane.showMessageDialog(null, player.getPlayerName() + ", your tournament is over! \n\n"  
    + "Number of games played: " + numberOfGamesPlayed
    + "\n\n"                     + player.toString()
    + "\n\nHighest Score: "      + player.highestScore()
    +   "\nLowest Score:  "      + player.lowestScore()
    +   "\nAverage Score:  "      + player.averageScore()
    );
  exit();
}
void keyPressed() {
  if (keyCode == UP) {
    ship.isUp = true;
    ship.isDown = false;
  } else if (keyCode == DOWN) {
    ship.isDown = true;
    ship.isUp = false;
  }
}
void keyReleased() {
  if (keyCode == UP) {
    ship.isUp = false;
  } else if (keyCode == DOWN) {
    ship.isDown = false;
  }
}
//contact detection for both left and right 
boolean leftHitShip(Ship ship, LeftDebris leftDebris)
{
  //These variables measure the magnitude of the gap between the ship and the leftDebris.  
  float circleDistanceX = abs(leftDebris.getX() - ship.getShipX() - ship.getShipWidth()/2);
  float circleDistanceY = abs(leftDebris.getY() - ship.getShipY() - ship.getShipHeight()/2);
  if (circleDistanceX > (ship.getShipWidth()/2  + leftDebris.getDiameter()/2)) { 
    return false;
  }
  if (circleDistanceY > (ship.getShipHeight()/2 + leftDebris.getDiameter()/2)) { 
    return false;
  }
  if (circleDistanceX <= (ship.getShipWidth()/2)) { 
    return true;
  }
  if (circleDistanceY <= (ship.getShipHeight()/2)) { 
    return true;
  } 
  float cornerDistance = pow(circleDistanceX - ship.getShipWidth()/2, 2) +
    pow(circleDistanceY - ship.getShipHeight()/2, 2);
  if (cornerDistance <= pow(leftDebris.getDiameter()/2, 2)) {
    return true;
  } else {
    return false;
  }
}
boolean rightHitShip(Ship ship, RightDebris rightDebris)
{
  //These variables measure the magnitude of the gap between the ship and the rightDebris.  
  float circleDistanceX = abs(rightDebris.getX() - ship.getShipX() - ship.getShipWidth()/2);
  float circleDistanceY = abs(rightDebris.getY() - ship.getShipY() - ship.getShipHeight()/2);
  if (circleDistanceX > (ship.getShipWidth()/2  + rightDebris.getDiameter()/2)) { 
    return false;
  }
  if (circleDistanceY > (ship.getShipHeight()/2 + rightDebris.getDiameter()/2)) { 
    return false;
  }
  if (circleDistanceX <= (ship.getShipWidth()/2)) { 
    return true;
  }
  if (circleDistanceY <= (ship.getShipHeight()/2)) { 
    return true;
  } 
  float cornerDistance = pow(circleDistanceX - ship.getShipWidth()/2, 2) +
    pow(circleDistanceY - ship.getShipHeight()/2, 2);
  if (cornerDistance <= pow(rightDebris.getDiameter()/2, 2)) {
    return true;
  } else {
    return false;
  }
}
    
