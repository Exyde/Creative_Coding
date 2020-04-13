class Box{
 
  PVector[] vertices;
  PVector[] edge;
  int size;
  float xoff = 0, yoff = 1000, zoff = 8000;
  int range = 5;
  
  Box(int size){
    
    this.size = size;
    
    vertices = new PVector[]{
      new PVector(0, 0 ,0).mult(size), // 0 
      new PVector(1, 0 ,0).mult(size), // 1
      new PVector(0, 1 ,0).mult(size), // 2
      new PVector(1, 1 ,0).mult(size), // 3
      new PVector(1, 0 ,1).mult(size), // 4
      new PVector(0, 0 ,1).mult(size), // 5
      new PVector(0, 1 ,1).mult(size), // 6
      new PVector(1, 1 ,1).mult(size)  // 7
    };
    
    edge = new PVector[]{
      new PVector(0, 1), // FRONT FACE
      new PVector(1, 3),
      new PVector(3, 2),
      new PVector(2, 0), 
      new PVector(0, 5), // GROUND FACE  
      new PVector(5, 4),
      new PVector(4, 1),
      new PVector(3, 7), // TOP FACE
      new PVector(7, 6),
      new PVector(6, 2), 
      new PVector(6, 5), // BACK FACE
      new PVector(7, 4)
    };
  }
  
  void draw(){
    stroke(255, 0 ,0);
    fill(255);
   
    for(int i = 0; i < edge.length; i++){
      
      float x1 = vertices[(int)edge[i].x].x;
      float y1 = vertices[(int)edge[i].x].y;
      float z1 = vertices[(int)edge[i].x].z;
      
      float x2 = vertices[(int)edge[i].y].x;
      float y2 = vertices[(int)edge[i].y].y;
      float z2 = vertices[(int)edge[i].y].z;
      
      float r = map(noise(xoff), 0 , 1, 0, 255);
      float g = map(noise(yoff), 0 , 1, 0, 255);
      float b = map(noise(zoff), 0 , 1, 0, 255);
      stroke(r, g, b);
      
      line(x1, y1, z1, x2, y2, z2);
    }
  }
  
  void update(){
   for (int i = 0; i < (int)random(vertices.length); i++){
    vertices[i].x = map(noise(xoff), 0, 1, vertices[i].x - 2, vertices[i].x + 2);
    vertices[i].y = map(noise(yoff), 0, 1, vertices[i].y - 2, vertices[i].y + 2);
    vertices[i].z = map(noise(zoff), 0, 1, vertices[i].z - 2, vertices[i].z + 2);
   }
    xoff += 0.01;
    yoff += 0.01;
    zoff += 0.01;
  }
}
