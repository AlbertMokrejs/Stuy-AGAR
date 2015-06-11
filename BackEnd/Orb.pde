import java.util.*;

public class Orb implements Comparable<Orb> {
  double size; //size is the area of the orb, not the radius
  public double xcor;
  public double ycor;
  public double xchange;
  public double ychange;
  public color C;
  public int ID;
  //speed not tracked but calculated when needed

  public Orb(int x,int y,int z){
    xcor = x;
    ycor = y;
    size = z;
    xchange = 0;
    ychange = 0;
    C = color((int)(Math.random()*155 + 100),(int)(Math.random()*155 + 100) ,(int)(Math.random()*155 + 100) );
  }
  
  public String orbString(){
    return "" + ID + " " + (int)xcor + " " + (int)ycor + " " + (int)size + " ";
  }

  public int getSpeed() {
    double y = 5 - Math.log(getS());
    if (y < 2) {
      y = 1;
    }
    if (size == 1) {
      y = 0;
    }
    return (int)y;
  }

  
    
    
  }
  public int compareTo(Orb other) {
    double X = Math.atan(ycor/xcor);
    if(Math.atan(other.ycor/other.xcor) > X){
     return -1;}
    if(Math.atan(other.ycor/other.xcor) == X){
      return 0;
    }
    return 1;
  }

  public int dist(Orb a) {
    double x = a.getX() - xcor; //saves direction of X and Y
    double y = a.getY() - ycor;
    return (int)Math.sqrt(x*x + y*y);
  }
  
  public void kill(ArrayList<ClientHandlingThreads> orbs,int x){
    double y = Math.sqrt(size*size + orbs.get(x).O.getS()*orbs.get(x).O.getS());
    size = y;
    orbs.get(x).out.println;
  }
  
  public color getColor(){
    return C;'
  }




  public void setX(int a) {
    xcor = a;
  }

  public void setY(int a) {
    ycor = a;
  }

  public void setS(int a) {
    size = a;
  }

  public int getS() {
    return (int)size;
  }

  public int getX() {
    return (int)xcor;
  }

  public int getY() {
    return (int)ycor;
  }
  
  private class vpoint{
  public int x;
  public int y;

  public vpoint(int a, int b) {
    x = a;
    y = b;
  }

  public void setX(int a) {
    x = a;
  }

  public void setY(int a) {
    y = a;
  }

  public int getX() {
    return x;
  }

  public int getY() {
    return y;
  }
}
  
  
}

