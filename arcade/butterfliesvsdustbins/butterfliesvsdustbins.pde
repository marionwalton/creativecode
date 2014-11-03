
PFont font;
Boolean started = false;
 int cellSize=2;
int ghostsCleaned =0;
PImage bg;
Boolean gotTarget=false;
int startTargetX=50;
int startTargetY=100;
int speed  =3;
int difficulty = 5;//set between 2 (hard) and 5 (easy)
int totalGhosts;
int numGhosts=200;
int totalTargets;
int numTargets=50;
 int[][] ghosts= new int[numGhosts][2]; 
 int [][] targets = new int[numTargets][2];
Boolean visible = true;
Boolean Xcollision = false;
Boolean Ycollision = false;
Boolean collision= false;
Boolean contact = false;
//winning position
int winX = 693;
int winY=230;
//marker for collisions with enemies
float splatX;
float splatY; 
//starting point for hero

int startY=225;
int startX=16;
float x;//
float y;//
Boolean [] collected = new Boolean[numTargets];//most recent target to be collected
Boolean [] deleted = new Boolean[numGhosts];//most recent ghost to be deleted
int [] ghostX = new int[numGhosts];
int [] ghostY= new int[numGhosts];
int [] targetX = new int[numTargets];
int [] targetY= new int[numTargets];
int collectedTargets=0;
 int gridcolrows=11;//the number of columns and rows when drawing character
 //for drawing main character
   String[][]coloursd = new String[gridcolrows][gridcolrows];
   String[][]coloursu = new String[gridcolrows][gridcolrows];
   String[][]coloursr = new String[gridcolrows][gridcolrows];
   String[][]coloursl = new String[gridcolrows][gridcolrows];
int ghostSize=cellSize*gridcolrows;
Boolean splat = false; // a pacman has been eaten by a ghost!
int pacloc;
int [] ghostloc= new int [numGhosts];//ghost's position in the pixel array
int [] targetloc= new int [numTargets];//targets position in the pixel array
int centreX;
int babyX;
int centreY;
int babyY;
int targetYtop;
int targetYbottom;
int targetXleft;
int targetXright;
int pacSize = cellSize*gridcolrows; 
String label = "Pacman";
color white =color(255);
color yellow =color(255,255,0);
color blue =color(0,0,255);
color red =color( 255,0,0,200);
color green= color(155,252,140);
color purple= color(229,41,255,100);
color skyblue=color(41,250,255);
String direction = "l2r";


void setup() {
//frameRate(12);
//NB draw window the same size as your image
size(928,512);
font=loadFont("TheSans-Plain-12.vlw");
//font = loadFont("NewsGothicBT-Bold-48.vlw");
textFont(font);

for(int i =0;i<numGhosts;i++){
  deleted[i]=false;
}
for(int i =0;i<numTargets;i++){
  collected[i]=false;
}
centreX = 0+pacSize;//this is the x position of the/ pacman
centreY = height/2-pacSize/2;//this is the y position of the pacman
bg = loadImage("maze2.jpg");
visible=false;
splat=false;
background(bg);
loadPixels();
  // We must also call loadPixels() on the PImage since we are going to read its pixels.
 bg.loadPixels();
  //loop through all the pixels in bg image
  for (int y = 0; y < height; y=y+pacSize ) {
    for (int x = 0; x < width; x=x+pacSize ) {
      int loc = x + y*width;
      // The functions red(), green(), and blue() pull out the three color components from a pixel.
      float r = red(bg.pixels [loc]); 
      float g = green(bg.pixels[loc]);
      float b = blue(bg.pixels[loc]);
      // Set the display pixel to the image pixel
      pixels[loc] = color(r,g,b);
    }
}
updatePixels();
totalGhosts=0;
//populate array of ghosts with x and y coordinates
for(int i=0;i<width;i+=ghostSize*difficulty){
  for(int j=0; j<height;j+=ghostSize*difficulty){
     if(pixels[j*width+i]!=color(255,255,255)){
         if(totalGhosts<numGhosts){
            ghosts[totalGhosts][0]=i;
            ghosts[totalGhosts][1]=j;
            totalGhosts++;
          }
    }
  }
}
//populate array of targets with x and y coordinates
totalTargets=0;
for(int i=0;i<width;i+=ghostSize*difficulty*2){
  for(int j=0; j<height;j+=ghostSize*difficulty*2){
    //check that the target will not appear on a white pixel (maze walls)
    if(pixels[j*width+i]!=color(255,255,255)){    
      if(totalTargets<numTargets){
        targets[totalTargets][0]=i;
        targets[totalTargets][1]=j;
        totalTargets++;
      }//if
    }//if pixelarray
  }//for - j
}//for - i

}//end setup

void draw() {
 background(bg);
  smooth();
  stroke(0);
  fill(0);
  //if the player has not yet clicked to start the game
  if(!started){
    //display the title message
    title();
  }
  //if the player has already clicked to start the game
  if(started){
    //display instructions
    textSize(13);
   instructions();
   //draw the frog character
   drawFrog(centreX,centreY,cellSize, direction);
    //draw the frog's targets (eggs) 
     //but first check how many have been collected
      for(int i=0;i<totalTargets;i++){
       if(collected[i]==true){
         collectedTargets++;
         println(collected[i]);
         println("collected: "+collectedTargets);
    }  
  }
// then loop through the targets which havent yet been collected 
  for(int i=1;i<collectedTargets*5;i++){  
     //calculate positions in the x and y axis  
      int xposition=(ghostSize*i)%width;
      int yposition =ghostSize*i/width+1;
      //check that the position of the target doesn't exceed size of pixel array
        if(40*yposition*width+xposition<pixels.length){
        //if that pixel is not white in the background image
          if(pixels[40*yposition*width+xposition]!=color(255,255,255)){
            //draw the frog's target
            //drawEgg(xposition,yposition*40,cellSize/2);   
          }//end if pixel not white
        }//end if position of target doesnt exceed size of array
    }// end looping through targets not yet collected
    //respawn eggs     
    for(int i=0;i<totalTargets;i++){
       if((collected[i])&&(gotTarget)){     
         //draw the target close to centreX and Y as if being carried by the player character
         drawEgg(centreX-10,centreY-10,cellSize);   
       }
       drawEgg(targets[i][0],targets[i][1],cellSize);
   
         if (detectCollision(targets[i][0], targets[i][1], centreX, centreY, pacSize)){
            gotTarget=true;
            collected[i]=true;
         targets[i][0]=centreY-10;
  //       println("collected- x: "+targets[i][0]+"y: "+targets[i][1]);
         targets[i][1]=centreX-10;
         }
}

//draw ghosts
for(int i=0;i<totalGhosts;i++){
ghostloc[i]=int(ghosts[i][0]+ghosts[i][1]*width);

moveGhost(ghosts[i][0],ghosts[i][1],i,6,3);
}


if (ghostsCleaned>=totalGhosts){
     goalMessage=almostThereMessage;
     getStartedMessage=encourageMessage;
        drawFrog(winX,winY,cellSize*2, "up");
}

pacloc=int(centreX+centreY*width);

   if(detectCollision(winX, winY, centreX, centreY, pacSize*2)&&(gotTarget==true)&&(ghostsCleaned>=totalGhosts)){
    fill(0);
    background(bg);  
    splat=false;
    //display congratulations messages
congratulations();
 
  
 credits();
 }

 
 for(int i=0;i<totalGhosts;i++){
//Icarrying the target, delete ghost   
    if(detectCollision(ghostX[i], ghostY[i], centreX, centreY, pacSize)&&(gotTarget==true)&&(deleted[i]==false)){
     ghostsCleaned++;
      deleted[i]=true;
      gotTarget=false;
  ghosts[i][0]=-100;
  ghosts[i][1]=-100;
      }
//If not carrying the target, die and respawn
if(detectCollision(ghostX[i], ghostY[i], centreX, centreY, pacSize)&&(gotTarget==false)&&(deleted[i]==false)){
 respawnPacman(ghostX[i],ghostY[i]); 
 }
}
 
 
if (keyPressed && (key == CODED)) {   //if it's coded key
  
     if(pacloc+(pacSize*width)<pixels.length){
       if (pixels[pacloc-pacSize]!=color(255,255,255)){
         if (keyCode == LEFT){ //if left arrow was pressed
           direction="r2l";
           if( centreX  < 0 ){ //if pacman moves left off the screen
          centreX =width ;  //move pacman back to start
        }      
         centreX=centreX-speed;//otherwise move pacman left
       }
         }
     }  
        if((pixels[pacloc+pacSize/2]!=color(255,255,255))||(pixels[pacloc+pacSize]==color(41,250,255))){
        if (keyCode == RIGHT){ //if the right arrow was pressed 
       direction="l2r"; 
       if(centreX+speed<=width){
       centreX=centreX+speed; //move pacman down, but not off the screen
         }
         else{
         centreX=0;
         }
       } 
      }
     if(pixels[pacloc-width*pacSize]!=color(255,255,255)){

      if (keyCode == UP){ //and if the up arrow key was pressed
             direction="up";
        if( centreY< 0 ){ //if pacman moves up off the screen
          centreY = 0 ;} //move pacman down again
          centreY=centreY-speed; //otherwise move pacman upwards
        }
     }
      if(pixels[pacloc+width*pacSize]!=color(255,255,255)){

      if (keyCode == DOWN){    //if the down arrow key was pressed
                 direction="down"; 
          centreY = (centreY+speed)%height ; //move pacman down, but not off the screen
      }
    } 

    }
    if(splat==true){
  drawSplat(splatX, splatY);
  }
  
  }
    //save a screenshot of the image
  if (mousePressed) {
    if (mouseButton == RIGHT) {
       save("pacman_portrait.png");
    }
  }
//this helps you find the coordinates of the points you click
  if (mousePressed) {
    if (mouseButton == LEFT) {
      started=true;
      getCoordinates();
    }
  }
}

Boolean detectCollision(int tempX, int tempY, int tempcX, int tempcY, int bBox){  
//detect collision 
targetYtop=tempY-bBox;
targetYbottom=tempY+bBox;
targetXleft=tempX-bBox;
targetXright=tempX+bBox;
if((targetXleft<tempcX) && (tempcX<targetXright)) {
Xcollision = true;
}
else{
Xcollision = false;
}
if((targetYtop<tempcY) && (tempcY<targetYbottom)) {
Ycollision = true;
}
else{
Ycollision = false;
}
if(Xcollision==true && Ycollision== true){
contact = true;
} 
else{
contact = false;
}
return contact;
}

void moveGhost(int tempX, int tempY, int num, int leftSpeed, int rightSpeed){
if(ghostloc[num]+(ghostSize*width)<pixels.length){
  int dir=int(random(1,5));
  if (dir==1){
        if((ghostloc[num]-ghostSize>=0)&&(ghostloc[num]-ghostSize<pixels.length)){
       if (pixels[ghostloc[num]-ghostSize-1]!=color(255,255,255)){
         //  direction="r2l";//LEFT
           if( tempX  < 0 ){ //if pacman moves left off the screen
          tempX =width ;  //move pacman back to start
        }      
         tempX=tempX-speed;//otherwise move ghostman left
         ghostX[num]=tempX;
         ghosts[num][0]=tempX;
         ghosts[num][1]=tempY;
       }
         }
  }
    if (dir==2){ 
         if((ghostloc[num]+ghostSize>=0)&&(ghostloc[num]+ghostSize<pixels.length)){    
        if(pixels[ghostloc[num]+ghostSize]!=color(255,255,255)){ 
      // direction="l2r"; //right
       if(tempX+speed<=width){
       tempX=tempX+speed; //move pacman right, but not off the screen
     ghostX[num]=tempX;  
              ghosts[num][0]=tempX;
         ghosts[num][1]=tempY;
       }
         else{
         tempX=0;
         ghostX[num]=tempX;
                  ghosts[num][0]=tempX;
         ghosts[num][1]=tempY;
         }
       } 
    }
    }
     if (dir==3){
       if((ghostloc[num]-width*ghostSize>=0)&&(ghostloc[num]-width*ghostSize<pixels.length)){
     if(pixels[ghostloc[num]-width*ghostSize]!=color(255,255,255)){
//             direction="up";//UP
        if( tempY< 0 ){ //if pacman moves up off the screen
          tempY = 0 ;} //move pacman down again
          tempY=tempY-speed; //otherwise move pacman upwards
          ghostY[num]=tempY;
                   ghosts[num][0]=tempX;
         ghosts[num][1]=tempY;
        }
     }
     }
     if(dir==4){
              if((ghostloc[num]+width*ghostSize>=0)&&(ghostloc[num]+width*ghostSize<pixels.length)){
      if(pixels[ghostloc[num]+width*ghostSize]!=color(255,255,255)){
                // direction="down"; 
          tempY = (tempY+speed)%height ; //move pacman down, but not off the screen
    ghostY[num]=tempY;  
             ghosts[num][0]=tempX;
         ghosts[num][1]=tempY;
    }
     }
     }
  drawSnake(tempX,tempY,cellSize);
}
}

void getCoordinates(){
      // Joining an array of ints requires first
      // converting to an array of Strings
      int[] coords = new int[2]; 
      coords[0] = mouseX; 
      coords[1] = mouseY;  
      String coordPair = join(nf(coords, 0), ", "); 
      fill(255,0,0);
      text(coordPair, 50,height/2-80, 200,100);
        //save("mapcoords.png");
        }

void drawSplat(float tempX, float tempY){
  if(splat==true){

 fill(red);
x=tempX;
y=tempY;
float radius = 0.5;

for (int deg = 0; deg < 360*6; deg += 11) {
  float angle = radians(deg);
  x = x + (cos(angle) * radius)/10;
  y = y + (sin(angle) * radius)/10;
  ellipse(x, y, 2, 2);
  radius = radius + 0.20;
}
}
}
void respawnPacman(int tempX, int tempY)
{//if there is  a collision 
//hide pacman
 visible = false;
 splat = true; 
  x = float(tempX);
 y = float(tempY); 
 splatX=x;
 splatY=y;
 //move pacman to start
//babyX=startTargetX;
//babyY=startTargetY; 
   centreX=startX; 
   centreY =startY;   
}
