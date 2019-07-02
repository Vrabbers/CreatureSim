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
    for (int y = 0; y < mapHeight; y++) {
      for (int x = 0; x < mapWidth; x++) {
        float currentNoise = noise(x*roughness, y*roughness)*10;
        tileMap[x][y] = new Tile(currentNoise, currentNoise<waterLevel);
        fill(map(currentNoise, 0, 10, 0, 255));
      }
      
    }
  }
  void TestRender(){
    float scaling = (float)height/mapHeight;
    noStroke();
    pushMatrix();
    for (int y = 0; y < mapHeight; y++) {
      for (int x = 0; x < mapWidth; x++) {
        if(!tileMap[x][y].isWater){
          fill(120, map(tileMap[x][y].theight, waterLvl, 8, 100, 0), map(tileMap[x][y].theight, waterLvl, 8, 80, 100));
        }else{
          fill(240, 100, 50);
        }
        rect(0,0,scaling,scaling);
        translate(scaling, 0 );
      }
      translate(-(scaling*mapWidth),scaling);
    }
    popMatrix();
  }
}
