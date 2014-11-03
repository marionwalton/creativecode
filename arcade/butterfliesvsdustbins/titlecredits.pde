String titleMessage = "Mighty thinkers game";
String goalMessage = "Help butterfly find flowers!";
String getStartedMessage="Watch out for rubbish!";
String encourageMessage="Rubbish is all gone now! ";
String almostThereMessage="Take a flower to the big butterfly! ";
String goalAchievedMessage="Khazatown's safe now!";
String winMessage = "You've won!!";
 
 void instructions(){
 text(getStartedMessage, width/2,height/2+53,200)    ;
text(titleMessage,width/2,height/2+18);
text(goalMessage,width/2,height/2+35);
 }
 
 void congratulations(){
 text(winMessage, width/2,height/2-73,200)    ;
text(titleMessage,width/2,height/2-38);
text(goalAchievedMessage,width/2,height/2-55);
 }
void title(){      
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

void credits(){      
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


