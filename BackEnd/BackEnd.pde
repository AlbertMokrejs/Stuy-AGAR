

Server S;
void setup(){
  size(1200, 800);
  S = new Server();
}
void draw(){
S.runServer();
}

import java.util.*;



/*
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
  }

*/
