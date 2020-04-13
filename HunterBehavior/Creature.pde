class Creature{
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  float maxSpeed = 3;
  float magnitude = 3;
  
  PVector target;
  float xoff = 0;
  float yoff = 1000;
  
  float targetSpeed = 1;
  float runTreshold = 20;
  
  float size = 22;
  
  color c = color(random(255), random(255), random(255));
  
  Creature(){
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0 , 0);
    
    target = new PVector(random(width), random(height));
  }
  void update(){
    
    if (PVector.dist(location, target) > 2){
      //Getting the normalized direction to the target point
      PVector dir = PVector.sub(target, location);
      dir.normalize();
      dir.mult(magnitude);
      acceleration = dir;
    } else {
      target = new PVector(random(width), random(height));
    }

    //target updating.
    if (PVector.sub(location, target).mag() < runTreshold){
      targetSpeed *= 2;
    } else targetSpeed = 2;
    float t = random(1);
    if (t < .25) target.x += targetSpeed;
    else if (t < .5) target.x -= targetSpeed;
    else if (t < .75) target.y += targetSpeed;
    else target.y -= targetSpeed;
    
    target.x = constrain(target.x, 0, width);
    target.y = constrain(target.y, 0, height);
    
    velocity.add(acceleration);
    velocity.limit(maxSpeed);
    location.add(velocity);
  }
  
  void display(){
    noStroke();
    fill(c);
    ellipse(location.x, location.y, size, size);
    
    //target
    //stroke(255);
    ellipse (target.x, target.y, size /2, size / 2);
  }
  
  void checkEdges(){
    
    if (location.x < 0) location.x = width;
    else if( location.x > width) location.x = 0;
        
    if (location.y < 0) location.y = height;
    else if( location.y> height) location.y = 0;
  }
  
  void act(){
    this.update();
    this.checkEdges();
    this.display();
  }
}
