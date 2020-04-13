//Template for a basic processing project, no import.
//Setup and draw function are basically implemented.
Creature[] chasers;
boolean recording = false;
void setup(){
  size (480, 480);
  chasers = new Creature[10];
  frameRate(60);
  
  for (int i = 0; i < chasers.length; i++){
   chasers[i] = new Creature(); 
  }
}

void draw(){
  background(0);
  //drawGround();
 
   for (int i = 0; i < chasers.length; i++){
   chasers[i].act();
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


void drawGround(){
  fill(255);
  rect(0, height - 40, width, height); 
}
