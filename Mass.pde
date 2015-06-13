public class Mass extends Orb {
  public vpoint vector;
  public Mass(Orb parent) {
    super((int)parent.xcor, (int)parent.ycor, (int)(parent.size*.15), (int)parent.ID);
    parent.size=parent.size*.85;
    this.C=parent.C;
    double xdelt = (mouseX-width/2)*Math.abs((mouseX-width/2));
    double ydelt = (mouseY-height/2)*Math.abs((mouseY-height/2));
    if (xdelt < 36 && xdelt > -36) {
      xdelt = 0;
    }
    if (ydelt < 36 && ydelt > -36) {
      ydelt = 0;
    }
   vector = new vpoint((int)xdelt,(int)ydelt);
  }
  
  
  
 public boolean mass = true;
}

