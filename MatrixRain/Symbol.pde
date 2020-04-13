class Symbol{
  float x, y;
  float speed;
  String value;
  int switchSpeed = int(random(10, 30));
  boolean first = false;
  float r;
  
  Symbol(float x , float y, float speed){
    this.x = x;
    this.y = y;
    this.speed = speed;
    getRandomSymbol();
    r = random(0, 4);
  }
  void display(){
    if (frameCount % switchSpeed  == 0) getRandomSymbol();

    if (first){
      if (r > 3) fill (#00FF17);
    } else fill(#23B430, map(y, 0, height/2, 120, 255));
    
    text(value, x, y);
    rain();
  }
  
  void rain(){ 
    y = (y >= height) ? 0 : y + speed;
  }

  void getRandomSymbol(){
    value = katas[(int)random(0, katas.length)];
  }
}
