public class LeftDebris { //<>// //<>// //<>//
  private float diameter; 
  private float x;
  private float y;
  boolean leftHitShip;
  
  //
  public LeftDebris() {
    setDiameter(diameter);
      setX(x);
    if (this.x > 0) {
      this.x = random(-600, 0);
    } else 
    this.x = x;
    setY(y);
    if (this.y > height-diameter/2) {
      this.y= random(0, height-ship.shipHeight*1.5);
    } else 
    this.y = y;
  }
  
  
  
  public LeftDebris(float x, float y) {
    setDiameter(diameter);
      setX(x);
    if (this.x > 0) {
      this.x = random(-600, 0); //want to generate at random points off screen and move across to avoid clusters
    } else 
    this.x = x;
    setY(y);
    if (this.y > height-diameter/2) {
      this.y= random(0, height-ship.shipHeight*1.5);//want to generate at random points on yaxis and move across to avoid clusters
    } else 
    this.y = y;
  }
  
  
  public float getDiameter()
  {
    return diameter;
  }
  public float getX()
  {
    return x;
  }
  public float getY()
  {
    return y;
  }
  public void setDiameter(float diameter) {
    this.diameter=12;
  }
  public void setX(float x) {
    this.x = random(-600, 0);
  }
  ;
  public void setY(float y) {
    
    this.y= random(0, height-ship.shipHeight*1.5);
  }
  public void resetLeftDebris() {
    if (this.x> width + diameter/2) {
      this.x=random(-600, 0);
      this.y=random(0, height-ship.shipHeight*1.5);
    }
  }
  
public void respawnLeft(){
  this.x=random(-600, 0);
  this.y=random(0, height-ship.shipHeight*1.5);
    }
    
    
  public void update() {
    if (this.x < 610) {
      this.x ++;
    }
    resetLeftDebris();
  }
  public void display() {
    fill(random(75,255),random(75,255),random(75,255)); //set colors to random while avoiding black and other dark colour which will be invisible on background
    ellipse(this.x, this.y, this.diameter, this.diameter);
  }
}
