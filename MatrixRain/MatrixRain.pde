//Template for a basic processing project, no import.
//Setup and draw function are basically implemented.
Symbol symbol;
int symbolSize = 16;
PFont font;
String katas[];
Stream[] streams;

boolean recording = true;

void setup(){
 // size(displayWidth, displayHeight); 
  size(800, 400);
  background(0);
  font = createFont("TakaoMincho", symbolSize);
  textFont(font);
  textSize(symbolSize);
  
  katas = loadStrings("katakana.txt");
  streams = new Stream[width/symbolSize];
  
  float x = 0, y = 0;
  
  for (int i = 0; i < streams.length; i++){
    y = random(-1000, 0);
    Stream stream = new Stream(x, y);
    streams[i] = stream;
    x += symbolSize;
  }

}

void draw(){
  background(0);
  for (int i = 0; i < streams.length; i++){
    streams[i].display();
  }

    if (recording){
  saveFrame("output/image_####.png");
  }
}

void keyPressed(){
  if (key == 'r' || key == 'R'){
    recording = !recording;
  }
}
