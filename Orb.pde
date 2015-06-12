import java.util.*;

public class Orb implements Comparable<Orb> {
  double size; //size is the area of the orb, not the radius
  public double xcor;
  public double ycor;
  public double xchange;
  public double ychange;
  public color C;
  public int ID;
  public boolean virus;
  //speed not tracked but calculated when needed

  public Orb(int x, int y, int z, int id) {
    virus = false;
    xcor = x;
    ycor = y;
    size = z;
    xchange = 0;
    ychange = 0;
    ID = id;
    C = color((int)(Math.random()*205 + 50), (int)(Math.random()*205 + 50), (int)(Math.random()*205 + 50) );
  }

  public String orbString() {
    return "" + ID + " " + (int)xcor + " " + (int)ycor + " " + (int)size + " ";
  }

  public double getSpeed() {
    double y = 8 - Math.log(getS());
    if (y < 3) {
      y = 3;
    }
    if (size == 1) {
      y = 0;
    }
    return y;
  }

  public int compareTo(Orb other) {
   return Double.compare(Math.atan2(ycor-4500, xcor-4500), Math.atan2(other.ycor-4500, other.xcor-4500));
  }

  public double dist(Orb a) {
    double x = a.getX() - xcor; //saves direction of X and Y
    double y = a.getY() - ycor;
    return Math.sqrt(x*x + y*y);
  }

   public void kill(ArrayList<Orb> orbs, int x) {
    if(orbs.get(x).virus == true){
       x.kill(orbs,orbs.find(this));
    }
    else {
    double y = Math.sqrt(size*size + orbs.get(x).getS()*orbs.get(x).getS());
    size = y;
    orbs.remove(x);
    }
  }

  public color getColor() {
    return C;
  }

  public ArrayList<vpoint> makeVect(ArrayList<Orb> orbs, Orb player, int D) {
    ArrayList<vpoint> vect = new ArrayList<vpoint>();
    for (int x = D; x < D+35; x++) {
      if (orbs.get(x%orbs.size()) != this && this.dist(orbs.get(x%orbs.size())) < size && orbs.get(x%orbs.size()).size - this.size < 0) {
        kill(orbs, x%orbs.size());
        x--;
      } else {
        vect.add(process(orbs.get(x%orbs.size())));
      }
    }
    for (int z = D; z > D-35; z--) {
      int x = (z+orbs.size())%orbs.size();
      if (orbs.get(x) != player && orbs.get(x) != this && this.dist(orbs.get(x)) != 0 && this.dist(orbs.get(x)) < size && orbs.get(x).compareTo(this) < 1) {
        kill(orbs, x);
        z++;
      } else {
        vect.add(process(orbs.get(x)));
      }
    }
    for (int y = 0; y < 70; y++) {
      int x = (int)(Math.random()*orbs.size());
      if (orbs.get(x) != player && orbs.get(x) != this && this.dist(orbs.get(x)) != 0 && this.dist(orbs.get(x)) < size && orbs.get(x).compareTo(this) < 1) {
        kill(orbs, x);
      } else {
        vect.add(process(orbs.get(x)));
      }
    }
    return vect;
  }
    
   public void turn(ArrayList<Orb> orbs, Orb player, int D){
    ArrayList<vpoint> vect = makeVect(orbs, player, D);
    double xdelt = 0;
    double ydelt = 0;
    for (vpoint a : vect) {
      xdelt += a.getX();
      ydelt += a.getY();
    }
    double xmove = 0;
    double ymove = 0;
    if (xdelt == 0) {
      if (Math.random() > 0.5) {
        xdelt = 1;
      } else {
        xdelt = -1;
      }
    }
    if(ydelt == 0){
      if (Math.random() > 0.5) {
        ydelt = 1;
      } else {
        ydelt = -1;
      }
    }
    if (xdelt < 0) {
      xmove = -1 * (getSpeed() * Math.sqrt(xdelt*xdelt / (xdelt*xdelt + ydelt*ydelt)));
    } else {
      xmove = (getSpeed() * Math.sqrt(xdelt*xdelt / (xdelt*xdelt + ydelt*ydelt)));
    }
    if (ydelt < 0) {
      ymove = -1 * Math.abs(getSpeed() - Math.abs(xmove));
    } else {
      ymove = Math.abs(getSpeed() - Math.abs(xmove));
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
    double score = a.size*(size - a.size);
    if (score == 0) {
      score = -1;
    } //negative score negates direction
    double x = a.getX() - xcor; //saves direction of X and Y
    double y = a.getY() - ycor;
    score = (int)(Math.abs(score)*score / 2*Math.log(Math.sqrt(x*x + y*y))); //alters intensity, somewhat arbitrary
    return new vpoint((int)((Math.random()*0.05 + 0.97)*score*x), (int)((Math.random()*0.05 + 0.97)*score*y));
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

  private class vpoint {
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
