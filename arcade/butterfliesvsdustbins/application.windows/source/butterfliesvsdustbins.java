import processing.core.*; 
import processing.xml.*; 

import java.applet.*; 
import java.awt.Dimension; 
import java.awt.Frame; 
import java.awt.event.MouseEvent; 
import java.awt.event.KeyEvent; 
import java.awt.event.FocusEvent; 
import java.awt.Image; 
import java.io.*; 
import java.net.*; 
import java.text.*; 
import java.util.*; 
import java.util.zip.*; 
import java.util.regex.*; 

public class butterfliesvsdustbins extends PApplet {


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
int white =color(255);
int yellow =color(255,255,0);
int blue =color(0,0,255);
int red =color( 255,0,0,200);
int green= color(155,252,140);
int purple= color(229,41,255,100);
int skyblue=color(41,250,255);
String direction = "l2r";


public void setup() {
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

public void draw() {
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
ghostloc[i]=PApplet.parseInt(ghosts[i][0]+ghosts[i][1]*width);

moveGhost(ghosts[i][0],ghosts[i][1],i,6,3);
}


if (ghostsCleaned>=totalGhosts){
     goalMessage=almostThereMessage;
     getStartedMessage=encourageMessage;
        drawFrog(winX,winY,cellSize*2, "up");
}

pacloc=PApplet.parseInt(centreX+centreY*width);

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

public Boolean detectCollision(int tempX, int tempY, int tempcX, int tempcY, int bBox){  
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

public void moveGhost(int tempX, int tempY, int num, int leftSpeed, int rightSpeed){
if(ghostloc[num]+(ghostSize*width)<pixels.length){
  int dir=PApplet.parseInt(random(1,5));
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

public void getCoordinates(){
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

public void drawSplat(float tempX, float tempY){
  if(splat==true){

 fill(red);
x=tempX;
y=tempY;
float radius = 0.5f;

for (int deg = 0; deg < 360*6; deg += 11) {
  float angle = radians(deg);
  x = x + (cos(angle) * radius)/10;
  y = y + (sin(angle) * radius)/10;
  ellipse(x, y, 2, 2);
  radius = radius + 0.20f;
}
}
}
public void respawnPacman(int tempX, int tempY)
{//if there is  a collision 
//hide pacman
 visible = false;
 splat = true; 
  x = PApplet.parseFloat(tempX);
 y = PApplet.parseFloat(tempY); 
 splatX=x;
 splatY=y;
 //move pacman to start
//babyX=startTargetX;
//babyY=startTargetY; 
   centreX=startX; 
   centreY =startY;   
}
public void drawEgg(int tempX, int tempY, int tempSize){    //draw pacman
    int rows = gridcolrows;
int columns= gridcolrows;
pushMatrix();
  translate(-tempSize*gridcolrows/2, -tempSize*gridcolrows/2);
int size=tempSize;    
    noStroke();  
    tempX=tempX;
    tempY=tempY;
  String[][]colours = {{"FFFF86F1","FFFF039B","FF000000","FF000000","FF000000","FFB90093","FFB90093","FF000000","FF000000","FF000000","FFFF86F1"},
{"FF000000","FFFF039B","FFB90093","FFFF039B","FFB90093","FFB90093","FFB90093","FFFF039B","FF000000","FFFF86F1","FF000000"},
{"FF000000","FF000000","FFFF039B","FFB90093","FFFF039B","FFD5E500","FFB90093","FFEA0216","FFFF86F1","FFEA0216","FF000000"},
{"FF000000","FF000000","FFFF039B","FFFF039B","FFFF039B","FFD5E500","FFFF039B","FFFF86F1","FFFF86F1","FFFF039B","FF000000"},
{"FF000000","FFB90093","FFB90093","FFFF039B","FFD5E500","FFD5E500","FFD5E500","FFFF039B","FFFF039B","FFB90093","FF000000"},
{"FFFF86F1","FFB90093","FFD5E500","FFD5E500","FFD5E500","FFD5E500","FFD5E500","FFD5E500","FFD5E500","FFFF86F1","FFFF86F1"},
{"FF000000","FFB90093","FFFF039B","FFFF039B","FFD5E500","FFD5E500","FFD5E500","FFFF039B","FFEA0216","FFB90093","FF000000"},
{"FF000000","FF000000","FFFF039B","FFFF86F1","FFFF039B","FFD5E500","FFFF039B","FFFF039B","FFFF039B","FFFF039B","FF000000"},
{"FF000000","FF000000","FFFF86F1","FFEA0216","FFFF039B","FFD5E500","FFFF039B","FFEA0216","FFFF039B","FF000000","FF000000"},
{"FF000000","FFFF86F1","FFEA0216","FFFF039B","FFB90093","FFB90093","FFB90093","FFFF039B","FFEA0216","FFFF039B","FF000000"},
{"FFFF86F1","FFEA0216","FF000000","FF000000","FFB90093","FFB90093","FF000000","FF000000","FFFF039B","FF000000","FFFF86F1"} };
for(int i=0;i<columns;i++){
    for(int j=0; j<rows;j++){
    String colour = colours[i][j];
    int col = unhex(colour);
    fill(col);
    if (colours[i][j]!="FF000000") {   
    ellipse(tempX+i*tempSize, tempY+j*tempSize, tempSize, tempSize);
    }
    }
    }
    popMatrix();
}      
  String[][]colours ={{"FF000000","FF000000","FF02AF09","FF02AF09","FF02AF09","FF000000","FF000000","FF02AF09","FF02AF09","FF02AF09","FF000000"},
{"FF000000","FF02AF09","FFFF86F1","FFFF86F1","FF02AF09","FF000000","FF02AF09","FFFF86F1","FFFF86F1","FFFF86F1","FF02AF09"},
{"FF000000","FF000000","FF02AF09","FF03FFEC","FFFF86F1","FF03FFEC","FFFF86F1","FF03FFEC","FFFF86F1","FF02AF09","FF000000"},
{"FF000000","FFFF9F03","FF000000","FF02AF09","FFFF86F1","FFFF86F1","FFFF86F1","FFFF86F1","FF02AF09","FF000000","FF000000"},
{"FF000000","FF000000","FFFF9F03","FF000000","FF02AF09","FFFF86F1","FFFF86F1","FF02AF09","FF000000","FF000000","FF000000"},
{"FF000000","FF000000","FF000000","FFFF039B","FFFF039B","FFFF039B","FFFF039B","FFFF039B","FFFF039B","FF000000","FF000000"},
{"FF000000","FF000000","FFFF9F03","FF000000","FF02AF09","FFFF86F1","FFFF86F1","FF02AF09","FF000000","FF000000","FF000000"},
{"FF000000","FFFF9F03","FF000000","FF02AF09","FFFF86F1","FFFF86F1","FFFF86F1","FFFF86F1","FF02AF09","FF000000","FF000000"},
{"FF000000","FF000000","FF02AF09","FF03FFEC","FFFF86F1","FF03FFEC","FFFF86F1","FF03FFEC","FFFF86F1","FF02AF09","FF000000"},
{"FF000000","FF02AF09","FFFF86F1","FFFF86F1","FF02AF09","FF000000","FF02AF09","FFFF86F1","FFFF86F1","FFFF86F1","FF02AF09"},
{"FF000000","FF000000","FF02AF09","FF02AF09","FF02AF09","FF000000","FF000000","FF02AF09","FF02AF09","FF02AF09","FF000000"} };

  public void drawFrog(float tempX, float tempY, int tempSize, String mydirection){
  pushMatrix();
    //draw pacman
    int rows = gridcolrows;
int columns= gridcolrows;
int size=tempSize;    
  translate(-tempSize*gridcolrows/2, -tempSize*gridcolrows/2);


    noStroke();  
    tempX=tempX;
    tempY=tempY;

    if (mydirection=="l2r"){
left(tempX, tempY, tempSize, rows, columns);
    }
    if (mydirection=="r2l")
    {
right(tempX, tempY, tempSize, rows, columns);
    }
    if (mydirection=="up")
    {
up(tempX, tempY, tempSize, rows, columns);
    }
        if (mydirection=="down"){
down(tempX, tempY, tempSize, rows, columns);
        }
popMatrix();
}    

public void up(float tempX, float tempY, int tempSize, int myrows, int mycolumns){

for(int i=0;i<mycolumns;i++){
    for(int j=0; j<myrows;j++){
    String colour = colours[i][j];
    int col = unhex(colour);
    fill(col);
      if (colours[i][j]!="FF000000") {  
    ellipse(tempX+i*tempSize, tempY+j*tempSize, tempSize, tempSize);
      } 
    }
    }
}

public void down(float tempX, float tempY, int tempSize, int myrows, int mycolumns){
      for (int n =0; n<gridcolrows; n++){
 for(int m =gridcolrows-1; m>=0; m--){
coloursl[n][abs(gridcolrows-m-1)]=colours[n][m]; 
    }
  }

for(int i=0;i<mycolumns;i++){
    for(int j=0; j<myrows;j++){
    String colours = coloursl[i][j];
    int col = unhex(colours);
    fill(col);
      if (coloursl[i][j]!="FF000000") {  
    ellipse(tempX+i*tempSize, tempY+j*tempSize, tempSize, tempSize);
      } 
    }
    }
}

public void left(float tempX, float tempY, int tempSize, int myrows, int mycolumns){
   /*   for (int n =0; n<gridcolrows; n++){
 for(int m =gridcolrows-1; m>=0; m--){
coloursl[n][abs(gridcolrows-m-1)]=colours[n][m]; 
    }
  }
  */
   for(int m =0; m<gridcolrows; m++){
    for (int n =0; n<gridcolrows; n++){
coloursr[n][m]=colours[m][abs(gridcolrows-n)-1]; 
    }
  }

for(int i=0;i<mycolumns;i++){
    for(int j=0; j<myrows;j++){
    String colours = coloursr[i][j];
    int col = unhex(colours);
    fill(col);
      if (coloursr[i][j]!="FF000000") {  
    ellipse(tempX+i*tempSize, tempY+j*tempSize, tempSize, tempSize);
      } 
    }
    }
}


public void right(float tempX, float tempY, int tempSize, int myrows, int mycolumns){
 for(int m =0; m<gridcolrows; m++){
    for (int n =0; n<gridcolrows; n++){
coloursr[n][m]=colours[m][n]; 
    }
  }

for(int i=0;i<mycolumns;i++){
    for(int j=0; j<myrows;j++){
    String colours = coloursr[i][j];
    int col = unhex(colours);
    fill(col);
      if (coloursr[i][j]!="FF000000") {  
    ellipse(tempX+i*tempSize, tempY+j*tempSize, tempSize, tempSize);
      } 
    }
    }
}
public void drawSnake(int tempX, int tempY, int tempSize){    //draw pacman
    int rows = gridcolrows;
int columns= gridcolrows;
pushMatrix();
  translate(-tempSize*gridcolrows/2, -tempSize*gridcolrows/2);
int size=tempSize;    
    noStroke();  
    tempX=tempX;
    tempY=tempY;
  String[][]colours = 
 {{"FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000"},
{"FFEA0216","FFEA0216","FFEA0216","FFEA0216","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF02AF09"},
{"FFEA0216","FFEA0216","FFEA0216","FFEA0216","FFEA0216","FFEA0216","FFEA0216","FFEA0216","FFEA0216","FF000000","FF02AF09"},
{"FFEA0216","FFEA0216","FFD5E500","FFEA0216","FFEA0216","FFEA0216","FFEA0216","FFEA0216","FFEA0216","FF000000","FF02AF09"},
{"FFEA0216","FFEA0216","FFD5E500","FFEA0216","FFEA0216","FFEA0216","FF03FFEC","FFEA0216","FFEA0216","FF02AF09","FF02AF09"},
{"FFEA0216","FFEA0216","FFEA0216","FFEA0216","FFD5E500","FFEA0216","FFEA0216","FF03FFEC","FFEA0216","FF000000","FF000000"},
{"FFEA0216","FFEA0216","FFEA0216","FFEA0216","FFD5E500","FFEA0216","FFEA0216","FF03FFEC","FFEA0216","FF000000","FF000000"},
{"FFEA0216","FFEA0216","FFD5E500","FFEA0216","FFEA0216","FFEA0216","FF03FFEC","FFEA0216","FFEA0216","FF02AF09","FF02AF09"},
{"FFEA0216","FFEA0216","FFD5E500","FFEA0216","FFEA0216","FFEA0216","FFEA0216","FFEA0216","FFEA0216","FF000000","FF02AF09"},
{"FFEA0216","FFEA0216","FFEA0216","FFEA0216","FFEA0216","FFEA0216","FFEA0216","FFEA0216","FFEA0216","FF000000","FF02AF09"},
{"FFEA0216","FFEA0216","FFEA0216","FFEA0216","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF02AF09"}};

for(int i=0;i<columns;i++){
    for(int j=0; j<rows;j++){
    String colour = colours[i][j];
    int col = unhex(colour);
    fill(col);
    if (colours[i][j]!="FF000000") {   
    ellipse(tempX+i*tempSize, tempY+j*tempSize, tempSize, tempSize);
    }
    }
    }
    popMatrix();
}
    
String titleMessage = "Mighty thinkers game";
String goalMessage = "Help butterfly find flowers!";
String getStartedMessage="Watch out for rubbish!";
String encourageMessage="Rubbish is all gone now! ";
String almostThereMessage="Take a flower to the big butterfly! ";
String goalAchievedMessage="Khazatown's safe now!";
String winMessage = "You've won!!";
 
 public void instructions(){
 text(getStartedMessage, width/2,height/2+53,200)    ;
text(titleMessage,width/2,height/2+18);
text(goalMessage,width/2,height/2+35);
 }
 
 public void congratulations(){
 text(winMessage, width/2,height/2-73,200)    ;
text(titleMessage,width/2,height/2-38);
text(goalAchievedMessage,width/2,height/2-55);
 }
public void title(){      
  fill(0);
rect(0,0,width,height);
fill(255);
textAlign(CENTER);
textSize(24);
text ("Welcome to Khazatown",width/2,25);
text ("Click the mouse to start.",width/2,45 ); 
textSize(16);
text ("Characters by Talita and Onke.",width/2,65) ;  
text ("Ikamvacoders.wordpress.com.",width/2,85);
direction="up";
drawFrog(centreX+200,centreY+50,cellSize*10, direction);
drawEgg(centreX+700,centreY+50,cellSize*10);
drawSnake(centreX+450,centreY+50,cellSize*10);
}

public void credits(){      
  fill(0,0,0,200);
rect(0,0,width,height);
fill(255);
textAlign(CENTER);
textSize(24);
text ("You helped Khazatown!",width/2,65);
textSize(16);
text ("Characters by Talita and Onke.",width/2,85 ); 
text ("Coding by Marion and Rob.",width/2,105) ;  
text ("Ikamvacodes.wordpress.com.",width/2,125);
direction="up";
drawSnake(width/2-200,height/2+100,cellSize*5);
drawFrog(width/2,height/2+100,cellSize*5, direction);
drawEgg(width/2+200,height/2+100,cellSize*5);
}


  static public void main(String args[]) {
    PApplet.main(new String[] { "--present", "--bgcolor=#666666", "--stop-color=#cccccc", "butterfliesvsdustbins" });
  }
}
