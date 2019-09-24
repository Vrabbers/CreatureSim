package com.turtlestuff;

import processing.core.PApplet;

import static processing.core.PApplet.minute;

class Map {
    PApplet p;
    Tile[][] tileMap;
    int mapWidth, mapHeight;
    float waterLvl;
    float scaling;

    Map(int size, PApplet gp) {
        p = gp;
        tileMap = new Tile[size][size];
        mapWidth = size;
        mapHeight = size;
    }

    void Generate(float roughness, float waterLevel) {
        waterLvl = waterLevel;
        boolean hasAnyWater = false;
        for (int y = 0; y < mapHeight; y++) {
            for (int x = 0; x < mapWidth; x++) {
                float currentNoise = p.noise(x * roughness, y * roughness) * 10;
                tileMap[x][y] = new Tile(currentNoise, currentNoise < waterLevel, p);
                hasAnyWater = hasAnyWater || currentNoise < waterLevel; //might do something a little more comlicated here later on
            }
        }
        if (!hasAnyWater) {
            PApplet.println("trying again, the map has no water");
            p.noiseSeed(PApplet.hour() + PApplet.day() + PApplet.second() + minute() + p.millis());
            Generate(roughness, waterLevel);
        }
    }

    void TickAll() {
        for (int y = 0; y < mapHeight; y++) {
            for (int x = 0; x < mapWidth; x++) {
                tileMap[x][y].Tick();
            }
        }
    }

    void Render() {
        scaling = (float) p.height / mapHeight;
        p.noStroke();
        p.pushMatrix();
        for (int y = 0; y < mapHeight; y++) {
            for (int x = 0; x < mapWidth; x++) {
                if (!tileMap[x][y].isWater) {
                    p.fill(90, PApplet.map(tileMap[x][y].theight, waterLvl, 8, 100, 0), PApplet.map(tileMap[x][y].theight, waterLvl, 8, 80, 100));
                } else {
                    p.fill(215, 100, p.map(tileMap[x][y].theight, waterLvl, 0, 80, 50));
                }
                p.rect(0, 0, scaling, scaling);
                if (tileMap[x][y].hasFood) {
                    p.fill(138, 100, 55);
                    p.ellipse(scaling / 2, scaling / 2, scaling * 0.6f, scaling * 0.6f);
                }
                p.translate(scaling, 0);
            }
            p.popMatrix();
            p.translate(0, scaling);
            p.pushMatrix();
        }
        p.popMatrix();
    }
}
