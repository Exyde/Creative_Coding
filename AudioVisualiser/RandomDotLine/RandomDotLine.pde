import peasy.*;
import ddf.minim.*;
import ddf.minim.analysis.*;

float ratio = 100;
float offset = 300;
boolean recording = false;

PeasyCam cam;
Minim minim;
AudioPlayer song;
BeatDetect beat;

Point[] points;
int pointNumber = 1000;

void setup(){
  cam = new PeasyCam(this, 800, 0, 0, 1000);
  minim = new Minim(this);
  song = minim.loadFile("lonely.mp3", 512); //opstimised for lonely.mp3
  song.play();
  beat = new BeatDetect();
  size (1920, 1080, P3D);
  //fullScreen(P3D);
  points = new Point[song.bufferSize()];
  
  for (int i = 0; i < points.length; i++){
    points[i] = new Point(random(width), random(height), random(-500, 500));
  }
  
  frameRate(24);
  background(0);
}

void draw(){
  background(0, 0, 0);
  strokeWeight(.5);
  beat.detect(song.mix);

  for (int i = 0; i < random( song.bufferSize() - 1); i++){
    //Colors
    stroke(points[i].c);
    stroke(255);
    fill(points[i].c);

    //Positions
    float x = points[i].pos.x; float x2 = points[i+1].pos.x;
    float y = points[i].pos.y; float y2 = points[i+1].pos.y;
    float z = points[i].pos.z; float z2 = points[i+1].pos.z;
    float randx = points[(int)random(points.length)].pos.x;
    float randy = points[(int)random(points.length)].pos.y;
    float randz = points[(int)random(points.length)].pos.z;
    
    float l_songx = song.left.get(i);
    float l_songy = song.left.get(i+1);
    //float r_songx = song.right.get(i) * ratio + offset;
    //float r_songy = song.right.get(i+1) * ratio - offset;
    ratio = map(l_songx, -1, 1, 50, 120);
    //Drawing
    
    //WaveForm
    pushMatrix();
    translate(0, height/2, 0);
    float w1 = map(i, 0, song.bufferSize(), 0, width);
    float w2 = map(i+1, 0, song.bufferSize(), 0, width);   
    stroke(255, 0, 0);
    strokeWeight(1);
    line(w1, ratio + song.left.get(i) * ratio, w2, ratio + song.left.get(i) * ratio);
    popMatrix();

    pushMatrix();
    translate(0, 0, randz);   
    stroke(255);
        stroke(0);
    strokeWeight(.5);
    if (beat.isOnset()) {
      //rotateY(radians(random(360)));
      //translate(0,0, 0);
      if (song.position() > 91 * 1000) rect(randx, randy, song.left.level() * width, 100);
      else rect(randx, randy, l_songx * ratio, l_songy * ratio);
    }
    else {
     rect(randx, randy, l_songx * ratio, l_songy * ratio);
    }
    popMatrix();
   }
   
  for (Point point : points){
  point.update();
  }
  
   if (recording){
  saveFrame("output/image_####.png");
  }
}

void keyPressed(){
  if (key == CODED){
    if (keyCode == UP) song.cue(song.position() + 1000 * 3);
   else if (keyCode == DOWN) song.cue(song.position() - 1000 * 3);
   else if (keyCode == LEFT){
      if (song.isPlaying()) song.pause();
      else if (song.position() == song.length())
      {song.rewind(); song.play();} 
      else song.play();
    }
  }
  
    if (key == 'r' || key == 'R'){
    recording = !recording;
  }
}
