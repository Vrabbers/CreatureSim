int rSeed = -1; //if -1 the pseudorandom seed will be set automagically,else, use the seed here
int nSeed = -1; //ditto
Map testMap;
void setup() {
  colorMode(HSB, 360, 100, 100);
  size(960, 540, P2D);
  if (rSeed != -1) {
    randomSeed(rSeed);
  }
  if (nSeed != -1) {
    noiseSeed(nSeed);
  }
  testMap = new Map(27, 27);
  testMap.Generate(0.1, 4);
  frameRate(30);
  surface.setResizable(true);
}

void draw() {
  background(360);
  fill(0);
  rect(0, 0, height, height);
  textAlign(RIGHT, TOP);
  text(str(Math.round(frameRate)) + "FPS", width-2, 2);
  testMap.TestRender();
}
