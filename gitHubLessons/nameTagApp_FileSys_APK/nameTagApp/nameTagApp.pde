import select.files.*;
SelectLibrary files;

void setup() {

  size(480, 120);
  smooth();
  background(232,28,28);
  
  files = new SelectLibrary(this);
}
void draw() {
  if (mousePressed) {
    fill(7,124,20);
  }else{
  fill(255);
  }

  if ((key == 'b') || (key == 'B')) {
    fill(0);
  }
  if ((key == 'r') || (key == 'R')) {
    fill(255,0,0);
  }
  if ((key == 'w') || (key == 'W')) {
    fill(255);
  }

  ellipse(mouseX, mouseY, 20, 20);
}

void keyPressed() {
  if ((key == 's') || (key == 'S')) {
      files.selectOutput("Select a file to write to:", "fileSelected");
  
  }
}

void fileSelected(File selection) {
    if (selection == null) {
        println("Window was closed or the user hit cancel.");
    }else{
        println("User selected " + selection.getAbsolutePath());
        save(selection.getAbsolutePath() + ".png");
    }
}
