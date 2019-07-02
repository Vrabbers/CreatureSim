class Tile {
  float theight; //0-10; inverse of fertility
  float fertility; //calculated based on height
  boolean isWater;
  boolean canHaveFood;
  boolean hasFood; //currently
  int timerForFood; //if it is -1 it either already has food or has no food
  //decreases every tick, when is zero set hasFood to zero

  Tile(float givenHeight, boolean gisWater) {
    theight  = givenHeight;
    isWater = gisWater;
    fertility = map(theight, 0, 10, 10, 0);
    if (isWater) {
      canHaveFood = false;
      timerForFood = -1;
    } else {
      if (random(0, 10) < fertility) {
        canHaveFood = true;
        timerForFood = (int)map(fertility, 0, 10, 1, 50);
      } else {
        canHaveFood = false;
        timerForFood = -1;
      }
    }
  }

  void Tick() {
    if(canHaveFood & !hasFood){
      timerForFood--;
      if (timerForFood == -1){
        hasFood = true;
      }

    }
    println(canHaveFood);
    println(hasFood);
    println(timerForFood);  
  }
}
