class Point {
  PVector pos;
  float xt;
  float yt;
  float zt;
  color c;

  Point(float x, float y, float z) {
    pos = new PVector(x, y, z);
    xt = random(1000);
    yt = random(1000) + 1000;
    zt = random(1000) + 2000;
    c = color (random(10, 20), random(120, 255), random(0, 160), random(20, 150));
    //c = color (random(120, 255), random(0, 5), random(0, 20), random(20, 150));// backupcolor

  }

  void update() {
    pos.x += map(noise(xt), 0, 1, -3, 3);
    pos.y += map(noise(yt), 0, 1, -3, 3);
    pos.y += map(noise(zt), 0, 1, -3, 3);

    xt += 0.001;
    yt += 0.01;
    zt += 0.1;
  }
}
