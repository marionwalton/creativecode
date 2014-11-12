package processing.test.nametagapp;

import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import select.files.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class nameTagApp extends PApplet {


SelectLibrary files;

public void setup() {

 
  smooth();
  background(232,28,28);
  
  files = new SelectLibrary(this);
}
public void draw() {
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

public void keyPressed() {
  if ((key == 's') || (key == 'S')) {
      files.selectOutput("Select a file to write to:", "fileSelected");
  
  }
}

public void fileSelected(File selection) {
    if (selection == null) {
        println("Window was closed or the user hit cancel.");
    }else{
        println("User selected " + selection.getAbsolutePath());
        save(selection.getAbsolutePath() + ".png");
    }
}

  public int sketchWidth() { return 480; }
  public int sketchHeight() { return 120; }
}
