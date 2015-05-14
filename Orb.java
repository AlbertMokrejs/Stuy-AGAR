import java.util.*;

public class Orb{
  int size; //radius
  int xcor;
  int ycor;
  //speed not tracked but calculated when needed
  
  public int getSpeed(){
    int y = 20 - 2log(getS());
    if(y < 2){
      y = 2;
    }
    return y;
  }
  
  public void turn(Arraylist<Orb> orbs){
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
  
  public void getS(){
    return size;
  }
  
  public void getX(){
    return xcor;
  }
  
  public void getY(){
    return ycor;
  }
  

}
