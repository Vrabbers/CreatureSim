class Neuron { //ugh this is already a Mess
  float value = 0.0;
  ArrayList<Link> links;
  int layer; //0 is the input layer, 1 is the hidden layer and 2 is the outputs and get sigmoided
  Neuron(int glayer, ArrayList<Link> glinks) {
    layer = glayer;
    links = glinks;
  }
  float calculate(ArrayList<Neuron> previousNeurons) {
    float calculatingValue = 0;
    for (int i = 0; i < links.size(); i++) {
      calculatingValue += previousNeurons.get(links.get(i).linkedTo).value * links.get(i).bias;
    }
    if (layer == 2) {
      calculatingValue = sigmoid(calculatingValue);
    }
    value = calculatingValue;
    return calculatingValue;
  }
}

class Link {
  int linkedTo;
  float bias;
  Link(int glinkedTo, float gbias) {
    linkedTo = glinkedTo;
    bias = gbias;
  }
}

float sigmoid(float x) {
  return (float)(1/( 1 + Math.pow(Math.E, (-1*x))));
}
