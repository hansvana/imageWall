class Dimensions {
   int w;
   int h;
   
   Dimensions() {
     w = h = 0;  
   }
}

Dimensions scaleByHeight() {
  Dimensions d = new Dimensions();
  
  d.h = height - margin;
  float ratio = d.h / float(pic.img.height);
  d.w = int(float(pic.img.width) * ratio);
  
  return d;
}

Dimensions scaleByWidth() {
  Dimensions d = new Dimensions();
  
  d.w = width - margin;
  float ratio = width / float(pic.img.width);
  d.h = int(float(pic.img.height) * ratio);
  
  if (d.h > height - margin) d = scaleByHeight();
  
  return d;
}
