import java.util.*;

public class Virus extends Orb {


  public Virus(int x, int y, int z, int id) {
    super(x, y, z, id);
    virus = true;
    C = color(255, 255, 255);
  }

  public void kill(ArrayList<Orb> orbs, int x) {
    if (orbs.get(x).size > size) {
       orbs.remove(orbs.get(x));
       orbs.remove(this);
    }
  }

  public void turn(ArrayList<Orb> orbs, Orb player, int D) {
    for (int x = 0; x < orbs.size (); x++) {
      if (orbs.get(x) != this && this.dist(orbs.get(x)) < size) {
        kill(orbs, x);
      }
    }
  }
}
