import java.util.*;

public class Orb implements Comparable<Orb> {
  double size; //size is the area of the orb, not the radius
  public int xcor;
  public int ycor;
  public int xchange;
  public int ychange;
  //speed not tracked but calculated when needed

  public Orb(int x,int y,int z){
    xcor = x;
    ycor = y;
    size = z;
    xchange = 0;
    ychange = 0;
  }

  public int getSpeed() {
    int y = 10 - getS();
    if (y < 2) {
      y = 2;
    }
    if (size == 1) {
      y = 1;
    }
    return y;
  }

  public int compareTo(Orb other) {
    return this.getS()-other.getS();
  }

  public int dist(Orb a) {
    int x = a.getX() - xcor; //saves direction of X and Y
    int y = a.getY() - ycor;
    return (int)Math.sqrt(x*x + y*y);
  }
  
  public void kill(ArrayList<Orb> orbs,int x){
    int y = (int)Math.sqrt(size*size + orbs.get(x).getS()*orbs.get(x).getS());
    size = y;
    orbs.remove(x);
  }

  public void turn(ArrayList<Orb> orbs, Orb player) {
    ArrayList<vpoint> vect = new ArrayList<vpoint>();
    for (int x = 0; x < orbs.size(); x++) {
      if(orbs.get(x) != player && this.dist(orbs.get(x)) != 0 && this.dist(orbs.get(x)) < 2.5*size && orbs.get(x).compareTo(this) < 1){
        kill(orbs, x);
        x--;
     }
      else{
      vect.add(process(orbs.get(x)));
      }
    }
    int xdelt = 0;
    int ydelt = 0;
    for(vpoint a: vect){
      xdelt += a.getX();
      ydelt += a.getY();
    }
    int xmove = 0;
    int ymove = 0;
    if(xdelt == 0){
      xdelt = 1;
    }
    if(ydelt == 0){
      ydelt = 1;}
    if(xdelt < 0){
      xmove = -1 * (int)(.3 * getSpeed() * Math.sqrt(xdelt*xdelt / (xdelt*xdelt + ydelt*ydelt + 1)));
    }
    else{
      xmove = (int)(.3 * getSpeed() * Math.sqrt(xdelt*xdelt / (xdelt*xdelt + ydelt*ydelt + 1)));
    }
    if(ydelt < 0){
      ymove = -1 * (int)(0.3 * getSpeed() * Math.sqrt(ydelt*ydelt / (xdelt*xdelt + ydelt*ydelt + 1)));
    }
    else{
      ymove = (int)(0.3 * getSpeed() * Math.sqrt(ydelt*ydelt / (xdelt*xdelt + ydelt*ydelt + 1)));
    }
    ychange = ymove;
    xchange = xmove;
    xcor += xmove;
    ycor += ymove;
  }
  



  public vpoint process(Orb a) {
    int score = getS() - a.getS(); //negative score negates direction
    int x = a.getX() - getX(); //saves direction of X and Y
    int y = a.getY() - getY();
    score = (int)(Math.log(score)*score / 5*Math.log(Math.sqrt(x*x + y*y))); //alters intensity, somewhat arbitrary
    return new vpoint(score*x, score*y);
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
    return xcor;
  }

  public int getY() {
    return ycor;
  }
}
