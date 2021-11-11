public class Ship { 
  private int shipX;
  private int shipY;
  private int shipHeight;
  private int shipWidth;

  boolean isUp = false;
  boolean isDown = true;
  boolean scoreAPoint=false;

  public Ship() {
    setShipX(shipX);
    setShipY(shipY);
    setShipWidth(shipWidth);
    setShipHeight(shipHeight);
  }


  public Ship(int shipX, int shipY, int shipWidth, int shipHeight) { //constructor statement with vaildation arguements for position and dimensions of ship
    setShipX(shipX);
    if (shipX >= width/2 + this.shipWidth) {
      shipX = width/2;
      if (shipX <= width/2 - this.shipWidth) {
        shipX = width/2;
      }
      setShipY(shipY);
      if (shipY < height -  this.shipHeight+30) {
        this.shipY = shipY;
      }
      setShipWidth(shipWidth);
      if ((shipWidth >= 20) && (shipWidth <= 40)) {
        this.shipWidth = shipWidth;
      } else {
        // If an invalid width is passed as a parameter, a default width of 20 is imposed.
        this.shipWidth = 20;
      }
      setShipHeight(shipHeight);
      if ((shipHeight >= 50) && (shipHeight <= height/2)) {
        this.shipHeight = shipHeight;
      } else {
        // If an invalid height is passed as a parameter, a default height of 50 is imposed
        this.shipHeight = 60;
      }
    }
  } 


  //getter methods
  public int getShipX()
  {
    return shipX;
  }
  public int getShipY()
  {
    return shipY;
  }
  public int getShipHeight()
  {
    return shipHeight;
  }
  public int getShipWidth()
  {
    return shipWidth;
  }

  //setter methods  
  public void setShipX(int shipX)
  {
    //The ship width must be between 10 and width/2 (inclusive)
    shipX = width/2;
    this.shipX = shipX;
  }
  public void setShipY(int shipY)
  {
    if (shipY < height -  this.shipHeight+30) {
      this.shipY = shipY;
    }
  } 

  public void setShipWidth(int shipWidth)
  {
    //The paddle width must be between 10 and width/2 (inclusive)
    if ((shipWidth >= 20) && (shipWidth <= 40)) {
      this.shipWidth = shipWidth;
    }
  }  
  public void setShipHeight(int shipHeight)
  {
    //The paddle height must be between 50 and height/2 (inclusive)
    if ((shipHeight >= 50) && (shipHeight <= height/2)) {
      this.shipHeight = shipHeight;
    }
  }
  void respawn() {
    this.shipY = height - (this.shipHeight+30);
    this.isUp = false;
    this.isDown = false;
  }
  void update() {
    if (this.isUp && this.shipY > 0) {
      this.up();
    } else if (this.isDown && this.shipY < height - (this.shipHeight+30)) {
      this.down();
    }
    if ((this.scoreAPoint()==true)) {
      this.respawn();
      score++;
      println("Score:  "  + score);
    }
  }
  public void display() {
    fill(0, 255, 0);
    rect(this.shipX, this.shipY, this.shipWidth, this.shipHeight);
  }
  public void up() {
    this.shipY-=2;
  }
  void down() {
    this.shipY+=2;
  }
 
boolean scoreAPoint() {
    if (this.shipY <= 0) {
      return true;
    } else
      return false;
  }
}
