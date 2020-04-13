//Globals
int block = 20;
int size = block / 2;
Player player;

boolean recording = true;

class Player{
 int x;
 int y;

 void move(){
 
   int dir = int(random(0, 4));
   
   switch (dir)
   {
     case 0: x += block; break;
     case 1: x -= block; break;     
     case 2: y += block; break;
     case 3: y -= block; break;  
     default : break;
   }
   
   x = constrain(x , block, width - block);
   y = constrain(y , block, height - block);
 }
 
 void display(){
   fill(255, 0 ,0);
   ellipse (x, y, size, size);
 }
}

void setup(){
 size (480, 480); 
 stroke(255);
 player = new Player();
 player.x = width/2;
 player.y = height /2;

 frameRate(10);
}

void draw(){
  background(0);
  displayGrid();
  
  player.move();
  player.display();

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


void displayGrid()
{
  stroke(255);
  for (int x = block; x <= width - block; x+= block) {
    for (int y = block; y <= height - block; y+= block) {
      line(x, y, width - block, y);
      line(x, y, x, height - block);
    }
  }
}
