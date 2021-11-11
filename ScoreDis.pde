public class ScoreDisp {
  private int scoreX;
  private int scoreY;
  private String Score = "Player Score: ";


  public ScoreDisp(int scoreX, int scoreY) {
    setScoreX(scoreX);
    if (scoreX > 50) { 
      this.scoreX =25;
    } else { 
      this.scoreX = scoreX;
    }
    setScoreY(scoreY);
    if (scoreY > 50) {
      this.scoreY = 25;
    } 
    if (scoreY < 20) {
      this.scoreY = 25;
    } else {
      this.scoreY= scoreY;
    }
  }
  //getter methods
  public int getScoreX()
  {
    return scoreX;
  }
  public int getScoreY()
  {
    return scoreY;
  }

  //setters & validation
  public void setScoreX(int scoreX) {
    this.scoreX = scoreX;
    if (scoreX > 50) { 
      this.scoreX =25;
    }
  }

  public void setScoreY(int scoreY) {
    this.scoreY = scoreY;
    if (scoreY > 50) {
      this.scoreY = 25;
    } 
    if (scoreY < 20) {
      this.scoreY = 25;
    }
  }

  void display() {
    fill(0, 255, 0);
    textSize(25);
    text(Score +   score, this.scoreX, this.scoreY);
  }
}
