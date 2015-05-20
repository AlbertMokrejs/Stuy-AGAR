# Stuy-AGAR
StuyCS Agar Remake (Single Player)


Class Game{
       -initializes game world, arraylist of orbs and a player orb.
       -Has a Turn() method which runs turns per each orbs: processing prints at this time.
       -Checks if player is alive: ends game if dead.
       -Displays score.
}								
        

Class Orb{
      -is an orb: keeps track of its Size, xCord, yCord.
      -if its too close to another orb (which is bigger) it'll delete itself and increase the other orbs size.
      -otherwise it would use vector addition and mildRNG to determine an optimal direction to travel.
      -Travel speed is inversely proportional to size.
      -can have its size increased by other orbs as they die.		        
}
			  
			  
Class PlayerOrb extends Orb{
  -is an orb, keeps track of its Size, xCord, yCord.
  -takes player inputs to move in real time. 
  -Speed based on inverse of size.
  -if it gets too close to another orb it dies. Death ends the game, as monitored by Game.
  -can have its size increased by other orbs as they die.
  -can shoot out mass of itself that would decrese its size (shoot out small orb)
  -can split in half to shoot half of itself out (the other half can absorb more mass)
  -if runs into a virus if too large, it will split apart into tiny pieces
}

Class Virus extends Orb{
  -if any orb is too large and it runs into a virus, it will split into tiny pieces
  -if its too small it can just walk through unharmed.
}
					      
					      
Class VPoint{
      -a vector class cause java vectors are ew
}


