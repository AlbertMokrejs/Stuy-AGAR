import java.util.*;
import ddf.minim.*;

//CODE FOR AUDIO BORROWED FROM STACK OVERFLOW
AudioPlayer MusicBox;
Minim minim;//audio context
ArrayList<Orb> orblist;
boolean alive;
int score;
playerOrb player;
int currentID;
int currentPID;
int menu;

public void setup() {
  size(1200, 800);
  setupHelp();
}

void keyPressed() {
  if (key == 82) {
    MusicBox.close();
  minim.stop();
    setupHelp();
  }
}

void stop()
{
  MusicBox.close();
  minim.stop();
  super.stop();
}

public void setupHelp() {
  minim = new Minim(this);
  MusicBox = minim.loadFile("file.mp3", 2048);
  MusicBox.play();
  currentID = 0;
  currentPID = 0;
  menu = 2;
  alive = true;
  player = new playerOrb(currentPID);
  currentPID++;
  score = 0;
  orblist = new ArrayList<Orb>();
  orblist.add(player);
  for (int x = 0; x < 1000; x++) {
    orblist.add(new Orb((int)(Math.random()*6000 - 3000), (int)(Math.random()*6000 - 3000), (int)(Math.random()*3), currentID));
    currentID++;
  }
  for (int x = 0; x < 100; x++) {
    orblist.add(new Orb((int)(Math.random()*6000 - 3000), (int)(Math.random()*6000 - 3000), (int)(Math.random()*5)+3, currentID));
    currentID++;
  }
  for (int x = 0; x < 100; x++) {
    orblist.add(new Orb((int)(Math.random()*6000 - 3000), (int)(Math.random()*6000 - 3000), (int)(Math.random()*6)+4, currentID));
    currentID++;
  }
  for (int y = 1; y < orblist.size (); y++) {
    if (orblist.get(y).dist(player) < 10 && orblist.get(y) != player) {
      orblist.remove(y);
      y--;
    }
  }
  stroke(0);     // Set line drawing color to white
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

public void draw() {
  background(#3D0067);
  if (MusicBox.isPlaying()==false) {
    MusicBox.rewind(); 
    MusicBox.play();
  }
  if (alive) {
    if (focused) {
      if (menu == 2) {
        displayStart();
      } else if (menu == 1) {
        displayPaused();
      } else {
        textSize(16);
        background(0);
        color c = color(153);
        fill(c);
        if (Math.random() > 0.4) {
          orblist.add(new Orb((int)(Math.random()*6000 - 3000), (int)(Math.random()*6000 - 3000), (int)(Math.random()*3), currentID));
          currentID++;
        }
        if (Math.random() > 0.85) {
          Orb tmp = new Orb((int)(Math.random()*6000 - 3000), (int)(Math.random()*6000 - 3000), (int)(Math.random()*5)+3, currentID);

          if (tmp.dist(player) > 100) {
            currentID++;
            orblist.add(tmp);
          }
        }  
        if (Math.random() > 0.9) {
          Orb tmp = new Orb((int)(Math.random()*6000 - 3000), (int)(Math.random()*6000 - 3000), (int)(Math.random()*9)+2, currentID);
          if (tmp.dist(player) > 100) {
            currentID++;
            orblist.add(tmp);
          }
        }
        if (Math.random() > 0.98) {
          Orb tmp = new Orb((int)(Math.random()*6000 - 3000), (int)(Math.random()*6000 - 3000), (int)(Math.random()*4)+8, currentID);
          if (tmp.dist(player) > 100) {
            currentID++;
            orblist.add(tmp);
          }
        }
        if (Math.random() > 0.995) {
          Orb tmp= new Orb((int)(Math.random()*6000 - 3000), (int)(Math.random()*6000 - 3000), (int)player.size+3, currentID);
          if (tmp.dist(player) > 100) {
            currentID++;
            orblist.add(tmp);
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
          if (player.xcor > 3000 - width/2 && a.xcor < width/2 && a.ycor > player.ycor-height/2 && a.ycor < player.ycor+height/2) {
            fill(a.getColor());
            ellipse((float)a.getX()+6000, (float)a.getY(), (float)a.getS()*2, (float)a.getS()*2);
          } 
          if (player.ycor > 3000 - height/2 && a.ycor < height/2 && a.xcor > player.xcor-width/2 && a.xcor < player.xcor+width/2) {
            fill(a.getColor());
            ellipse((float)a.getX(), (float)a.getY()+6000, (float)a.getS()*2, (float)a.getS()*2);
          }
          if (player.xcor < -3000 + width/2 && a.xcor > width/2 && a.ycor > player.ycor-height/2 && a.ycor < player.ycor+height/2) {
            fill(a.getColor());
            ellipse((float)a.getX()-6000, (float)a.getY(), (float)a.getS()*2, (float)a.getS()*2);
          } 
          if (player.ycor < -3000 + height/2 && a.ycor > height/2 && a.xcor > player.xcor-width/2 && a.xcor < player.xcor+width/2) {
            fill(a.getColor());
            ellipse((float)a.getX(), (float)a.getY()-6000, (float)a.getS()*2, (float)a.getS()*2);
          }
        }
        reID();
        fill(255);
        text("Your Score: " + ((double)Math.round(player.size * 100000) / 100000), (int)player.xcor - width/2 + 50, (int)player.ycor - height/2 + 50);
        score = (int)((double)Math.round(player.size * 100000) / 100000);
        text("Orbs Other Than You: " + (orblist.size() - 1), (int)player.xcor - width/2 + 50, (int)player.ycor - height/2 + 100);
        alive = orblist.contains(player);
        //runs through orb array, processing each orb
        //checks if player survived
        //incremements score if player alive and size has increased
      }
    } else {
      displayPaused();
    }
  } else {
    displayDead();
  }
}
