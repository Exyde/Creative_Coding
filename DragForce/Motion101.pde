Mover[] movers = new Mover[100]; 
Liquid liquid;

PVector wind = new PVector(0.01, 0);
PVector gravity = new PVector(0, .1);

void setup(){
  size(500, 500);
  
  liquid = new Liquid(0, height/2, width, height/4, 0.1);

  for (int i = 0; i < movers.length; i++){
  movers[i] = new Mover(random(0.4, 5), random(0, width),  0);
  }
}

void draw(){
  background(0);  
  liquid.display();
  
  for (int i = 0; i < movers.length; i++) {
      
      //Compute Friction
      PVector friction = movers[i].velocity.copy();
      friction.mult(-1);
      friction.normalize();     
      float c = 0.0;
      float N = 1;     
      float Q = c * N;
      friction.mult(Q);
      
      //ComputeDragForce
      if (movers[i].isInside(liquid)){
       movers[i].drag(liquid); 
      }
      
      float m = movers[i].mass * 0.1;
      gravity.set(0, m);
      //movers[i].applyForce(friction);
     // movers[i].applyForce(wind);
      movers[i].applyForce(gravity);
      movers[i].live();  
      
      //drawPockets();
      
      saveFrame("output/img_####.png");
  }
}

void drawPockets(){
      stroke(255);
      strokeWeight(2);
      line(width/4, 0, width /4, height);
      line(width/4 * 3, 0, width /4 * 3, height);
      line(width/4, 0, width /4, height);
      strokeWeight(1);
}
