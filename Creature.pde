class Creature {
  final int UP = 0;
  final int RIGHT = 1;
  final int DOWN = 2;
  final int LEFT = 3;
  int xPos;
  int yPos;
  int direction;
  float hunger;
  float thirst;
  float[][] vision;
  int visionHeight; 
  int visionWidth; //these must be odd
  color creatureColor;
  NeuralNet neuralNet;
  Creature(int initX, int initY, int initDirection, int gvisionHeight, int gvisionWidth, NeuralNet netToMutate, color gcolor) {
    xPos = initX;
    yPos = initY;
    direction = initDirection;
    hunger = -1;
    thirst = -1;
    vision = new float[gvisionHeight][gvisionWidth];
    visionHeight = gvisionHeight;
    visionWidth = gvisionWidth;
    neuralNet = new NeuralNet(netToMutate, 1); //this one is for children
    int colorModify = 0;
    switch(round(random(0,2))){
      case 0:
      colorModify = 0x02;
      break;
      case 1:
      colorModify = 0x0200;
      break;
      case 2:
      colorModify = 0x020000;
      break;
    }
    if(round(random(0,1)) == 1){
      creatureColor = gcolor + colorModify;
    }else{
      creatureColor = gcolor - colorModify;
    }
  }
  Creature(Map map) {
    int selX;
    int selY;
    do {
      selX = round(random(0, map.mapHeight));
      selY = round(random(0, map.mapWidth));
    } while (!map.tileMap[selX][selY].isWater);
    xPos = selX;
    yPos = selY;
    direction = round(random(0, 3));
    hunger = -1;
    thirst = -1;
    int selVH;
    int selVW;
    do {
      selVH = round(random(minVisionHeight, maxVisionHeight));
      selVW = round(random(minVisionWidth, maxVisionWidth));
    } while (selVH%2 != 1 & selVW%2 != 1);
    vision = new float[selVH][selVW];
    visionHeight = selVH;
    visionWidth = selVW;
    neuralNet = new NeuralNet(20, hiddenNNLayerSize, 10, amountOfNNLinks);
    creatureColor = round(random(0,0xffffff));    
  }
  void See() {
    for (int w = 0; w < visionWidth; w++) {
      for (int h = 0; h < visionHeight; h++) {
        switch(direction) {
        case UP:
          break;
        case DOWN:
          break;
        case LEFT:
          break;
        case RIGHT:
          break; //more bad code, ho ray!
        }
      }
    }
  }
}
