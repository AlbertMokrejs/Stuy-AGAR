public class Mass extends Orb {
  vpoint vector;
  public Mass(Orb parent) {
    super(parent.xcor, parent.ycor, parent.size*.2, parent.ID);
    parent.size=parent.size*.8;
    double xdelt = (mouseX-width/2)*Math.abs((mouseX-width/2));
    double ydelt = (mouseY-height/2)*Math.abs((mouseY-height/2));
    if (xdelt < 36 && xdelt > -36) {
      xdelt = 0;
    }
    if (ydelt < 36 && ydelt > -36) {
      ydelt = 0;
    }
   vector = new vpoint(xdelt,ydelt);
  }
}

