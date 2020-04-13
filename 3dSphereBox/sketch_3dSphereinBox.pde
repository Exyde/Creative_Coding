Box box;
Ball ball;
float theta = 0;

boolean recording = true;

void setup(){
 size(600,600, P3D);
 
 lightSpecular(255, 255, 255);
 directionalLight(204, 204, 204, 0, 0, -1);
 specular(255, 255, 255);
 ball = new Ball(5);
 box = new Box(100);
}

void draw(){
 pushMatrix();
 background(0);
 translate(width / 2, height / 2, 10);
 rotateX(PI/3);
 rotateZ(theta);
 box.draw();
 ball.draw();
 
 ball.update();
 //box.update();

 popMatrix();
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
