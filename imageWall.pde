import codeanticode.syphon.*;
import java.io.FilenameFilter;

String txt = "YOUR TEXT HERE";

PGraphics canvas;
SyphonServer server;
PFont font;

boolean flip = false;
int lastTime = 0;
int timeDelay = 4000;

String[] filenames;
int currFile = 0;
Pic pic;

int margin = 100;

void setup() {
  size(960, 540, P3D);
  canvas = createGraphics(960, 540, P3D);
  server = new SyphonServer(this, "Processing Syphon");
  font = createFont("Souses.otf", 60);
  
  loadFile();
  nextFlip();
}

void draw() {
  if (millis() - lastTime > timeDelay) {
    nextFlip();
    lastTime = millis();
  }
  
  pic.update();
  
  Dimensions imgSize = new Dimensions();
  if (pic.ratio == 1) {
    imgSize.w = imgSize.h = height - margin;
  } else if (pic.ratio > 1.0){
    imgSize = scaleByHeight();
  } else {
    imgSize = scaleByWidth();
  }
  
  canvas.beginDraw();
  canvas.pushMatrix();
  canvas.translate(width/2, height/2);
  canvas.rotate(pic.rot);
  canvas.scale(pic.scale);
  canvas.background(0,255,0);
  
  canvas.image(pic.img, -(imgSize.w/2), -(imgSize.h/2), imgSize.w, imgSize.h);
  
  canvas.textFont(font);
  canvas.textAlign(CENTER, CENTER);
  canvas.textSize(30);
  
  canvas.text(pic.txt, -(width/2), imgSize.h/4, width, height/2);
  
  
  canvas.popMatrix();
  
  canvas.textSize(40);
  canvas.text(txt, width/2, 20);
  canvas.endDraw();
  
  image(canvas, 0, 0);
  server.sendImage(canvas);
}

void loadFile() {
  filenames = listFileNames();
  pic = new Pic(filenames[currFile], flip);
}

void nextFlip() {
  flip = !flip;
  loadFile();
  currFile++;
  if (currFile >= filenames.length) currFile = 0;
}

// This function returns all the files in a directory as an array of Strings  
String[] listFileNames() {
  File file = new File(sketchPath() + "/imgs");
  if (file.isDirectory()) {
    String names[] = file.list(new ImageFilter());
    return names;
  } else {
    // If it's not a directory
    return null;
  }
}
