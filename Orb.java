import java.util.*;

public class Orb implements Comparable{
    private int size; //size is the area of the orb, not the radius
    private int xcor;
    private int ycor;
    //speed not tracked but calculated when needed
    
    public int getSpeed(){
	int y = 20 - 2*(int)(Math.log(getS()));
	if(y < 2){
	    y = 2;
	}
	return y;
    }
    
    public int compareTo(Orb other){
	return this.size-other.getS();
    }
    
    
    public void turn(ArrayList<Orb> orbs){
	VPoint[] vect = new VPoint[orbs.size()];
	for(int x = 0; x < orbs.size(); x++){
	    //NEED TO CHECK IF TOO CLOSE SO CAN KILL
	    vect[x] = process(orbs.get(x));
	}
	//takes arraylist of orbs and makes vector to process orbs.
    }
    
    
  
    public VPoint process(Orb a){
	int score = getS() - a.getS(); //negative score negates direction
	int x = a.getX() - getX(); //saves direction of X and Y
	int y = a.getY() - getY();
	score = (int)(20 * score / Math.sqrt(x^2 + y^2)); //alters intensity, somewhat arbitrary
	return new VPoint(score*x, score*y);
    }
    
    public void setX(int a){
	xcor = a;
    }
    
    public void setY(int a){
	ycor = a;
    }
    
    public void setS(int a){
	size = a;
    }
    
    public int getS(){
	return size;
    }
    
    public int getX(){
	return xcor;
    }
    
    public int getY(){
	return ycor;
    }
    
    
}
