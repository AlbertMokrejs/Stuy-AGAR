import java.util.*;

public class playerOrb extends Orb{
  
  public playerOrb(){
    super(100,100,10);
  }
  
    public void kill(ArrayList<Orb> orbs,int x){
    int y = (int)Math.sqrt(size*size + orbs.get(x).getS()*orbs.get(x).getS());
    if(size + 1 >= y){
      size += 1;}
     else{
       size = y;
     }
    orbs.remove(x);
  }
//inherits a lot of methods and variables


public void turn(ArrayList<Orb> orbs,Orb player) {
    for (int x = 0; x < orbs.size (); x++) {
      if(dist(orbs.get(x)) < 2.5*size && dist(orbs.get(x)) != 0){
        kill(orbs, x);
        x--;
     }
    }
    int xmove;
    int ymove;
    int xdelt = mouseX;
    int ydelt = mouseY;
    if(xdelt == 0){
      xdelt = 1;
    }
    if(ydelt == 0){
      ydelt = 1;}
    if(xdelt < 0){
      xmove = -1 * (int)(0.1 * getSpeed() * Math.sqrt(xdelt*xdelt / (xdelt*xdelt + ydelt*ydelt + 1)));
    }
    else{
      xmove = (int)(0.1 * getSpeed() * Math.sqrt(xdelt*xdelt / (xdelt*xdelt + ydelt*ydelt + 1)));
    }
    if(ydelt < 0){
      ymove = -1 * (int)(0.1 * getSpeed() * Math.sqrt(ydelt*ydelt / (xdelt*xdelt + ydelt*ydelt + 1)));
    }
    else{
      ymove = (int)(0.1 * getSpeed() * Math.sqrt(ydelt*ydelt / (xdelt*xdelt + ydelt*ydelt + 1)));
    }
    ychange = ymove;
    xchange = xmove;
    xcor += xmove;
    ycor += ymove;
  }
}
