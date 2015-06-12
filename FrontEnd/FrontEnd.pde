
 import java.util.*;
import ddf.minim.*;
int score;
int menu = 1;
Client a;
public void setup() {
  size(1200,800);
  displayStart();
  a = new Client();
  cursor();
}
AudioPlayer MusicBox;
Minim minim;//audio context

void draw() {
    a.runClient(""+mouseX+" "+mouseY);      
}


 

public void displayStart() {
  fill(#A2FFCD);
  rect(50, 50, width-100, height-100, 40);
  fill(112, 2, 56);
  textSize(38); 
  String f = "Welcome to Stuy-Agar: V0.9i";
  text(f, 225, 250);
  String x = "\nCreated By Nathan Mannes and Albert Mokrejs \n";
  textSize(20);
  text(x, 225, 400);
  //rect(50, 300, 20);
}

public void displayPaused() {
  fill(#A2FFCD);
  rect(50, 50, width-100, height-100, 40);
  fill(112, 2, 56);
  textSize(38); 
  String f = "Paused, Current Score: " + score;
  text(f, 225, 250);
  String x = "\nClick To Unpause!!!!";
  textSize(20);
  text(x, 225, 400);
  //rect(50, 300, 20);
}

public void displayDead() {
  fill(#000000);
  rect(50, 50, width-100, height-100, 40);
  fill(112, 2, 56);
  textSize(38); 
  String f = "You were eaten by a predator, RIP. \nThis was your score: " + score;
  text(f, 225, 250);
  String x = "\nCare to try again, fighting against the futile nature of this world? \n\nR to Restart\nShift needed to prevent accidental resets";
  textSize(15);
  text(x, 225, 400);
  //rect(50, 300, 20);
}

public void mouseClicked() {
  if (menu == 2) {
    menu = 1;
  }
  menu = Math.abs(menu - 1);
}


  public String interpret(String s){
    return "";    
  }

