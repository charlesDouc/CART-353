//---------------------------------------------------------------
//-----------------------------CLASS-----------------------------
//---------------------------------------------------------------
class Level_3 {
  // Translate variable
  float valueX;

  // Font variables
  PFont fontLevel;

  // Platforms' location in PVector
  PVector Platform1;
  PVector Platform2;
  PVector Platform3;
  PVector Platform4;
  PVector Platform5;
  PVector Platform6;
  
  // Boolean to startLevel
  boolean startLevel;
  
  // Float variables for the timer
  float currentTime;
  float initialTime;
  // boolean to start glitch
  boolean glitch;
  boolean glitchEffect;


  //--------------------------CONSTRUCTOR--------------------------
  Level_3() {
    valueX = 0.0;

    // Font variables
    fontLevel = createFont("font/SourceCodePro-Bold.ttf", 16, true);

    // Initialize Platform' location
    Platform1 = new PVector(400, height - blockSize*2);
    Platform2 = new PVector(Platform1.x + blockSize*3, height - blockSize*3);
    Platform3 = new PVector(Platform2.x + blockSize*3, height - blockSize*4);
    Platform4 = new PVector(Platform3.x + blockSize*4, height - blockSize*5);
    Platform5 = new PVector(Platform4.x + blockSize*2, height - blockSize*3);
    Platform6 = new PVector(Platform5.x + blockSize*4, height - blockSize*5);


    // Initialize the player and starting position
    player_lvl3 = new Player(new PVector(450, Platform1.y - 50), 1);
    
    // Initialize booleans
    startLevel = true;
    glitch = false;
    glitchEffect = false;
  }

  //----------------------------METHODS----------------------------

  // Method for creating first level ------------------------------
  void play() { 
    if (startLevel) {
      // Display Background ...............
      level1BG.display();
  
      // Scroll the level (if)............
      scrollPlatform();
  
      // Display Platforms ................
      displayArray(L3_b1, Platform1);
      displayArray(L3_b2, Platform2);
      displayArray(L3_b4, Platform4);
      displayArray(L3_b3, Platform3);
      displayArray(L3_b5, Platform5);
      displayArray(L3_b6, Platform6);
  
      // Check the position of ............
      // the player            
      player_lvl3.chekPlatform(L3_b1);
      player_lvl3.chekPlatform(L3_b2);
      player_lvl3.chekPlatform(L3_b3);
      player_lvl3.chekPlatform(L3_b4);
      player_lvl3.chekPlatform(L3_b5);
      player_lvl3.chekPlatform(L3_b6);
  
  
      // Scenary BEHIND ...................
      // the player     
      scenary.displayTree(new PVector(Platform2.x + 100, Platform2.y));
      scenary.displayTree(new PVector(Platform3.x + 100, Platform3.y));
  
      // Display the player ...............
      player_lvl3.display();   
  
      // Scenary IN FRONT of ..............
      // the player    
      scenary.displayFlower(new PVector(Platform1.x + 100, Platform1.y));
      scenary.displayFlower(new PVector(Platform1.x + 200, Platform1.y));
      scenary.displayFlower(new PVector(Platform3.x + 50, Platform3.y));
      scenary.displayFlower(new PVector(Platform5.x + 300, Platform5.y));
      scenary.displayFlower(new PVector(Platform5.x + 325, Platform5.y));
      
      // Check Status ....................
      if (isDead()) {
        gameOver();
      }
      if (crash()) {
      // sounds -----------------------
      if (!glitchEffect) {
        lv1_music.stop();
        //glitchSound.play();
        glitchEffect = true;
      }
        cancelInput = true;
        startGlitch();
      } else {
        cancelInput = false;
      }
    } else {
      load_1.playSecond();
    }
  }


  // Method to select block array and display it ----------------
  void displayArray(Block block[][], PVector location) {
    // Call the array
    for (int i = 0; i < block.length; i++) {
      for (int j = 0; j < block[0].length; j++) {
        // Display the block
        block[i][j].display(new PVector(location.x + i*blockSize, location.y + j*blockSize));
      }
    }
  }


  // Method to chekEdges and move the scene --------------------
  void scrollPlatform() {
    // If the player is on the right edge of the screen
    if (player_lvl3.location.x >= width - valueX - 400) {
      // Rearrange valueX (-)
      valueX -= 7;
    }
    // If the player is on the left edge of the screen
    if (player_lvl3.location.x <= 0 - valueX + 400) {
      // Rearrange valueX (+)
      valueX += 7;
    }
    // Change the parameter of translate with new valueX
    translate(valueX, 0);
  }


  // Method to activate gameOver ------------------------------
  void gameOver() {
    // Reset the matrix for the text
    resetMatrix();
    
    // Set text align to center and the size
    textAlign(CENTER);
    textFont(fontLevel, 75);
    fill(255, 0, 0);
    // Display the text
    text("GAME OVER", width/2, height/2 - 100);
    // Set text align to center and the size
    textFont(fontLevel, 25);
    fill(0);
    // Display the text
    text("- Press Space to Restart -", width/2, height/2 - 50);
    
    // If space is hit, reset the player's position
    if (key == 32) {
      player_lvl3.location = new PVector(450, Platform1.y - 150);
    }
  }
  
  
  // Method to start the glitch -------------------------------
  void startGlitch() {
    // Stop the player
    player_lvl3.stopPlayer();
    
    // Chek if the scene starts
    if (!glitch) {
      // Set the initial time and change the start status
      initialTime = millis();
      glitch = true;
    }
    
    // Set the timer to 0
    currentTime = millis() - initialTime;
    resetMatrix();
    noStroke();
    
    // ANIMATION SETUP --------------
    if (currentTime < 8000) { 
      // bar 1 Activation .......
      if (currentTime > 5000) {
      // Display ddc logo
        whiteGlitch.display();
      }
      // bar 2 Activation .......
      if (currentTime > 7000) {
      // Display ddc logo
        background(0);
      }
    } else {
      startLevel = !startLevel;
    }
  }
  


  // Boolean to check if the player is dead -------------------
  boolean isDead() {
    // If the player fall
    if (player_lvl3.location.y > height &&
      player_lvl3.location.x < Platform6.x + blockSize*4) {
      // Return true
      return true;
    } else {
      return false;
    }
  }
  
  
  // Boolean to check if the player start the glitch --------
  boolean crash() {
    // If the player fall
    if (player_lvl3.location.x > Platform5.x + 75) {
      // Return true
      return true;
    } else {
      return false;
    }
  }
}


//---------------------------------------------------------------
//-----------------------GLOBAL VARIABLES------------------------
//---------------------------------------------------------------

// The platforms
Block [][] L3_b1;
Block [][] L3_b2;
Block [][] L3_b3;
Block [][] L3_b4;
Block [][] L3_b5;
Block [][] L3_b6;

// The background
Background level3BG;
Background whiteGlitch;
// The Player
Player player_lvl3;