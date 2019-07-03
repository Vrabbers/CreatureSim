long rSeed = -1; //if -1 the pseudorandom seed will be set automagically,else, use the seed here
long nSeed = -1; //ditto
float howMuchFood = 5.3; //how much food is there. 5 is very low, while 6 is already a lot. default 5.3
boolean shouldTick = false; //timer so we tick only every other frame
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
  testMap = new Map(54);
  testMap.Generate(0.1, 4);
  frameRate(30);
  surface.setResizable(true);
}

void draw() {
  background(219, 58, 93);
  fill(0);
  rect(0, 0, height, height);
  textAlign(RIGHT, TOP);
  text(str(Math.round(frameRate)) + "FPS", width-2, 2);
  if (shouldTick) {
    testMap.TickAll();
  } else {
    shouldTick = true;
  }
  testMap.Render();
}

void mouseClicked() {
  try {
    println(testMap.tileMap[(int)(mouseX/testMap.scaling)][(int)(mouseY/testMap.scaling)].EatMe());
  } 
  catch(ArrayIndexOutOfBoundsException e) {
    println(e);
  }
}
