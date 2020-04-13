class Landscape{
  
  float size;
  int row, col;
  
  float zoff;
  float[][] z;
  
  Landscape(int size, int row, int col){
    this.size = size;
    this.row = row;
    this.col = col;
    
    z = new float[col][row];
  }
  
  void render(){
    
    fill(40, 0 , 40);
    for (int x = 0; x < z.length - 1; x++){
      beginShape(QUAD_STRIP);
      for (int y = 0; y < z[x].length; y++){  
        
      //Quad renderer
      //Actual B&W settings, pretty neat
      
      fill (0);
      stroke(255);
      //Trying other colors
      float currentY = z[x][y];
      float currentShade = map(currentY, -120, 120, 0 , 255);
      fill(currentShade, 0, map(currentY, -120, 120, 255, 0));
      
      //Coord and shaping
      float xpos = x * size;
      float ypos = y * size;
      
      float zpos = z[x][y];
      vertex(xpos, ypos, zpos);
      vertex(xpos + size, ypos, z[x + 1][y]);
        
      }
      endShape();
    }
  }
  
  void update() {
    float xoff = 0;
    for (int i = 0; i < col; i++){
      float yoff = 0;
      for (int j = 0; j < row; j++){
        z[i][j] = map (noise(xoff, yoff, zoff), 0, 1, -120, 120);
        yoff += 0.1;
      }
      xoff += 0.1;
    }
    zoff += 0.01;
  }
}
