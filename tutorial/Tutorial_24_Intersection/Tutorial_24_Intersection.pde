import processing.xml.*;
import processing.opengl.*;
import geomerative.*;

RShape shp;

void setup(){
  size(600, 600);
  smooth();

  // VERY IMPORTANT: Allways initialize the library before using it
  RG.init(this);
  RG.setPolygonizer(RG.ADAPTATIVE);
  
  shp = RG.loadShape("bot1.svg");
  shp = RG.centerIn(shp, g);

  RG.ignoreStyles();
}

void draw(){
  translate(width/2, height/2);
  background(#2D4D83);
  
  noFill();
  stroke(255);
  
  RG.shape(shp);
  line(-width/2, -height/2, mouseX-width/2, mouseY-height/2);

  fill(0, 200);
  noStroke();  
  RPoint[] ps = shp.intersection(-width/2, -height/2, mouseX-width/2, mouseY-height/2);
  if (ps != null) {
    for (int i=0; i<ps.length; i++) {
      ellipse(ps[i].x, ps[i].y, 10, 10);
    }
  }
}
