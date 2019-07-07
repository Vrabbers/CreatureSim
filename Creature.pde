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
  NeuralNet neuralNet;
  Creature(int initX, int initY, int initDirection, int gvisionHeight, int gvisionWidth, NeuralNet netToMutate) {
    xPos = initX;
    yPos = initY;
    direction = initDirection;
    hunger = -1;
    thirst = -1;
    vision = new float[gvisionHeight][gvisionWidth];
    visionHeight = gvisionHeight;
    visionWidth = gvisionWidth;
    neuralNet = new NeuralNet(netToMutate, 1); //this one is for children
  }
  Creature() {
    //this one is for new creatures but ill write it later
  }
  void See() {
  }
}
