class Map {
  Tile[][] tileMap;
  int mapWidth, mapHeight;
  float waterLvl;
  Map(int wid, int hei) {
    tileMap = new Tile[wid][hei];
    mapWidth = wid; 
    mapHeight = hei;
  }
  void Generate(float roughness, float waterLevel) {
    waterLvl = waterLevel;
    boolean hasAnyWater = false;
    for (int y = 0; y < mapHeight; y++) {
      for (int x = 0; x < mapWidth; x++) {
        float currentNoise = noise(x*roughness, y*roughness)*10;
        tileMap[x][y] = new Tile(currentNoise, currentNoise<waterLevel);
        hasAnyWater = hasAnyWater || currentNoise<waterLevel; //might do something a little more comlicated here later on
      }
    }
    if (!hasAnyWater) {
      println("trying again, the map has no water");
      noiseSeed((long)random(0, 1000000));
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
  void TestRender() {
    float scaling = (float)height/mapHeight;
    noStroke();
    pushMatrix();
    for (int y = 0; y < mapHeight; y++) {
      for (int x = 0; x < mapWidth; x++) {
        if (!tileMap[x][y].isWater) {
          fill(120, map(tileMap[x][y].theight, waterLvl, 8, 100, 0), map(tileMap[x][y].theight, waterLvl, 8, 80, 100));
        } else {
          fill(240, 100, 50);
        }
        rect(0, 0, scaling, scaling);
        if (tileMap[x][y].hasFood) {
          fill(138, 100, 55);
          ellipse(scaling/2, scaling/2, scaling*0.8, scaling*0.8);
        }
        translate(scaling, 0 );
      }
      translate(-(scaling*mapWidth), scaling);
    }
    popMatrix();
  }
}
