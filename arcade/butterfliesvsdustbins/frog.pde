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

  void drawFrog(float tempX, float tempY, int tempSize, String mydirection){
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

void up(float tempX, float tempY, int tempSize, int myrows, int mycolumns){

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

void down(float tempX, float tempY, int tempSize, int myrows, int mycolumns){
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

void left(float tempX, float tempY, int tempSize, int myrows, int mycolumns){
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


void right(float tempX, float tempY, int tempSize, int myrows, int mycolumns){
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
