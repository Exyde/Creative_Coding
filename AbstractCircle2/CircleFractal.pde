//Template for a basic processing project, no import.
//Setup and draw function are basically implemented.
Circle circle;
float n = 10;
float theta = 0;
float t = 0;

boolean recording = false;

void setup(){
  size(500,500, P3D);
  circle = new Circle();
  background(0);
  frameRate(60);
}

void draw(){
  //background(0);
  translate(width/2, height/2);
  rotateZ(theta);
  circle.Draw(n, t, 100, 5);
  circle.Draw(n, t, 50, 2);
  circle.Draw(n, t, 150, 10);
  n = map(noise(t), 0, 1, 0, 2);
  theta += 0.1;
  t += 0.01;
  
  if (recording){
  saveFrame("output/image_####.png");
  }
}

void keyPressed(){
  if (key == 'r' || key == 'R'){
    recording = !recording;
  }
}
