class Stream{
  float x, y;
  float speed;
  int size = (int)random(4, height/symbolSize);
  Symbol[] symbols;
  
  Stream(float x, float y){
    speed = random(1, 3);
    symbols = new Symbol[size];
    this.x = x;
    this.y = y;

    
    for (int i = 0; i < size; i++){
      Symbol symbol = new Symbol(x, y, speed);
      symbols[i] = symbol;
      y -= symbolSize;
      if (i == 0) symbol.first = true;
      }
  }
  
  void display(){
    for (int i = 0; i < size; i++){
        symbols[i].display();
    }
  }
  
  
}
