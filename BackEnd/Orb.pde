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




  public void turn(ArrayList<ClientHandlingThread> orbs, Orb player, int D) {

    
    
    

  public void turn(ArrayList<ClientHandlingThread> orbs, Orb player, int D, int x, int y) {





    vect = new vpoint();
    for (int x = D; x < D+20 && x < orbs.size(); x++) {
      if(orbs.get(x).O != player && orbs.get(x).O != this && this.dist(orbs.get(x).O) != 0 && this.dist(orbs.get(x).O) < size && orbs.get(x).O.compareTo(this) < 1){
        kill(orbs, x);
        x--;
     }
      else{
      vect.add(process(orbs.get(x).O));
      }
    }
    for (int x = D; x > D-20 && x >= 0; x--) {
      if(orbs.get(x).O != player && orbs.get(x).O != this && this.dist(orbs.get(x).O) != 0 && this.dist(orbs.get(x).O) < size && orbs.get(x).O.compareTo(this) < 1){
        kill(orbs, x);
        x++;
      }
      
    }
    double xdelt = 0;
    double ydelt = 0;
    for(vpoint a: vect){
      xdelt += a.getX();
      ydelt += a.getY();
    }
    double xmove = 0;
    double ymove = 0;
    if(xdelt == 0){
      xdelt = 1;
    }
    if(ydelt == 0){
      ydelt = 1;}
    if(xdelt < 0){
      xmove = -1 * (getSpeed() * Math.sqrt(xdelt*xdelt / (xdelt*xdelt + ydelt*ydelt)));
    }
    else{
      xmove = (getSpeed() * Math.sqrt(xdelt*xdelt / (xdelt*xdelt + ydelt*ydelt)));
    }
    if(ydelt < 0){
      ymove = -1 * Math.abs(getSpeed() - xmove);
    }
    else{
      ymove = Math.abs(getSpeed() - xmove);
    }
    ychange = ymove;
    xchange = xmove;
    xcor += xmove;
    ycor += ymove;
    if (xcor > 3000) {
      xcor -= 6000;
    }
    if (xcor < -3000) {
      xcor += 6000;
    }
    if (ycor > 3000) {
      ycor -= 6000;
    }
    if (ycor < -3000) {
      ycor += 6000;
    }
  }
  



  public vpoint process(Orb a) {
    double score = size - a.getS(); //negative score negates direction
    double x = a.getX() - xcor; //saves direction of X and Y
    double y = a.getY() - ycor;
    score = (int)(Math.log(score)*score / 5*Math.log(Math.sqrt(x*x + y*y))); //alters intensity, somewhat arbitrary
    return new vpoint((int)(score*x), (int)(score*y));
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

