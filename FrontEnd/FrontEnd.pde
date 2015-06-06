import java.util.*;
int what = 1;
Client a;
public void setup() {
  size(100,100);
  a = new Client();
  cursor();
}


void draw() {
  
  if(what == 0){
    //display a menu and do menu stuff
  }
  else if(what == 1){
    a.runClient(""+mouseX+" "+mouseY);    
  }

}
 
public void displayMenu(){
    
}
