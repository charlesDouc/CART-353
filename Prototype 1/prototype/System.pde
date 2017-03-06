class System {
  System() {
    //---------------------------------------------------------------
    //----------------------BACKGROUND SETUP-------------------------
    //---------------------------------------------------------------

    proto = new Background(0, 0, 1, 1);

    //---------------------------------------------------------------
    //-------------------------BLOCK SETUP---------------------------
    //---------------------------------------------------------------

    /* When creating a block object, here's the values to enter in */
    /* reference to createArray() :                           */
    /*                                                             */
    /* block = new Block[width][height]                            */
    /* createArray(block[][],     x, y,     type)   */


    //----------------------- PROTOYPE LEVEL ------------------------
    //-------- Platform 1 --------
    p_b1 = new Block[25][6];    
    createArray(p_b1, 0, height - 300, 1);
    //-------- Platform 2 --------
    p_b2 = new Block[8][4];    
    createArray(p_b2, 400, height - 500, 1);
  }


  //----------------------------METHODS----------------------------

  // Method to create an array
  void createArray(Block block[][], int x, int y, int type) { 
    // Call all the array
    for (int i = 0; i < block.length; i++) {
      for (int j = 0; j < block[0].length; j++) {  
        // Chek if the object is a top one
        // object = new Block (x, y, level, index, top(t/f))
        if (j == 0) {
          block[i][j] = new Block(x + i*blockSize, y + j*blockSize, type, true);
        } else {
          block[i][j] = new Block(x + i*blockSize, y + j*blockSize, type, false);
        }
      }
    }
  }
}