package com.turtlestuff;

import processing.core.PApplet;

class Tile {
    PApplet p;
    float theight; //0-10; inverse of fertility
    float fertility; //calculated based on height
    boolean isWater;
    boolean canHaveFood;
    boolean hasFood; //currently
    int timerForFood; //if it is -1 it either already has food or has no food
    //decreases every tick, when is zero set hasFood to zero

    Tile(float givenHeight, boolean gisWater, PApplet gp) {
        p = gp;
        theight = givenHeight;
        isWater = gisWater;
        fertility = PApplet.map(theight, 0, 10, 10, 0);
        if (isWater) {
            canHaveFood = false;
            timerForFood = -1;
        } else {
            if (p.random(0, CreatureSim.howMuchFood) > theight) {
                canHaveFood = true;
                timerForFood = 10;
            } else {
                canHaveFood = false;
                timerForFood = -1;
            }
        }
    }

    void Tick() {
        if (canHaveFood & !hasFood) {
            timerForFood--;
            if (timerForFood == -1) {
                hasFood = true;
            }
        }
        //println(canHaveFood);
        //println(hasFood);
        //println(timerForFood);
    }

    boolean EatMe() {
        if (hasFood) {
            timerForFood = (int) CreatureSim.map(theight, 0, 10, 30, 300);
            hasFood = false;
            //println(canHaveFood);
            //println(hasFood);
            //println(timerForFood); //who needs debuggers when you can println
            return true;
        } else {
            return false;
        }
    }
}
