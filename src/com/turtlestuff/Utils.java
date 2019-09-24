package com.turtlestuff;

public class Utils {
    static float sigmoid(float x) {
        return (float) (1 / (1 + Math.pow(Math.E, (-1 * x))));
    }
}
