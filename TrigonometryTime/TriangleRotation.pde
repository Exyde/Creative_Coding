float t = 0;
int triN = 60;
float triS = 100;
float speed = 2;
float scale = 20;

boolean recording = true;
boolean reduce = false;
void setup(){
  size(800, 800);
  noFill();
  strokeWeight(2);
  stroke(255);
}

void draw(){
  background(0);
  translate(width/2, height/2);
  triS = map(mouseX, 0, width, 20, 200);
  triS = scale;
 // triN = int(map(mouseX, 0, width, 4, 90));
  for (int i = 0; i < triN; i++){
    fill(255, 255, 25, 0);
    rotate(radians(360/triN));
    pushMatrix();
    translate(200,0);
    //rotate(radians(t));
    rotate(radians(t + i * 360 / triN));
    tri(triS);  
    popMatrix();
  }
  
    t += speed;
    
  if (reduce == false){
     scale += 1.5;
  }
  
  if (scale >= 150){
    reduce = true;
  }
  if (reduce == true){
  scale -= 1.5;
  }


    if (recording){
  saveFrame("output/image_####.png");
  }
}

void keyPressed(){
  if (key == 'r' || key == 'R'){
    recording = !recording;
  }
}


void tri(float len){
  fill(random(255), random(255), random(255), 25);
  triangle(0, -len, 
    -len * sqrt(3) /2, len / 2,
    len * sqrt(3) / 2, len /2);
}
