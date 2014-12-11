//Draw a row of pacman characters using a function

float x;
float y;
color pink = color(255,134,241,125);
int radius = 50;		//set the radius variable for the pacman characters
Boolean female = true;	//boolean to set the sex of the pacman characters

void setup(){
  	size(600,radius*3);
  	x=0;		//set initial values for the pacman coordinates  
  	y=height/2;	//position pacman correctly for background graphic
	}

//the draw() function executes repeatedly to create the animation
void draw(){
  	smooth();
  	background(255);	//draw background
	//use for loop to draw series of pink pacmans across the screen
	for(x=0; x<width; x+=radius){
  		drawPacman(x, y, pink, false, radius, 1);  
  		}
	}

void drawPacman(float pacX, float pacY, color clr, Boolean ms, int pacRadius, int direction){
	fill(clr);
	noStroke();

	if (direction==0){
    		//draw pacman facing right
    		arc(pacX, pacY, radius,radius, radians(45), radians(315));
  	}else{
    		//draw pacman facing left
    		arc(pacX, pacY, radius,radius, radians(225), radians(360+135));
   	}
	//draw eyes
	fill(0);
	ellipse(pacX,pacY-radius/3,radius/5,radius/5);
	if (female == true){
    		//draw ribbon for ms pacman
    		fill(255, 0, 0, 200);
    		triangle(pacX,pacY-radius/2,pacX+radius/3,pacY-(radius/3)*2,pacX+radius/3,pacY-radius/3);
    		triangle(pacX-radius/3,pacY-(radius/3)*2,pacX,pacY-radius/2,pacX-radius/3,pacY-radius/3);
  	}
	//save a screenshot of the image
  	if (mousePressed) {
    		if (mouseButton == RIGHT) {
       		save("pacman_pattern.png");
    		}
  	}
}


