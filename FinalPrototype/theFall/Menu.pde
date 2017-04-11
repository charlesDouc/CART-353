//---------------------------------------------------------------
//-----------------------------CLASS-----------------------------
//---------------------------------------------------------------
class Menu {
  // Font variables
  PFont fontMenu;

  // Variable for the clipping effet
  boolean show;
  float flash;
  
  // Boolean to startLevel
  boolean startLevel;
  boolean firstPress;
  
  //--------------------------CONSTRUCTOR--------------------------
  Menu() {
    //Set font
    fontMenu = createFont("font/SourceCodePro-Bold.ttf", 16, true);
    
    // Set the startLevel
    startLevel = false;
    firstPress = true;
  }
  
  
  //----------------------------METHODS--------------------------
  
  // Method to launch the "first" menu
  void play() {
    // If start Level is true, start the level
    if (startLevel) {
      load_1.playFirst();
      
    // If not, display the menu
    } else {
      // Display the background
      background(0);
      
      // Set text align to center and the size
      textAlign(CENTER);
      fill(255);
      // Display the text
      textFont(fontMenu, 25);
      text("The Fall", width/2, height/2 - 25);
      textFont(fontMenu, 15);
      text("- Press Space to Start -", width/2, height/2);
    
      
      // If space bar is press and it's the first press
      if (keyPressed && key == 32 && firstPress) {
        startLevel = !startLevel;
        firstPress = !firstPress;
      }
    }
  }
}