public class LivesDisp {
  private int livesX;
  private int livesY;
  private String Lives = "Lives: ";

//constructor takes in x and y coord data and as such need validation arguements
  public LivesDisp(int livesX, int livesY) {
    setLivesX(livesX);
    if (livesX < 550) { 
      this.livesX =475;
    } else { 
      this.livesX = livesX;
    }
    setLivesY(livesY);
    if (livesY > 50) {
      this.livesY = 25;
    } 
    if (livesY < 20) {
      this.livesY = 25;
    } else {
      this.livesY= livesY;
    }
  }
  //getter methods
  public int getLivesX()
  {
    return livesX;
  }
  public int getLivesY()
  {
    return livesY;
  }

  //setters with validation args repeated
  public void setLivesX(int livesX) {
    this.livesX = livesX;
  }

  public void setLivesY(int livesY) {
    this.livesY = livesY;
  }
//In-game lives display on Screen
  void display() {
    fill(0, 255, 0);
    textSize(25);
    int lives = maxLivesPerGame -livesLost;
    text(Lives +   lives, this.livesX, this.livesY);
  }
}
