int rSeed = -1; //if -1 the pseudorandom seed will be set automagically,else, use the seed here
int nSeed = -1; //ditto
Tile testTile = new Tile(random(0, 10), false);
void setup() {
  size(960, 540, P2D);
  if (rSeed != -1) {
    randomSeed(rSeed);
  }
  if (nSeed != -1) {
    noiseSeed(nSeed);
  }
  
}

void draw() {
  background(255);
  fill(0);
  rect(0, 0, height, height);
  testTile.Tick();
}
