class Pic {
  boolean cw;
  float ratio;
  float rot;
  float scale;
  PImage img;
  String txt;
  
  Pic(String filename, boolean clockwise) {
    cw = clockwise;
    rot = cw ? -0.2 : 0.2;
    scale = 1.2;   
    img = loadImage("imgs/" + filename);
    txt = filename.split("-")[0];
    ratio = float(img.height) / float(img.width);
  }
  
  void update() {
    scale = max(0.8, scale - 0.05);
    rot += cw ? 0.001 : - 0.001; 
  }
}
