//---------------------------------------------------------------
//-----------------------------CLASS-----------------------------
//---------------------------------------------------------------
class FictualMenu {
  // PImage for the title
  PImage title1;
  PImage title2;
  
  // Font variables
  PFont fontStart;

  // Variable for the clipping effet
  boolean show;
  float flash;
  
  // Boolean to startLevel
  boolean startLevel;
  boolean startLevelSecond;
  boolean firstPress;
  boolean secondPress;
  
  //--------------------------CONSTRUCTOR--------------------------
  FictualMenu() {
    // Load image for the title
    title1 = loadImage("gameWorld/title1.png");
    title2 = loadImage("gameWorld/title2.png");
    
    //Set font
    fontStart = createFont("font/SourceCodePro-Bold.ttf", 16, true);
    
    // Set the clipping effect 
    flash = 0;
    show = false;
    
    // Set the startLevel
    startLevel = false;
    firstPress = true;
    startLevelSecond = false;
    secondPress = true;
  }
  
  
  //----------------------------METHODS--------------------------
  
  // Method to launch the "first" menu
  void playFirst() {
    // If start Level is true, start the level
    if (startLevel) {
      level_1.play();
      
    // If not, display the menu
    } else {
      // Display the background
      fakeMenuBG.display();
      
      // Set imageMode to Center and siplay it
      imageMode(CENTER);
      image(title1, width/2, 385);
      // Reset mode to default
      imageMode(CORNER);
      
      // Activate the click effect
      flash ++;
      if (flash % 40 == 1) {
        show = !show;
      }
      
      // Display the - Press Start - text 
      if (show) {
        // Set text align to center and the size
        textAlign(CENTER);
        textFont(fontStart, 25);
        fill(25);
        // Display the text
        text("- Press Space to Start -", width/2, 525);
      }
      
      // If space bar is press and it's the first press
      if (keyPressed && key == 32 && firstPress) {
        startLevel = !startLevel;
        // Noise for start
        startButton.play();
        firstPress = !firstPress;
      }
    }
  }
  
  // Method to launch the "second" menu
  void playSecond() {
    // If start Level is true, start the level
    if (startLevelSecond) {
      level_1_Glitch.play();
      
    // If not, display the menu
    } else {
      // Display the background
      whiteGlitch.display();
      
      // Set imageMode to Center and siplay it
      imageMode(CENTER);
      image(title2, width/2, 385);
      // Reset mode to default
      imageMode(CORNER);
      
      // Activate the click effect
      flash ++;
      if (flash % 40 == 1) {
        show = !show;
      }
      
      // Display the - Press Start - text 
      if (show) {
        // Set text align to center and the size
        textAlign(CENTER);
        textFont(fontStart, 25);
        fill(25);
        // Display the text
        text("- Pr\3ss Sp4ce t0 St4r#t?? -", width/2, 525);
      }
      
      // If space bar is press and it's the first press
      if (keyPressed && key == 32 && secondPress) {
        startLevelSecond = !startLevelSecond;
        // Noise for start
        startButton.play();
        secondPress = !secondPress;
      }
    }
  }
}


//---------------------------------------------------------------
//-----------------------GLOBAL VARIABLES------------------------
//---------------------------------------------------------------

// The background
Background fakeMenuBG;