class Setting {
  Setting() {
    //---------------------------------------------------------------
    //------------------------LEVELS SETUP---------------------------
    //---------------------------------------------------------------
    scenary = new Scenary();
    menu = new Menu();
    level_1 = new Level_1();
    level_2 = new Level_2();
    level_3 = new Level_3();
    level_1_Glitch = new Level_1_Glitch();
    level_4 = new Level_4();
    level_5 = new Level_5();
    level_6 = new Level_6();
    level_7 = new Level_7();
    level_1_Final = new Level_1_Final();
    
    
    //---------------------------------------------------------------
    //------------------------SCENES SETUP---------------------------
    //---------------------------------------------------------------
    sceneFallingInto = new fallingInto();
    load_1 = new FictualLoad();
    fakeMenu = new FictualMenu();
    
    
    //---------------------------------------------------------------
    //----------------------BACKGROUND SETUP-------------------------
    //---------------------------------------------------------------
    loadBG = new Background(0, 0, 0, 1, false);
    fakeMenuBG = new Background(0, 0, 1, 1, false);
    whiteGlitch = new Background(0, 0, 0, 3, false);
    level1BG = new Background(0, 0, 1, 1, false); 
    level2BG = new Background(0, 0, 1, 1, false); 
    level1gBG = new Background(0, 0, 1, 2, false);
    level4BG = new Background(width/2, 520, 2, 1, true);
    level5BG = new Background(0, 0, 2, 2, false);
    
    
    //---------------------------------------------------------------
    //----------------------PARTICLES SETUP--------------------------
    //---------------------------------------------------------------
    playerSprite = new ArrayList<particleSystem>();
    playerSprite.add(new particleSystem());
    
    particuleRAM = new ArrayList<particleSystem>();
    particuleRAM.add(new particleSystem());
    
        
    //---------------------------------------------------------------
    //-------------------------BLOCK SETUP---------------------------
    //---------------------------------------------------------------

    /* When creating a block object, here's the values to enter in */
    /* reference to createArray() :                                */
    /*                                                             */
    /* block = new Block[width][height]                            */
    /* createArray(block[][],     type, index)   */


    //-------------------------- LEVEL 1 --------------------------
    //-------- Platform 1 --------
    L1_b1 = new Block[8][3];    
    createArray(L1_b1, 1, 1);
    //-------- Platform 2 --------
    L1_b2 = new Block[7][2];    
    createArray(L1_b2, 1, 1);
    //-------- Platform 3 --------
    L1_b3 = new Block[2][3];    
    createArray(L1_b3, 1, 1);
    //-------- Platform 4 --------
    L1_b4 = new Block[5][4];    
    createArray(L1_b4, 1, 1);
    //-------- Platform 5 --------
    L1_b5 = new Block[6][2];    
    createArray(L1_b5, 1, 1);
    //-------- Platform 6 --------
    L1_b6 = new Block[4][3];    
    createArray(L1_b6, 1, 1);
    //-------- Platform 7 --------
    L1_b7 = new Block[2][4];    
    createArray(L1_b7, 1, 1);
    //-------- Platform 8 --------
    L1_b8 = new Block[4][5];    
    createArray(L1_b8, 1, 1);
    
    //-------------------------- LEVEL 2 --------------------------
    //-------- Platform 1 --------
    L2_b1 = new Block[7][6];    
    createArray(L2_b1, 1, 1);
    //-------- Platform 2 --------
    L2_b2 = new Block[3][4];    
    createArray(L2_b2, 1, 1);
    //-------- Platform 3 --------
    L2_b3 = new Block[2][3];    
    createArray(L2_b3, 1, 2);
    //-------- Platform 4 --------
    L2_b4 = new Block[3][4];    
    createArray(L2_b4, 1, 1);
    //-------- Platform 5 --------
    L2_b5 = new Block[2][3];    
    createArray(L2_b5, 1, 2);
    //-------- Platform 6 --------
    L2_b6 = new Block[7][4];    
    createArray(L2_b6, 1, 1);
    //-------- Platform 7 --------
    L2_b7 = new Block[3][3];    
    createArray(L2_b7, 1, 1);
    //-------- Platform 8 --------
    L2_b8 = new Block[4][4];    
    createArray(L2_b8, 1, 1);
    //-------- Platform 9 --------
    L2_b9 = new Block[2][3];    
    createArray(L2_b9, 1, 1);
    //-------- Platform 10 --------
    L2_b10 = new Block[4][2];    
    createArray(L2_b10, 1, 1);
    
    //-------------------------- LEVEL 3 --------------------------
    //-------- Platform 1 --------
    L3_b1 = new Block[3][2];    
    createArray(L3_b1, 1, 1);
    //-------- Platform 2 --------
    L3_b2 = new Block[3][3];    
    createArray(L3_b2, 1, 1);
    //-------- Platform 3 --------
    L3_b3 = new Block[4][4];    
    createArray(L3_b3, 1, 1);
    //-------- Platform 4 --------
    L3_b4 = new Block[2][5];    
    createArray(L3_b4, 1, 1);
    //-------- Platform 5 --------
    L3_b5 = new Block[4][3];    
    createArray(L3_b5, 1, 1);
    //-------- Platform 6 --------
    L3_b6 = new Block[3][5];    
    createArray(L3_b6, 1, 1);
    
    //-------------------------- LEVEL 1 GLITCH ------------------
    //-------- Platform 1 --------
    L1g_b1 = new Block[8][3];    
    createArray(L1g_b1, 1, 3);
    //-------- Platform 2 --------
    L1g_b2 = new Block[7][2];    
    createArray(L1g_b2, 1, 3);
    //-------- Platform 3 --------
    L1g_b3 = new Block[2][3];    
    createArray(L1g_b3, 1, 3);
    //-------- Platform 4 --------
    L1g_b4 = new Block[5][4];    
    createArray(L1g_b4, 1, 3);
    //-------- Platform 5 --------
    L1g_b5 = new Block[6][2];    
    createArray(L1g_b5, 1, 3);
    //-------- Platform 6 --------
    L1g_b6 = new Block[4][3];    
    createArray(L1g_b6, 1, 3);
    //-------- Platform 7 --------
    L1g_b7 = new Block[2][4];    
    createArray(L1g_b7, 1, 3);
    //-------- Platform 8 --------
    L1g_b8 = new Block[4][5];    
    createArray(L1g_b8, 1, 3);
    
    //-------------------------- LEVEL 4 ---------------------------
    //-------- Platform 1 --------
    L4_b1 = new Block[5][1];    
    createArray(L4_b1, 2, 1);
    //-------- Platform 2 --------
    L4_b2 = new Block[3][1];    
    createArray(L4_b2, 2, 2);
    //-------- Platform 3 --------
    L4_b3 = new Block[8][1];    
    createArray(L4_b3, 2, 2);
    //-------- Platform 4 --------
    L4_b4 = new Block[13][1];    
    createArray(L4_b4, 2, 2);
    //-------- Platform 5 --------
    L4_b5 = new Block[5][1];    
    createArray(L4_b5, 2, 2);
    //-------- Platform 6 --------
    L4_b6 = new Block[5][1];    
    createArray(L4_b6, 2, 2);
    //-------- Platform 7 --------
    L4_b7 = new Block[5][1];    
    createArray(L4_b7, 2, 2);
    //-------- Platform 8 --------
    L4_b8 = new Block[7][1];    
    createArray(L4_b8, 2, 2);
    
    //-------------------------- LEVEL 5 ---------------------------
    //-------- Platform 1 --------
    L5_b1 = new Block[5][1];    
    createArray(L5_b1, 2, 3);
    //-------- Platform 2 --------
    L5_b2 = new Block[5][1];    
    createArray(L5_b2, 2, 4);
    //-------- Platform 3 --------
    L5_b3 = new Block[8][1];    
    createArray(L5_b3, 2, 4);
    //-------- Platform 4 --------
    L5_b4 = new Block[3][1];    
    createArray(L5_b4, 2, 4);
    //-------- Platform 5 --------
    L5_b5 = new Block[3][1];    
    createArray(L5_b5, 2, 4);
    //-------- Platform 6 --------
    L5_b6 = new Block[3][1];    
    createArray(L5_b6, 2, 4);
    //-------- Platform 7 --------
    L5_b7 = new Block[10][1];    
    createArray(L5_b7, 2, 4);
    //-------- Platform 8 --------
    L5_b8 = new Block[5][1];    
    createArray(L5_b8, 2, 4);
    //-------- Platform 9 --------
    L5_b9 = new Block[5][1];    
    createArray(L5_b9, 2, 4);
    //-------- Platform 10 --------
    L5_b10 = new Block[5][1];    
    createArray(L5_b10, 2, 4);
    //-------- Platform 11 --------
    L5_b11 = new Block[5][1];    
    createArray(L5_b11, 2, 4);
    //-------- Platform 12 --------
    L5_b12 = new Block[6][1];    
    createArray(L5_b12, 2, 4);
    //-------- Platform 13 --------
    L5_b13 = new Block[5][1];    
    createArray(L5_b13, 2, 4);
    //-------- Platform 14 --------
    L5_b14 = new Block[3][1];    
    createArray(L5_b14, 2, 4);
    //-------- Platform 15 --------
    L5_b15 = new Block[50][1];    
    createArray(L5_b15, 2, 4);
    //-------- Platform 16 --------
    L5_b16 = new Block[1][1];    
    createArray(L5_b16, 2, 4);
    //-------- Platform 17 --------
    L5_b17 = new Block[2][1];    
    createArray(L5_b17, 2, 4);
    
    //-------------------------- LEVEL 6 ---------------------------
    //-------- Platform 1 --------
    L6_b1 = new Block[5][1];    
    createArray(L6_b1, 2, 3);
    //-------- Platform 2 --------
    L6_b2 = new Block[3][1];    
    createArray(L6_b2, 2, 4);
    //-------- Platform 3 --------
    L6_b3 = new Block[3][1];    
    createArray(L6_b3, 2, 4);
    //-------- Platform 4 --------
    L6_b4 = new Block[3][1];    
    createArray(L6_b4, 2, 4);
    //-------- Platform 5 --------
    L6_b5 = new Block[3][1];    
    createArray(L6_b5, 2, 4);
    //-------- Platform 6 --------
    L6_b6 = new Block[15][1];    
    createArray(L6_b6, 2, 3);
    //-------- Platform 7 --------
    L6_b7 = new Block[10][1];    
    createArray(L6_b7, 2, 3);
    //-------- Platform 8 --------
    L6_b8 = new Block[10][1];    
    createArray(L6_b8, 2, 3);
    //-------- Platform 9 --------
    L6_b9 = new Block[10][1];    
    createArray(L6_b9, 2, 3);
    //-------- Platform 10 --------
    L6_b10 = new Block[10][1];    
    createArray(L6_b10, 2, 3);
    //-------- Platform 11 --------
    L6_b11 = new Block[10][1];    
    createArray(L6_b11, 2, 3);
    //-------- Platform 12 --------
    L6_b12 = new Block[10][1];    
    createArray(L6_b12, 2, 3);
    //-------- Platform 13 --------
    L6_b13 = new Block[10][1];    
    createArray(L6_b13, 2, 3);
    //-------- Platform 14 --------
    L6_b14 = new Block[10][1];    
    createArray(L6_b14, 2, 3);
    //-------- Platform 15 --------
    L6_b15 = new Block[10][1];    
    createArray(L6_b15, 2, 3);
    //-------- Platform 16 --------
    L6_b16 = new Block[10][1];    
    createArray(L6_b16, 2, 3);
    //-------- Platform 17 --------
    L6_b17 = new Block[10][1];    
    createArray(L6_b17, 2, 3);
    //-------- Platform 18 --------
    L6_b18 = new Block[10][1];    
    createArray(L6_b18, 2, 3);
    //-------- Platform 19 --------
    L6_b19 = new Block[10][1];    
    createArray(L6_b19, 2, 3);
    //-------- Platform 20 --------
    L6_b20 = new Block[80][1];    
    createArray(L6_b20, 2, 3);
  
  //-------------------------- LEVEL 7 ---------------------------
  //-------- Platform 1 --------
  L7_b1 = new Block[5][1];    
  createArray(L7_b1, 2, 4);
  //-------- Platform 2 --------
  L7_b2 = new Block[5][1];    
  createArray(L7_b2, 2, 4);
  //-------- Platform 3 --------
  L7_b3 = new Block[5][1];    
  createArray(L7_b3, 2, 4);
  //-------- Platform 4 --------
  L7_b4 = new Block[5][1];    
  createArray(L7_b4, 2, 3);
  //-------- Platform 5 --------
  L7_b5 = new Block[20][20];    
  createArray(L7_b5, 2, 2);
  //-------- Platform 6 --------
  L7_b6 = new Block[20][20];    
  createArray(L7_b6, 2, 2);
  
 }



  //----------------------------METHODS----------------------------

  // Method to create an array (Block)
  void createArray(Block block[][], int type, int index) { 
    // Call all the array
    for (int i = 0; i < block.length; i++) {
      for (int j = 0; j < block[0].length; j++) {  
        // Chek if the object is a top one
        // object = new Block (x, y, level, index, top(t/f))
        if (j == 0) {
          block[i][j] = new Block(type, index, true);
        } else {
          block[i][j] = new Block(type, index, false);
        }
      }
    }
  }
}