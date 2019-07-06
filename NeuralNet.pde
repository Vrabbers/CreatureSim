class NeuralNet {
  final int INPUTS = 0;
  final int HIDDEN = 1;
  final int OUTPUT = 2;
  Neuron[] inputs;
  Neuron[] hidden;
  Neuron[] outputs;
  NeuralNet(int inputSize, int hiddenSize, int outSize, int amtLinks) {
    inputs = new Neuron[inputSize];
    hidden = new Neuron[hiddenSize];
    outputs = new Neuron[outSize];
    for (int i = 0; i < inputSize; i++) {
      inputs[i] = new Neuron();
    }
    for (int i = 0; i < hiddenSize; i++) {
      ArrayList<Link> tempLinks = new ArrayList<Link>(amtLinks);
      for (int l = 0; l < amtLinks; l++) {
        tempLinks.add(new Link(Math.round(random(0, inputSize-1)), random(-3, 3))); //very ugly line of code
      }
      hidden[i] = new Neuron(HIDDEN, tempLinks);
    }
    for (int i = 0; i < outSize; i++) { //partying like its 1824 with 100021934 for loops
      ArrayList<Link> tempLinks = new ArrayList<Link>(amtLinks);
      for (int l = 0; l < amtLinks; l++) {
        tempLinks.add(new Link(Math.round(random(0, inputSize-1)), random(-3, 3))); //very ugly line of code
      }
      outputs[i] = new Neuron(OUTPUT, tempLinks);
    }
    //lets hope all this works when i come around to testing this lma
    print("done");
  }

  NeuralNet(NeuralNet previousNet, int mutate) {
    this.inputs = previousNet.inputs;
    this.hidden = previousNet.hidden;
    this.outputs = previousNet.outputs;
    int chosenIndex;
    Neuron chosen;
    if (mutate > 0) {
      for (int i = 0; i < mutate*4; i++) {
        //weak mutations
        switch (Math.round(random(0, 2))) {
        case 0:
          chosenIndex = Math.round(random(0, inputs.length-1));
          chosen = inputs[chosenIndex];
          if ((int)random(0, 1) == 1) {
            chosen.links.get((int)random(0, chosen.links.size()-1)).bias += random(-mutate, mutate);  //uglier than that ugly line 18 (and it repeats multiple times kinda)
          } else {
            chosen.links.get((int)random(0, chosen.links.size()-1)).linkedTo = Math.round(random(0, inputs.length));
          }
          inputs[chosenIndex] = chosen; //and we finish the ugliest code ever only to do it again 2 more times
          break;

        case 1:
          chosenIndex = Math.round(random(0, hidden.length-1));
          chosen = hidden[chosenIndex];
          if ((int)random(0, 1) == 1) {
            chosen.links.get((int)random(0, chosen.links.size()-1)).bias += random(-mutate, mutate);
          } else {
            chosen.links.get((int)random(0, chosen.links.size()-1)).linkedTo = Math.round(random(0, hidden.length));
          }
          hidden[chosenIndex] = chosen; 
          break;

        case 2:
          chosenIndex = Math.round(random(0, outputs.length-1));
          chosen = outputs[chosenIndex];
          if ((int)random(0, 1) == 1) {
            chosen.links.get((int)random(0, chosen.links.size()-1)).bias += random(-mutate, mutate);
          } else {
            chosen.links.get((int)random(0, chosen.links.size()-1)).linkedTo = Math.round(random(0, outputs.length));
          }
          outputs[chosenIndex] = chosen;
          break;
        }
      }
    }
  }
  void setInputs(float[] values) {
    for (int i = 0; i < values.length; i++) {
      inputs[i].value = values[i];
    }
  }
}
