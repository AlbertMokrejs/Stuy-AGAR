import java.util.*;

public class Virus extends Orb {
  

  public Virus(int x, int y, int z, int id) {
    super(x, y, z, id);
    virus = true;
  }
  
  public void kill(ArrayList<Orb> orbs, int x) {
    if(orbs.get(x).size < size){
      orbs.remove(x);
      orbs.remove(orbs.find(this));
    }
  }

  public void turn(ArrayList<Orb> orbs, Orb player, int D) {
    //HAHA NOTHING
    //G0TY
  }
