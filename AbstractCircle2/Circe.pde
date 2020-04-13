class Circle{
 
  float x, y;
  float radius;
  float angle = 0;
  float points = 64;
  float size = 4;
  
  void Draw(float n, float t , float ratio, float offset){
      
      float _n = n;
      float _t = t;
      
      for (float i = 0.0; i < points; i++){
        angle = i / points * PI * 2.0;
        
        x = sin(angle) * ratio * _n - noise(t);
        y = cos(angle) * ratio * _n - noise(t);
        
        stroke(255);
        fill(map(n, 0, 2, 255, 0), 0, map(n, 0, 2, 0, 255));
        //float r = map(i, 0, points, 0, 255);
        //float g = 120;
        //float b = 255;
        //fill(r, g, b);
        //fill(map(cos(angle) * ratio, 0, 1, 0, 255), 0, map(sin(angle) * ratio, 0, 1, 255, 0));
        ellipse(x , y , size * random(1, 2), size * random(1, 2));  
      }
  }
}
