void drawSnake(int tempX, int tempY, int tempSize){    //draw pacman
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
    
