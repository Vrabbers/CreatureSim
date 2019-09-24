package com.turtlestuff;

import java.util.ArrayList;

class Neuron { //ugh this is already a Mess
    float value = 0.0f;
    ArrayList<Link> links;
    int layer; //0 is the input layer, 1 is the hidden layer and 2 is the outputs and get sigmoided

    Neuron(int glayer, ArrayList<Link> glinks) { //layer 1 and 2
        layer = glayer;
        links = glinks;
    }

    Neuron() { //used for layer 0
        links = null;
        layer = 0;
    }

    float calculate(Neuron[] previousNeurons) {
        float calculatingValue = 0;
        for (int i = 0; i < links.size(); i++) {
            calculatingValue += previousNeurons[links.get(i).linkedTo].value * links.get(i).bias;
        }
        if (layer == 2) {
            calculatingValue = Utils.sigmoid(calculatingValue);
        }
        value = calculatingValue;
        return calculatingValue;
    }
}

