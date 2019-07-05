class NeuralNet {
  final int INPUTS = 0;
  final int HIDDEN = 1;
  final int OUTPUT = 2;
  Neuron[] inputs;
  Neuron[] hiddenLayer;
  Neuron[] outputs;
  NeuralNet(int inputSize, int hiddenSize, int outSize, int amtLinks) {
    inputs = new Neuron[inputSize];
    hiddenLayer = new Neuron[hiddenSize];
    outputs = new Neuron[outSize];
    for (int i = 0; i < inputSize; i++) {
      inputs[i] = new Neuron();
    }
    for (int i = 0; i < hiddenSize; i++) {
      ArrayList<Link> tempLinks = new ArrayList<Link>(amtLinks);
      for (int l = 0; i < amtLinks; l++) {
        tempLinks.add(new Link(Math.round(random(0, inputSize-1)), random(-3, 3))); //very ugly line of code
      }
      hiddenLayer[i] = new Neuron(HIDDEN, tempLinks);
    }
    for (int i = 0; i < outSize; i++) { //partying like its 1824 with 100021934 for loops
      ArrayList<Link> tempLinks = new ArrayList<Link>(amtLinks);
      for (int l = 0; i < amtLinks; l++) {
        tempLinks.add(new Link(Math.round(random(0, inputSize-1)), random(-3, 3))); //very ugly line of code
      }
      hiddenLayer[i] = new Neuron(OUTPUT, tempLinks);
    }
    //lets hope all this works when i come around to testing this lma
  }
}
