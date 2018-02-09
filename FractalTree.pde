private double fractionLength = 0.85; 
private int smallestBranch = 10;
private double branchAngle = 12;  
public void setup() 
{   
	size(640,480);    
} 
public void draw() 
{   
	background(0);   
	stroke(0,255,0);   
	line(320,480,320,380);   
	drawBranches(320,380,70,-PI/2);  //will add later 
  branchAngle+=0.005*(Math.random()-0.5);
} 
public void drawBranches(int x,int y, double branchLength, double angle) {   
  double angle1 = angle + branchAngle;
  double angle2 = angle - branchAngle;
  int eX1 = (int)(branchLength*Math.cos(angle1)+x);
  int eY1 = (int)(branchLength*Math.sin(angle1)+y);
  int eX2 = (int)(branchLength*Math.cos(angle2)+x);
  int eY2 = (int)(branchLength*Math.sin(angle2)+y);
  line(x,y,eX1,eY1);
  line(x,y,eX2,eY2);
  if (branchLength > smallestBranch) {
    drawBranches(eX1,eY1,branchLength*fractionLength,angle1);
    drawBranches(eX2,eY2,branchLength*fractionLength,angle2);
  }
}