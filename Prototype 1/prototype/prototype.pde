
//---------------------------------------------------------------
//-----------------------------SETUP-----------------------------
//---------------------------------------------------------------
void setup() {
  fullScreen();
  
  gameSet = new System();
  level_1 = new Level_1();
  player = new Player();
}


//---------------------------------------------------------------
//-----------------------------DRAW------------------------------
//---------------------------------------------------------------
void draw() {
  background(255);
  
  level_1.playPrototype();
  player.display();
}


//---------------------------------------------------------------
//-----------------------GLOBAL VARIABLES------------------------
//---------------------------------------------------------------

System gameSet;
Level_1 level_1;
Player player;