package com.turtlestuff;

import processing.core.PApplet;

import java.util.ArrayList;

public class CreatureSim extends PApplet {
    public static void main(String[] args) {
        PApplet.main("com.turtlestuff.CreatureSim");
    }

    private final long rSeed = -1; //if -1 the pseudorandom seed will be set automagically,else, use the seed here
    private final long nSeed = -1; //ditto
    static final float howMuchFood = 5.3f; //maximum level for food spawnage
    private boolean shouldTick = false; //timer so we tick only every other frame
    private ArrayList<Creature> creatures = new ArrayList<Creature>();
    private NeuralNet testNet1;
    private NeuralNet testNet2;
    private Map map;
    private int stime;
    private int time;

    static final int minVisionHeight = 3;
    static final int minVisionWidth = 5;
    static final int maxVisionHeight = 7;
    static final int maxVisionWidth = 9;

    static final int hiddenNNLayerSize = 20;
    static final int amountOfNNLinks = 10;

    public void setup() {
        testNet1 = new NeuralNet(10, 10, 10, 2, this);
        testNet2 = new NeuralNet(testNet1, 1, this);

        if (rSeed != -1) {
            randomSeed(rSeed);
        }
        if (nSeed != -1) {
            noiseSeed(nSeed);
        }
        map = new Map(27, this);
        map.Generate(0.1f, 4);
        colorMode(HSB, 360, 100, 100);
        frameRate(30);
        surface.setResizable(true);

    }

    public void settings() {
        size(960, 540);

    }

    public void draw() {
        stime = millis();
        background(219, 58, 93);
        fill(0);
        rect(0, 0, height, height);
        textAlign(RIGHT, TOP);
        text(str(Math.round(frameRate)) + "FPS(" + time + "ms)", width - 2, 2);
        if (shouldTick) {
            map.TickAll();
        } else {
            shouldTick = true;
        }
        pushMatrix();
        map.Render();
        popMatrix();
        for (Creature c : creatures) {

        }
        time = millis() - stime;
    }

    public void mouseClicked() {
        try {
            println(map.tileMap[(int) (mouseX / map.scaling)][(int) (mouseY / map.scaling)].EatMe());
        } catch (ArrayIndexOutOfBoundsException e) {
            println(e);
        }
    }

}
