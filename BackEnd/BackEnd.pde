
Server S;
void setup(){
   size(1200,800);
   
  S = new Server();
  displayServer();
}
void draw(){
S.runServer();
displayServer();
}
public void displayServer() {
  fill(#A2FFCD);
  rect(50, 50, width-100, height-100, 40);
  fill(112, 2, 56);
  textSize(38); 
  String f = "Welcome to the Stuy-Agar Server";
  text(f, 225, 250);
  String x = "\nThis serves no real purpose \n";
  textSize(20);
  text(x, 225, 400);
  //rect(50, 300, 20);
}
