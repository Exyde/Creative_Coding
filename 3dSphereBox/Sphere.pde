class Ball{
 
  PVector pos;
  PVector velocity;
  int radius;
  int size = 100;
  int speed = 5;
  
  Ball(int radius){
   pos = new PVector(50, 50, 50);
   velocity = new PVector(random(1) * speed, random(1) * speed, random(1) * speed);
   this.radius = radius;
  }
  
  void draw(){
   pushMatrix();
   stroke(255);
   fill(255);
   translate((float)pos.x, (float)pos.y, (float)pos.z);
   sphere(radius);
   popMatrix();
  }
  
  void update(){    
    if (pos.x < 0 || pos .x > size) velocity.x *= -1;
    if (pos.y < 0 || pos .y > size) velocity.y *= -1;
    if (pos.z < 0 || pos .z > size) velocity.z *= -1;
    
    pos.add(velocity);
  }
  
  
}
