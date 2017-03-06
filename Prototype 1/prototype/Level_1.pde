class Level_1 {
  //--------------------------CONSTRUCTOR--------------------------
  Level_1() {
  }
  
  //----------------------------METHODS----------------------------
  
  // Method for creating prototype level
  void playPrototype() { 
    // Display Background -----------------------
    proto.display();
    
    // Display Platforms ------------------------
    displayArray(p_b1);
    displayArray(p_b2);
    
  }
 
  // Method to select block array and display it
  void displayArray(Block block[][]) {
    // Call the array
    for (int i = 0; i < block.length; i++) {
      for (int j = 0; j < block[0].length; j++) {
        // Display the block
        block[i][j].display();
      }
    }
  }
}


//---------------------------------------------------------------
//-----------------------GLOBAL VARIABLES------------------------
//---------------------------------------------------------------

// Prototype Level ------------------------
Block [][] p_b1;
Block [][] p_b2;