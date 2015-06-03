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
  orblist.add(player);
  for(int x = 0; x < 400; x++){
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
}

public color randomColor(){
   color c = color((int)(Math.random()*155+100),(int)(Math.random()*155+100) ,(int)(Math.random()*155+100) );
   return c;
}

public void draw(){
  background(0);
  
  color c = color(153);
  fill(c);
   if(Math.random() > 0.2){
     orblist.add(new Orb((int)(Math.random()*3000 - 1500), (int)(Math.random()*3000 - 1500), (int)(Math.random()*3)));
   }   
  //spawns a few random orbs
  Collections.sort(orblist);
    for(int x = 0; x < orblist.size(); x++){
      Orb a = orblist.get(x);
      a.turn(orblist, player, x);
    }
    for(Orb a: orblist){
      fill(a.getColor());
    ellipse((float)a.getX(), (float)a.getY(), (float)a.getS()*2, (float)a.getS()*2);
  }
  //runs through orb array, processing each orb
  //checks if player survived
  //incremements score if player alive and size has increased
}

