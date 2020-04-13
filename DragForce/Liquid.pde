class Liquid{
 
  float x, y, w, h;
  float c;
  
  Liquid(float x, float y, float w, float h, float c){
    this.x = x;
    this.y = y;
    this.h = h;
    this.w = w;
    this.c = c;
  }
  
  void display(){
   noStroke();
   fill(255, 0, 120, 160);
   rect(x, y, w, h);
  }
  
  
  
}
