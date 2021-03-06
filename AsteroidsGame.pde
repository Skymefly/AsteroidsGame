//your variable declarations here
SpaceShip Spa;
Star [] Stars;
public void setup() 
{
  //your code here
  Spa = new SpaceShip();
}
public void draw() 
{
  //your code here
  Spa.show();
}
public void KeyPressed()
{

}
class Star()
{
  protected int StarX, StarY;
  Star() {
    StarX=Math.random()*400;
    StarY=Math.random()*400;
  }
  public void show()
  {
    fill(255);
    ellipse(StarX, StarY, 2, 2);
  }
}
class SpaceShip extends Floater  
{   
    //your code here
    double degrees;
    SpaceShip() {
      int corners=3;
      xCorners[0] = -8;
      xCorners[1] = 16;
      xCorners[2] = -8;
      xCorners[3] = -2;
      yCorners[0] = -8;
      yCorners[1] = 0;
      yCorners[2] = 8;
      yCorners[3] = 0;
      xCorners = new int[corners];
      yCorners = new int[corners];
      myColor=(255);
      Floater.setCenterX(200);
      Floater.setCenterY(200);
      Floater.setDirectionX(0.0);
      Floater.setDirectionY(0.0);
      Floater.setPointDirection(0.0);
    }
    
    public setCenterX (int x) {myCenterX=x;}
    public int getCenterX() {return (int)myCenterX;}
    public setCenterY (int y) {myCenterY=y;}
    public int getCenterY() {return (int)myCenterY;}
    public setDirectionX (double x) {myDirectionX=x;}
    public double getDirectionX() {return (double)myDirectionX;}
    public setDirectionY (double y) {myDirectionY=y;}
    public double getDirectionY() {return (double)myDirectionY;}
    public setPointDirection(int degrees) {myPointDirection=degrees;} 
    public double getPointDirection() {return (double)myPointDirection;}
}
abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 

