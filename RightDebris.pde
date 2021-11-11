public class RightDebris {
  private float diameter; 
  private float x;
  private float y;

  public RightDebris() {
    setDiameter(diameter);
    setX(x);
        if (this.x < 600) {
      this.x = random(600, 1200);
    } 
    setY(y);
    if (this.y >= 0){
      this.y= random(0, height-ship.shipHeight*1.5);
    }
    }
  
  public RightDebris(float x, float y, float diameter) {
    setDiameter(diameter);
    setX(x);
    if (this.x < 600) {
      this.x = random(600, 1200);
    } else 
    this.x = x;
    setY(y);
    if (this.y > height-diameter/2) {
      this.y= random(0, height-ship.shipHeight*1.5);
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
    if (this.x < 600)
      this.x = random(600, 1200); //want to generate at random points off screen and move across to avoid clusters
  } 
  public void setY(float y) {
    this.y= random(0, height-ship.shipHeight*1.5);
  }

  public void resetRightDebris() {
    if (this.x<=0) {
      this.x=random(600, 1200);
      this.y=random(0, height-ship.shipHeight*1.5);
    }
  }

  public void respawnRight() {
    this.x=random(600, 1200);
    this.y=random(0, height-ship.shipHeight*1.5);
  }
  public void update() {
    if (this.x > 0) {
      this.x --;
    }
    resetRightDebris();
  }

  public void display() {
    fill(random(75, 255), random(75, 255), random(75, 255)); //random colouring of debris
    ellipse(this.x, this.y, this.diameter, this.diameter);
  }

  }
