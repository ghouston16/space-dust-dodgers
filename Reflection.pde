/* Reflection

Name : Gary Houston

Student Number: 20091416

Link to Video:                e.g. https://youtu.be/DvnEIN8FIgA


Part A - Mark (3 /5)
-----------------------------

Includsion of completed Readme and Reflection, and Video

3


Part B - Mark (4/5)
-----------------------------

Comments, indentation, naming, structure of code, etc.



Part C - Mark (4 /5)
-----------------------------
Use of if and loop statements:
Main Sketch -
line 44 to update and display Debris object arrays. If statement checking hitship boolean which controls inrementing of livesLost and also respawn of both ship and the object which collided with it.
Player class - 
line 58 , 70, 82 to update scores[], highest score, lowest score and calculate avg score.

for loops used on:
line 30 draw the object arrays LeftDebris & RightDebris
line 44 to update and display Debris object arrays

no while loops used

Part D - Mark (4 /5)
-----------------------------
Working game with inclusion of bespoke methods in the main sketch.

bespoke method:

leftHitSHip() on line 127 to check collisions between ship and debris moving from the left
rightHitSHip() on line 152 to  check collisions between ship and debris moving from the left
resetGame() on line 92 to clear scores and lives and start again. Also prints Game Over! and starting .. to console.
touramentOver() 108 to intialize JoptionPane which displays tournament info from player class.
...


Part E1 - Mark (x /10)
-----------------------------
User-defined class with appropriate fields, constructors, getters, setters
leftDebris tab lines 1 - 85 - - appropriate fields constructor setters and getters have been used including validation statements
rightDebris tab lines 1 - 85 - - appropriate fields constructor setters and getters have been used including validation statements
Player tab - 1- 94 - appropriate fields constructor setters and getters have been used including validation statements


Part E2 - Mark (10 /15)
-----------------------------

Class bespoke methods:

Player class:

lowestScore() on line 52 to store lowest score in Scores[]
highesttScore()  line 64 on line y to store highest score in Scores[]
averageScore() line 73 on line to calcutate the average score using the data store

Debris Classes:
LeftDebris & RightDebris classes employ same methods renamed right or left depending:
resetLeftDebris lin 62 to reintialize the Debris if it leaves the screen
respawnLeft line 69 to re-draw the object which collided with the shop in the 'spawning zone' off screen
update() line 74 to update the position of debris and check position and call resetDebris if debris leaves screen

Same lines and method found in both classes

Ship Class:

respawn() line 94 used to update ships y coordinate when a point is scored. Also when ship collides with object.
update() line 99 check and update ship objects position along y axis
display() line 111 draw ship on display
up() line 115 method used to change ships position along y axis in neagtive direction..controls ship speed also //<>//
down() up() line 118 method used to change ships position along y axis in positive direction
scoreAPoint() line 122 this is a boolean method to check if ship has left the top of the display. This is used to increment scores and to determine respawn()

ScoreDisp:
display() method is used to draw the String along with current score to the left hand corner of the screen.

LivesDisp:
display() method is used to draw the String along with current score to the left hand corner of the screen.
Also performs a calcutaion on livesLost vs maxLivesPerGame to calculate current score



Part E3 - Mark (6/10)
-----------------------------

The user-defined class(es) are used in an appropriate manner

Part F1 - Mark (15 /20)
-----------------------------
- Use of a data structure to store information i.e. array
Scores[] array used to store scores. initatized line 43..

Object arrays LeftDebris and RightDebris used to stored data about debris objects.
...

Part F2 - Mark (15 /20)
-----------------------------
Main Sketch
booleann on line 127 and 152 are both used to perform calcuations on thedata stored for the object arrays LeftDebris and RightDebris
in order to check for collisions.

Player Class:
method averageScored performs calcualtetion on data stored in Scores[] array to provide avgerage score from all games played.


*/
