int pacX=50;
int pacY=height/2;
color pink = color(255,134,241,125);
int radius = 30;		//set the radius variable for the pacman characters
Boolean female = true;	//boolean to set the sex of the pacman characters
int direction=0;
PFont font;

background(0);
size(100,100);
smooth();
noStroke();
fill(pink);
  if (direction==0)
  {
    //draw pacman facing right
    arc(pacX, pacY, radius,radius, radians(45), radians(315));
  }
else
  {
    //draw pacman facing left
    arc(pacX, pacY, radius,radius, radians(225), radians(360+135));
   }
//draw eyes
fill(0);
ellipse(pacX,pacY-radius/3,radius/5,radius/5);
if (female == true)
  {
    //draw ribbon for ms pacman
    fill(255, 0, 0, 200);
    triangle(pacX,pacY-radius/2,pacX+radius/3,pacY-(radius/3)*2,pacX+radius/3,pacY-radius/3);
    triangle(pacX-radius/3,pacY-radius/3*2,pacX,pacY-radius/2,pacX-radius/3,pacY-radius/3);
  }

fill(0, 102, 153);

//move pacman around the screen
  if (keyPressed && (key == CODED)) { 	// If it's a coded key
    if (keyCode == LEFT) {            	// If it's the left arrow
      pacX-=5;
      direction =0;
    } 
    else if (keyCode == RIGHT) {      	// If it's the right arrow
      pacX+=5;
  	direction=1;
    }
    if (keyCode == UP) {            	// If it's the left arrow
      pacY-=5;
    } 
    else if (keyCode == DOWN) {      	// If it's the right arrow
      pacY+=5;
    }
  }// end if keypressed

