import java.util.*;

public class playerOrb extends Orb{
  
  public playerOrb(){
    super(width/2,height/2,10);
  }
  
  public void kill(ArrayList<Orb> orbs,int x){
    double y = Math.sqrt(size*size + orbs.get(x).getS()*orbs.get(x).getS());
    size = y;
    orbs.remove(x);
  }
//inherits a lot of methods and variables


public void turn(ArrayList<Orb> orbs,Orb player) {
    for (int x = 0; x < orbs.size (); x++) {
      if(orbs.get(x) != player && dist(orbs.get(x)) < size && dist(orbs.get(x)) != 0){
        kill(orbs, x);
        x--;
     }
    }
    double xmove;
    double ymove;
    double xdelt = (mouseX-xcor)*Math.abs((mouseX-xcor));
    double ydelt = (mouseY-ycor)*Math.abs((mouseY-ycor));
    if(xdelt < 36 && xdelt > -36){
      xdelt = 0;
    }
    if(ydelt < 36 && ydelt > -36){
      ydelt = 0;
    }
    print(ydelt + "\n");
    print(xdelt + "\n\n");
    if(xdelt == 0 && ydelt == 0){
       if(Math.random() > 0.5){
        xdelt = 1;
       }
      else{
       ydelt = 1;
      } 
    }
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
    //print(xmove + "\n");
    //print(ymove + "\n\n");
    ychange = ymove;
    xchange = xmove;
    xcor += xmove;
    ycor += ymove;
    translate(-1*((float)player.xcor-width/2),-1* ((float)player.ycor-height/2));
  }
  
}
