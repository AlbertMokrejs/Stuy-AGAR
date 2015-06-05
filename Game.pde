import java.util.*;

int menu;

ArrayList<Orb> orblist;
boolean alive;
int score;
playerOrb player;

public void setup() {
  size(800,800);
  alive = true;
  player = new playerOrb();
  score = 0;
  orblist = new ArrayList<Orb>();
  orblist.add(player);
  for(int x = 0; x < 150; x++){
    orblist.add(new Orb((int)(Math.random()*3000 - 1500), (int)(Math.random()*3000 - 1500), (int)(Math.random()*3)));
  }
  
  for(int y = 1; y < orblist.size(); y++){
     if(orblist.get(y).dist(player) < 10 && orblist.get(y) != player){
       orblist.remove(y);
       y--;
     }
  }
  stroke(255);     // Set line drawing color to white
  frameRate(30);
  cursor();
  menu = 1;
}

public void draw(){
  if (menu ==1){
     displayStart();  
  }
  else if(menu ==2){
  background(0);
  color c = color(153);
  fill(c);
  addOrbs();
   //spawns a few random orbs
    for(int x = 0; x < orblist.size(); x++){
      orblist.get(x).turn(orblist, player);
    }
    for(Orb a: orblist){
      fill(c);
    ellipse((float)a.getX(), (float)a.getY(), (float)a.getS()*2, (float)a.getS()*2);
    }  
}
  //runs through orb array, processing each orb
  //checks if player survived
  //incremements score if player alive and size has increased
}
  
  
  public void displayStart(){
    fill(0,255,34);
    rect(50,50,700,700,40);
    fill(112,2,56);
    textSize(38); 
    String f = "Welcome to Agar";
    text(f,225,250);
    rect(50,300,,20);     
 
  }
  


public void addOrbs(){
   if(Math.random() > 0.2){
     orblist.add(new Orb((int)(Math.random()*3000 - 1500), (int)(Math.random()*3000 - 1500), (int)(Math.random()*3)));
   }     
}
