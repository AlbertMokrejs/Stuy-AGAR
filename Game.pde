import java.util.*;

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
  orblist.add(new Orb(400,400,19));
  orblist.add(player);
  stroke(255);     // Set line drawing color to white
  frameRate(60);
  
}

public void draw(){
  background(0);
  color c = color(153);
  fill(c);
   //for(int x = 0; x < 2;){
     orblist.add(new Orb((int)(Math.random()*2*height - height), (int)(Math.random()*2*width - width), (int)(Math.random() * 3)));
   //}   
  //spawns a few random orbs
    for(int x = 0; x < orblist.size(); x++){
      Orb a = orblist.get(x);
      a.turn(orblist, player);
    }
    for(Orb a: orblist){
      fill(c);
    ellipse((float)a.getX(), (float)a.getY(), (float)a.getS()*5, (float)a.getS()*5);
  }
  //runs through orb array, processing each orb
  //checks if player survived
  //incremements score if player alive and size has increased
}

