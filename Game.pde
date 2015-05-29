import java.util.*;

ArrayList<Orb> orblist;
boolean alive;
int score;
playerOrb player;
int currentID;
int currentPID;

public void setup() {
  size(800,800);
  currentID = 0;
  currentPID = 0;
  alive = true;
  player = new playerOrb(currentPID);
  currentPID++;
  score = 0;
  orblist = new ArrayList<Orb>();
  orblist.add(player);
  for(int x = 0; x < 150; x++){
    orblist.add(new Orb((int)(Math.random()*3000 - 1500), (int)(Math.random()*3000 - 1500), (int)(Math.random()*3), currentID));
    currentID++;
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
}

public void reID(){
  for(int x = 0; x+1<orblist.size(); x++){
    if(orblist.get(x).ID+1 != orblist.get(x+1).ID && orblist.get(x).ID < 100000 && orblist.get(x).ID < 100000){
      orblist.get(x+1).ID = orblist.get(x).ID+1;
    }
  }
}

public color randomColor(){
   color c = color((int)(Math.random()*155+100),(int)(Math.random()*155+100) ,(int)(Math.random()*155+100) );
   return c;
}

public String makeLedger(){
  reID();
  String str = "";
  for(Orb a: orblist){
    str += a.orbString();
  }
  return str;
}

public void draw(){
  background(0);
  
  color c = color(153);
  fill(c);
   if(Math.random() > 0.2){
     orblist.add(new Orb((int)(Math.random()*3000 - 1500), (int)(Math.random()*3000 - 1500), (int)(Math.random()*3), currentID));
     currentID++;
   }   
  //spawns a few random orbs
    for(int x = 0; x < orblist.size(); x++){
      Orb a = orblist.get(x);
      a.turn(orblist, player);
    }
    for(Orb a: orblist){
      if(a.xcor > 0 && a.xcor < width && a.ycor > 0 && a.ycor < height){
      fill(a.getColor());
    ellipse((float)a.getX(), (float)a.getY(), (float)a.getS()*2, (float)a.getS()*2);
      fill(255);
      if(a.ID < 100000){
    text("" + a.ID, a.getX() + a.getS()/2, a.getY() + a.getS()/2);
      }
      }
  }
  reID();
  //runs through orb array, processing each orb
  //checks if player survived
  //incremements score if player alive and size has increased
}

