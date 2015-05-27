import java.util.*;

public class Orb implements Comparable<Orb> {
  double size; //size is the area of the orb, not the radius
  public double xcor;
  public double ycor;
  public double xchange;
  public double ychange;
  //speed not tracked but calculated when needed

  public Orb(int x,int y,int z){
    xcor = x;
    ycor = y;
    size = z;
    xchange = 0;
    ychange = 0;
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
    return this.getS()-other.getS();
  }

  public int dist(Orb a) {
    double x = a.getX() - xcor; //saves direction of X and Y
    double y = a.getY() - ycor;
    return (int)Math.sqrt(x*x + y*y);
  }
  
  public void kill(ArrayList<Orb> orbs,int x){
    double y = Math.sqrt(size*size + orbs.get(x).getS()*orbs.get(x).getS());
    size = y;
    orbs.remove(x);
  }

  public void turn(ArrayList<Orb> orbs, Orb player) {
    ArrayList<vpoint> vect = new ArrayList<vpoint>();
    for (int x = 0; x < orbs.size(); x++) {
      if(orbs.get(x) != player && orbs.get(x) != this && this.dist(orbs.get(x)) != 0 && this.dist(orbs.get(x)) < size && orbs.get(x).compareTo(this) < 1){
        kill(orbs, x);
        x--;
     }
      else{
      vect.add(process(orbs.get(x)));
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
}
