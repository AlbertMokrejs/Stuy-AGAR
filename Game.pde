import java.util.*;

ArrayList<Orb> orblist;
boolean alive;
int score;
playerOrb player;
int currentID;
int currentPID;

public void setup() {
  size(1200, 800);
  currentID = 0;
  currentPID = 0;

  alive = true;
  player = new playerOrb(currentPID);
  currentPID++;
  score = 0;
  orblist = new ArrayList<Orb>();
  orblist.add(player);
  for (int x = 0; x < 650; x++) {
    orblist.add(new Orb((int)(Math.random()*6000 - 3000), (int)(Math.random()*6000 - 3000), (int)(Math.random()*3), currentID));
    currentID++;
  }
  for (int y = 1; y < orblist.size (); y++) {
    if (orblist.get(y).dist(player) < 10 && orblist.get(y) != player) {
      orblist.remove(y);
      y--;
    }
  }
  stroke(255);     // Set line drawing color to white
  frameRate(30);
  cursor();
}

public void reID() {
  for (int x = 0; x+1<orblist.size (); x++) {
    if (orblist.get(x).ID+1 != orblist.get(x+1).ID && orblist.get(x).ID < 100000 && orblist.get(x).ID < 100000) {
      orblist.get(x+1).ID = orblist.get(x).ID+1;
    }
  }
}

public color randomColor() {
  color c = color((int)(Math.random()*155+100), (int)(Math.random()*155+100), (int)(Math.random()*155+100) );
  return c;
}

public String makeLedger() {
  reID();
  String str = "";
  for (Orb a : orblist) {
    str += a.orbString();
  }
  return str;
}

public void deLedger(String y){
  orblist = new ArrayList<Orb>();
  ArrayList<String> L = new ArrayList<String>(Arrays.asList(y.split(" ")));
  ArrayList<Double> X = new ArrayList<Double>();
  for(int x = 0; x < L.size(); x++){
    X.add(Double.valueOf(L.get(x)));
  }
  for(int x = 0; x+3 < X.size(); x++){
    if(x % 4 == 0){
      if(X.get(x).intValue() < 100000){
        orblist.add(new playerOrb(X.get(x+1).intValue(),X.get(x+2).intValue(),X.get(x+3).intValue(),X.get(x).intValue()));
      }
      else{
        orblist.add(new Orb(X.get(x+1).intValue(),X.get(x+2).intValue(),X.get(x+3).intValue(),X.get(x).intValue()));
      }
    }
}
}

public void draw() {
  background(0);

  color c = color(153);
  fill(c);
  if (Math.random() > 0.2) {
    orblist.add(new Orb((int)(Math.random()*6000 - 3000), (int)(Math.random()*6000 - 3000), (int)(Math.random()*3), currentID));
    currentID++;
  }   
  //spawns a few random orbs
  Collections.sort(orblist);
  for (int x = 0; x < orblist.size (); x++) {
    Orb a = orblist.get(x);
    a.turn(orblist, player, x);
  }

  for (Orb a : orblist) {
    if (a.xcor > player.xcor-width/2 && a.xcor < player.xcor + width/2 && a.ycor > player.ycor-height/2 && a.ycor < player.ycor+height/2) {
      fill(a.getColor());
      ellipse((float)a.getX(), (float)a.getY(), (float)a.getS()*2, (float)a.getS()*2);
    }
  }
  reID();
  fill(255);
  text("" + ((double)Math.round(player.size * 100000) / 100000), (int)player.xcor - width/2 + 50, (int)player.ycor - height/2 + 50);
  text("" + orblist.size(), (int)player.xcor - width/2 + 50, (int)player.ycor - height/2 + 100);
  //runs through orb array, processing each orb
  //checks if player survived
  //incremements score if player alive and size has increased
}
