//String filename = "dineo.gif";
int offsetX = 0; 
int offsetY= -10;
int size=1;
int columns =20;
int rows=20;
int frame=1;
//int exports=1;
String fileExt=".png";
String filePrefix="data";
String fileName=filePrefix+frame+fileExt;
String dataPrefix = "data";
String dataExt=".txt";
String dataName=dataPrefix+frame+dataExt;

String []columnsStr = new String[columns];
String []rowStr = new String[rows];
/*
//frame 0 
 String[][] colours = { 
{"FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000"},
{"FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000"},
{"FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF02AF09","FF000000","FF000000","FF000000","FF000000"},
{"FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF02AF09","FF000000","FF000000","FF000000","FF000000","FF000000"},
{"FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF02AF09","FF000000","FF000000","FF000000","FF000000","FF000000"},
{"FF000000","FF000000","FF000000","FF000000","FF000000","FFD5E500","FFD5E500","FFD5E500","FF000000","FF000000","FF000000","FF000000","FF000000","FF02AF09","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000"},
{"FF000000","FF000000","FF000000","FF02AF09","FF02AF09","FF02AF09","FF02AF09","FF02AF09","FF02AF09","FF02AF09","FF02AF09","FF000000","FF03FFEC","FF03FFEC","FF04027C","FF04027C","FF000000","FF000000","FF000000","FF000000"},
{"FF000000","FF000000","FF02AF09","FF02AF09","FF02AF09","FF02AF09","FF02AF09","FF02AF09","FF02AF09","FF02AF09","FF02AF09","FF02AF09","FF03FFEC","FF03FFEC","FF04027C","FF04027C","FF02AF09","FF02AF09","FF02AF09","FF000000"},
{"FF000000","FF000000","FF02AF09","FF02AF09","FF02AF09","FFF0F0F0","FF02AF09","FF02AF09","FF02AF09","FF02AF09","FFF0F0F0","FF02AF09","FF03FFEC","FF03FFEC","FF04027C","FF04027C","FF000000","FF000000","FF02AF09","FF000000"},
{"FF000000","FF000000","FF02AF09","FF02AF09","FF02AF09","FF02AF09","FF02AF09","FFF0F0F0","FF02AF09","FFF0F0F0","FF02AF09","FF02AF09","FF03FFEC","FF03FFEC","FF04027C","FF000000","FF000000","FF000000","FF000000","FF000000"},
{"FF000000","FF000000","FF02AF09","FF02AF09","FF02AF09","FF02AF09","FF02AF09","FFF0F0F0","FF02AF09","FFF0F0F0","FF02AF09","FF02AF09","FF03FFEC","FF03FFEC","FF04027C","FF000000","FF000000","FF000000","FF000000","FF000000"},
{"FF000000","FF000000","FF02AF09","FF02AF09","FF02AF09","FFF0F0F0","FF02AF09","FF02AF09","FF02AF09","FF02AF09","FFF0F0F0","FF02AF09","FF03FFEC","FF03FFEC","FF04027C","FF04027C","FF000000","FF000000","FF000000","FF000000"},
{"FF000000","FF000000","FF02AF09","FF02AF09","FF02AF09","FF02AF09","FF02AF09","FF02AF09","FF02AF09","FF02AF09","FF02AF09","FF02AF09","FF03FFEC","FF03FFEC","FF04027C","FF04027C","FF02AF09","FF02AF09","FF02AF09","FF000000"},
{"FF000000","FF000000","FF000000","FF02AF09","FF02AF09","FF02AF09","FF02AF09","FF02AF09","FF02AF09","FF02AF09","FF02AF09","FF000000","FF03FFEC","FF03FFEC","FF04027C","FF04027C","FF000000","FF000000","FF02AF09","FF000000"},
{"FF000000","FF000000","FF000000","FF000000","FF000000","FFD5E500","FFD5E500","FFD5E500","FF000000","FF000000","FF000000","FF000000","FF000000","FF02AF09","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000"},
{"FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF02AF09","FF000000","FF000000","FF000000","FF000000","FF000000"},
{"FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF02AF09","FF000000","FF000000","FF000000","FF000000","FF000000"},
{"FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF02AF09","FF000000","FF000000","FF000000","FF000000"},
{"FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000"},
{"FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000"},
};
*/
//frame 1
/*
 String[][] colours = {
{"FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000"},
{"FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000"},
{"FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF02AF09","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000"},
{"FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF02AF09","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000"},
{"FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF02AF09","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000"},
{"FF000000","FF000000","FF000000","FF000000","FF000000","FFD5E500","FFD5E500","FFD5E500","FF000000","FF000000","FF000000","FF000000","FF000000","FF02AF09","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000"},
{"FF000000","FF000000","FF000000","FF02AF09","FF02AF09","FF02AF09","FF02AF09","FF02AF09","FF02AF09","FF02AF09","FF02AF09","FF000000","FF03FFEC","FF03FFEC","FF04027C","FF04027C","FF000000","FF000000","FF000000","FF000000"},
{"FF000000","FF000000","FF02AF09","FF02AF09","FF02AF09","FF02AF09","FF02AF09","FF02AF09","FF02AF09","FF02AF09","FF02AF09","FF02AF09","FF03FFEC","FF03FFEC","FF04027C","FF04027C","FF02AF09","FF02AF09","FF02AF09","FF000000"},
{"FF000000","FF000000","FF02AF09","FF02AF09","FF02AF09","FFF0F0F0","FF02AF09","FF02AF09","FF02AF09","FFF0F0F0","FF02AF09","FF02AF09","FF03FFEC","FF03FFEC","FF04027C","FF04027C","FF000000","FF000000","FF02AF09","FF000000"},
{"FF000000","FF000000","FF02AF09","FF02AF09","FF02AF09","FF02AF09","FF02AF09","FFF0F0F0","FF02AF09","FFF0F0F0","FF02AF09","FF02AF09","FF03FFEC","FF03FFEC","FF04027C","FF000000","FF000000","FF000000","FF000000","FF000000"},
{"FF000000","FF000000","FF02AF09","FF02AF09","FF02AF09","FF02AF09","FF02AF09","FFF0F0F0","FF02AF09","FFF0F0F0","FF02AF09","FF02AF09","FF03FFEC","FF03FFEC","FF04027C","FF000000","FF000000","FF000000","FF000000","FF000000"},
{"FF000000","FF000000","FF02AF09","FF02AF09","FF02AF09","FFF0F0F0","FF02AF09","FF02AF09","FF02AF09","FFF0F0F0","FF02AF09","FF02AF09","FF03FFEC","FF03FFEC","FF04027C","FF04027C","FF000000","FF000000","FF000000","FF000000"},
{"FF000000","FF000000","FF02AF09","FF02AF09","FF02AF09","FF02AF09","FF02AF09","FF02AF09","FF02AF09","FF02AF09","FF02AF09","FF02AF09","FF03FFEC","FF03FFEC","FF04027C","FF04027C","FF02AF09","FF02AF09","FF02AF09","FF000000"},
{"FF000000","FF000000","FF000000","FF02AF09","FF02AF09","FF02AF09","FF02AF09","FF02AF09","FF02AF09","FF02AF09","FF02AF09","FF000000","FF03FFEC","FF03FFEC","FF04027C","FF04027C","FF000000","FF000000","FF02AF09","FF000000"},
{"FF000000","FF000000","FF000000","FF000000","FF000000","FFD5E500","FFD5E500","FFD5E500","FF000000","FF000000","FF000000","FF000000","FF000000","FF02AF09","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000"},
{"FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF02AF09","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000"},
{"FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF02AF09","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000"},
{"FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF02AF09","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000"},
{"FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000"},
{"FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000"},
 };
*/ 

//frame 2
  String[][] colours = {
{"FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000"},
{"FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000"},
{"FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF02AF09","FF000000","FF000000","FF000000","FF000000"},
{"FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF02AF09","FF000000","FF000000","FF000000","FF000000","FF000000"},
{"FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF02AF09","FF000000","FF000000","FF000000","FF000000","FF000000"},
{"FF000000","FF000000","FF000000","FF000000","FF000000","FFD5E500","FFD5E500","FFD5E500","FF000000","FF000000","FF000000","FF000000","FF000000","FF02AF09","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000"},
{"FF000000","FF000000","FF000000","FF02AF09","FF02AF09","FF02AF09","FF02AF09","FF02AF09","FF02AF09","FF02AF09","FF02AF09","FF000000","FF03FFEC","FF03FFEC","FF04027C","FF04027C","FF000000","FF000000","FF000000","FF000000"},
{"FF000000","FF000000","FF02AF09","FF02AF09","FF02AF09","FF02AF09","FF02AF09","FF02AF09","FF02AF09","FF02AF09","FF02AF09","FF02AF09","FF03FFEC","FF03FFEC","FF04027C","FF04027C","FF02AF09","FF02AF09","FF02AF09","FF000000"},
{"FF000000","FF000000","FF02AF09","FF02AF09","FF02AF09","FFF0F0F0","FF02AF09","FF02AF09","FF02AF09","FF02AF09","FFF0F0F0","FF02AF09","FF03FFEC","FF03FFEC","FF04027C","FF04027C","FF000000","FF000000","FF02AF09","FF000000"},
{"FF000000","FF000000","FF02AF09","FF02AF09","FF02AF09","FF02AF09","FF02AF09","FFF0F0F0","FF02AF09","FFF0F0F0","FF02AF09","FF02AF09","FF03FFEC","FF03FFEC","FF04027C","FF000000","FF000000","FF000000","FF000000","FF000000"},
{"FF000000","FF000000","FF02AF09","FF02AF09","FF02AF09","FF02AF09","FF02AF09","FFF0F0F0","FF02AF09","FFF0F0F0","FF02AF09","FF02AF09","FF03FFEC","FF03FFEC","FF04027C","FF000000","FF000000","FF000000","FF000000","FF000000"},
{"FF000000","FF000000","FF02AF09","FF02AF09","FF02AF09","FFF0F0F0","FF02AF09","FF02AF09","FF02AF09","FF02AF09","FFF0F0F0","FF02AF09","FF03FFEC","FF03FFEC","FF04027C","FF04027C","FF000000","FF000000","FF000000","FF000000"},
{"FF000000","FF000000","FF02AF09","FF02AF09","FF02AF09","FF02AF09","FF02AF09","FF02AF09","FF02AF09","FF02AF09","FF02AF09","FF02AF09","FF03FFEC","FF03FFEC","FF04027C","FF04027C","FF02AF09","FF02AF09","FF02AF09","FF000000"},
{"FF000000","FF000000","FF000000","FF02AF09","FF02AF09","FF02AF09","FF02AF09","FF02AF09","FF02AF09","FF02AF09","FF02AF09","FF000000","FF03FFEC","FF03FFEC","FF04027C","FF04027C","FF000000","FF000000","FF02AF09","FF000000"},
{"FF000000","FF000000","FF000000","FF000000","FF000000","FFD5E500","FFD5E500","FFD5E500","FF000000","FF000000","FF000000","FF000000","FF000000","FF02AF09","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000"},
{"FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF02AF09","FF000000","FF000000","FF000000","FF000000","FF000000"},
{"FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF02AF09","FF000000","FF000000","FF000000","FF000000","FF000000"},
{"FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF02AF09","FF000000","FF000000","FF000000","FF000000"},
{"FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000"},
{"FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000","FF000000"},
 };

void setup(){
size(columns*size,rows*size);
background(50);
smooth();
}
void draw(){
noStroke();

for(int i=0;i<columns;i++){
    for(int j=0; j<rows;j++){
    String colour = colours[i][j];
    int col = unhex(colour);
    fill(col);
      if (colours[i][j]!="FF000000") {
      int shapei=i+1;
    int shapej=j+1;  
  ellipse(offsetX+shapei*size, offsetY+shapej*size, size, size);
     }
    }
  }
save(2);
export(0,1,2);
exit();
}

void export(int shape, int mysize, int exports){
  background(200);
  int size=mysize;
  noStroke();
for(int i=0;i<columns;i++){
    for(int j=0; j<rows;j++){
    String colour = colours[i][j];
    int col = unhex(colour);
    fill(col);
     //if (colours[j][i]!=bomvu) {
        println(colours[i][j]);
        println(unhex("FFEA0216"));
      int shapei=i+1;
    int shapej=j+1;  
  
if (shape==0){
  rect(shapei*size, shapej*size, size, size);
     }
     else{
  ellipse(shapei*size, shapej*size, size, size);   
     }
    //}
    }
  }

save("framex"+exports+".png");

}


void save(int myframe){
 fileName=filePrefix+myframe+fileExt;
 
  save(fileName);
   println("you saved "+fileName);
     for(int j=0; j<columns;j++ ){
       for(int i=0; i<rows;i++){
           String colour = colours[i][j];
           //String colour=hex(c);
           rowStr[i] =colour;
           String joinedColours = join(rowStr, ","); 
           //println(joinedColours);  
           columnsStr[j]=joinedColours;
          }
    dataName=dataPrefix+myframe+dataExt;
    saveStrings(dataName, columnsStr);   
    }
    println("frame"+myframe);
   println("you saved "+dataName);
}


