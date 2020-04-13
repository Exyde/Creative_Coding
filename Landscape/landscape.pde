Landscape land;
int SIZE = 20;
int ROW = 35;
int COL = 35;
float theta = 3;

boolean recording = false;

void setup(){
  size(1200, 700, P3D);
  land = new Landscape(SIZE, ROW, COL);
}

void draw(){
  pushMatrix();
  background(0);
  
  translate(width / 2, height / 2 + 100);
  //translate(width / 4 , height / 2 - SIZE / 4 + 100);
  //translate(width / 2 - SIZE  * COL / 2, height / 2 - SIZE * ROW / 4,  -120);
  rotateX(PI/3);
  rotateZ(theta);
  land.render();
  popMatrix();
  
  land.update();
  
  //Camera Rotation Overview, for rendering
  theta += 0.0025; 

    if (recording){
  saveFrame("output/image_####.png");
  }
}

void keyPressed(){
  if (key == 'r' || key == 'R'){
    recording = !recording;
  }
}
