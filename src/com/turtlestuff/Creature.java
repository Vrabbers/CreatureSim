package com.turtlestuff;

import processing.core.PApplet;

public class Creature {
    PApplet p; //parent
    public static final int UP = 0;
    public static final int RIGHT = 1;
    public static final int DOWN = 2;
    public static final int LEFT = 3;
    int xPos;
    int yPos;
    int direction;
    float hunger;
    float thirst;
    float[][] vision;
    int visionHeight;
    int visionWidth; //these must be odd
    int creatureColor;
    NeuralNet neuralNet;

    Creature(int initX, int initY, int initDirection, int gvisionHeight, int gvisionWidth, NeuralNet netToMutate, int gcolor, PApplet gp) {
        p = gp;
        xPos = initX;
        yPos = initY;
        direction = initDirection;
        hunger = -1;
        thirst = -1;
        vision = new float[gvisionHeight][gvisionWidth];
        visionHeight = gvisionHeight;
        visionWidth = gvisionWidth;
        neuralNet = new NeuralNet(netToMutate, 1, p); //this one is for children
        int colorModify = 0;
        switch (PApplet.round(p.random(0, 2))) {
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
        if (PApplet.round(p.random(0, 1)) == 1) {
            creatureColor = gcolor + colorModify;
        } else {
            creatureColor = gcolor - colorModify;
        }
    }

    Creature(Map map, PApplet gp) {
        p = gp;
        int selX;
        int selY;
        do {
            selX = PApplet.round(p.random(0, map.mapHeight));
            selY = PApplet.round(p.random(0, map.mapWidth));
        } while (!map.tileMap[selX][selY].isWater);
        xPos = selX;
        yPos = selY;
        direction = PApplet.round(p.random(0, 3));
        hunger = -1;
        thirst = -1;
        int selVH;
        int selVW;
        do {
            selVH = CreatureSim.round(p.random(CreatureSim.minVisionHeight, CreatureSim.maxVisionHeight));
            selVW = CreatureSim.round(p.random(CreatureSim.minVisionWidth, CreatureSim.maxVisionWidth));
        } while (selVH % 2 != 1 & selVW % 2 != 1);
        vision = new float[selVH][selVW];
        visionHeight = selVH;
        visionWidth = selVW;
        neuralNet = new NeuralNet(20, CreatureSim.hiddenNNLayerSize, 10, CreatureSim.amountOfNNLinks, p);
        creatureColor = PApplet.round(p.random(0, 0xffffff));
    }

    void See() {
        for (int w = 0; w < visionWidth; w++) {
            for (int h = 0; h < visionHeight; h++) {
                switch (direction) {
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
