# Stuy-AGAR
StuyCS Agar Remake (Single Player)

TEAM: Networking Sux 

=====

DEV LOG:

-26-05-2015: Made AI work and orbs properly absorb eachother; PlayerOrb still broken

-27-05-2015: Fixed Player Motion + General motion algorithms

-27-05-2015: Upgrades INTs to DOUBLEs for sake of precision

-28-05-2015: Added Score Keeping + Motion Centering

-28-05-2015: Added Random but constant colors 

-29-05-2015: Added IDs for Orbs and PlayerOrbs, and Ledger creation ((ON NETWORKING PREALPHA))

-03-06-2015: Convered O(N^2) motion algorithm to O(N) algorithm

-04-06-2015: Added infinite looping for world edges

-06-06-2015: Failed attempt at networking (agian)

-07-06-2015: STABLE VERSION 2, featuring menus, score keeping, pause feature.

-08-06-2015: Added option to restart game without restarting sketch, Added looping background music.

-10-06-2015: Fixed bug with music player not restarting properly, fixed collision detection bug. 

-11-06-2015: Made pathfinding algorithm more aggressive.

-12-06-2015: Working viruses. Change to AI to prevent excessive clustering.

=====

TO DO:

-Networking

-Viruses

=====

DETAILED DOCUMENTATION & METHODS:

GENERAL PROCESS:
  The general process per turn occurs in a number of steps. At the beginning, a few random orbs are spawned to keep the world stocked. These are spawned at a random size which can excede the player's but not by much. Then the system sorts the list of orbs based on their angular position (the "center" is at located off the map) and then has each orb check 35 orbs before and after it in the list as well as 70 random orbs. This produces a list of vectors telling it where each orb "pulls" or "pushes it" which when summed give it a general direction of motion. This occurs for all cases except for playerOrbs which are moved based on mouse position. All orbs also check for collisions when examining the other orbs, but the 35/70 constants make this a O(N) algorithm per system and O(1) per orb.
  
ORBS:
  Orbs and their child classes (PlayerOrbs) keep track of their position and size. They have methods for deleting other orbs and for making vectors from other orbs. When made to examine an orb, they check if they should delete it. If not, they make a vector of it. This vector is essentially a vector orriented toward the direction of the other orb's location, but with varing magnitude. The magignitude is based on the size of the other orb, and the difference in their sizes. This means that large orbs make both high-value targets and high-threat predators and tend to jump to the top priority lists assuming they are near by. While distance is also factored in, it has less weight than size. This makes for a rather Agressive AI. 
  
LOOPING:
  Because of how Orbs keep track of their position, it is simple to have them teleport a fixed distance once they leave bounds. Orbs within a certain distance of the edge are rendered twice: once in their true location and once at the opposite end. This makes looping seamless, though one can tell because the orbs will either do their best to move toward the middle (big orbs / predators) or away from it (small orbs). This is usually only aparent if too many orbs have been allowed to spawn.
  
RENDERING:
  When passing through orbs, only orbs in the viewfield are drawn. This is done after centering and after the movement of all orbs, for efficiency. The same happens for viruses.
  
MUSIC:
  The music player's function is mostly self-explanatory, but for some reason it cannot be overwritten. It must be deleted during a reset, otherwise the music file continues playing. This is likely because it is passed onto a different thread in the program, seperate from actual objects.
  
EFFICIENCY:
  All algorithms in the program are approximately O(N), with the expeption of Collection.Sort(). Given the well optimized nature of that sort, this is likely not a bottle-neck. 
  
VIRUSES:
  Viruses function as a normal class of orb and use the Kill() method to destroy both themselves and the orbs they break. They only break orbs larger than themselves. Their turn() method does nothing, thus preventing their motion.
  
=====

REQUIREMENTS:

.MP3 drivers may be needed if not already present. Processing will not start the sketch otherwise.

=====

ACKNOWLEDGEMENTS: 

-MSPaintAdventures for their ownership of Courtroom Shuffle

-Processing and Stack Overflow for advice for running sound

=====

USE INSTRUCTIONS:

While currently not structured as a sketch, on deadline day the file will be and thus will open normally. It is fine to replace the file.mp3 file with any other file of the same name to change the music.

Mouse controls control your motion and Shift+R is used to restart the game. The game may require larger memory depending on how long you play. ((I have had no memory issues within 10 minutes of play, but it is possible longer / more extreme sessions may use up more memory.))
