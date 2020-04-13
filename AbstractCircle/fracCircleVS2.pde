float size = 10;
float n = 100;
float t;

boolean recording = true;

void setup(){
  size(400, 400);
  background(0);

}

void draw(){
  //background(0);
  if (n > 0){
    drawCircle(n);
  }
  n--;
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

void drawCircle(float n){
  
  fill(map(n, 100, 1, 0, 255), 0, 120);
  float x = width/2 + noise(t) * n * n / size;
  float y = height/2 + noise(t) * n *n / size;
  
  ellipse(x, y, size * n, size * n);
}
