//---------------------------------------------------------------
//-----------------------------CLASS-----------------------------
//---------------------------------------------------------------
class Level_1_Glitch {
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
  PVector Platform7;
  PVector Platform8;

  // Boolean to startLevel
  boolean startLevel;

  // Float variables for the timer
  float currentTime;
  float initialTime;
  // boolean to start glitch
  boolean glitch;
  boolean playMusic;
  boolean glitchEffect;

  //--------------------------CONSTRUCTOR--------------------------
  Level_1_Glitch() {
    valueX = 0.0;

    // Font variables
    fontLevel = createFont("font/SourceCodePro-Bold.ttf", 16, true);

    // Initialize Platform' location
    Platform1 = new PVector(200, height - blockSize*3);
    Platform2 = new PVector(Platform1.x + blockSize*8, height - blockSize*2);
    Platform3 = new PVector(Platform2.x + blockSize*7, height - blockSize*3);
    Platform4 = new PVector(Platform2.x + blockSize*9, height - blockSize*4);
    Platform5 = new PVector(Platform4.x + blockSize*5, height - blockSize*2);
    Platform6 = new PVector(Platform5.x + blockSize*6, height - blockSize*3);
    Platform7 = new PVector(Platform6.x + blockSize*4, height - blockSize*4);
    Platform8 = new PVector(Platform7.x + blockSize*2, height - blockSize*5);

    // Initialize the player and starting position
    player_lvl1g = new Player(new PVector(385, Platform1.y - 50), 2);

    // Initialize booleans
    startLevel = true;
    glitch = false;
    playMusic = false;
    glitchEffect = false;
  }

  //----------------------------METHODS----------------------------

  // Method for creating first level ------------------------------
  void play() { 
    if (startLevel) {
      // Display Background ...............
      level1gBG.display();
      
      // Music in the level ...............
      if (!playMusic) {
        lv1g_music.play();
        playMusic = true;
      }

      // Scroll the level (if)............
      scrollPlatform();

      // Display Platforms ................
      displayArray(L1g_b1, Platform1);
      displayArray(L1g_b2, Platform2);
      displayArray(L1g_b4, Platform4);
      displayArray(L1g_b3, Platform3);
      displayArray(L1g_b5, Platform5);
      displayArray(L1g_b6, Platform6);
      displayArray(L1g_b7, Platform7);
      displayArray(L1g_b8, Platform8);

      // Check the position of ............
      // the player            
      player_lvl1g.chekPlatform(L1g_b1);
      player_lvl1g.chekPlatform(L1g_b2);
      player_lvl1g.chekPlatform(L1g_b3);
      player_lvl1g.chekPlatform(L1g_b4);
      player_lvl1g.chekPlatform(L1g_b5);
      player_lvl1g.chekPlatform(L1g_b6);
      player_lvl1g.chekPlatform(L1g_b7);
      player_lvl1g.chekPlatform(L1g_b8);

      // Scenary BEHIND ...................
      // the player     
      scenary.displayTreeGlitch(new PVector(Platform1.x + 500, Platform1.y));
      scenary.displayTreeGlitch(new PVector(Platform2.x + 400, Platform2.y));
      scenary.displayTreeGlitch(new PVector(Platform4.x + 300, Platform4.y));
      scenary.displayTreeGlitch(new PVector(Platform6.x + 100, Platform6.y));
      scenary.displayWinPanel(new PVector(Platform8.x + 200, Platform8.y));

      // Display the player ...............
      player_lvl1g.display();   

      // Scenary IN FRONT of ..............
      // the player    
      scenary.displayFlowerGlitch(new PVector(Platform1.x + 100, Platform1.y));
      scenary.displayFlowerGlitch(new PVector(Platform1.x + 250, Platform1.y));
      scenary.displayFlowerGlitch(new PVector(Platform1.x + 275, Platform1.y));
      scenary.displayFlowerGlitch(new PVector(Platform1.x + 300, Platform1.y));
      scenary.displayFlowerGlitch(new PVector(Platform3.x + 50, Platform3.y));
      scenary.displayFlowerGlitch(new PVector(Platform5.x + 500, Platform5.y));
      scenary.displayFlowerGlitch(new PVector(Platform5.x + 525, Platform5.y));
      scenary.displayFlowerGlitch(new PVector(Platform8.x + 125, Platform8.y));

      // Check Status ....................
      if (isDead()) {
        gameOver();
      }
      if (fall()) {
        cancelInput = true;
        startFalling();
      } else {
        cancelInput = false;
      }
    // END OF LEVEL
    } else {
      cancelInput = false;
      level_4.play();
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
    if (player_lvl1g.location.x >= width - valueX - 400) {
      // Rearrange valueX (-)
      valueX -= 7;
    }
    // If the player is on the left edge of the screen
    if (player_lvl1g.location.x <= 0 - valueX + 400) {
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
      player_lvl1g.location = new PVector(385, Platform1.y - 50);
    }
  }


  // Method to activate the falling scene --------------------------
  void startFalling() {
    // Stop the movment of the player
    player_lvl1g.stopPlayer();
    // Display the animation from the scene
    sceneFallingInto.play();
    // If the scene is finished, stop the level
    if (sceneFallingInto.finished()) {
      startLevel = !startLevel;
    }
  }


  // Boolean to check if the player is dead -------------------
  boolean isDead() {
    // If the player fall
    if (player_lvl1g.location.y > height &&
      player_lvl1g.location.x < Platform8.x + blockSize*4) {
      // Return true
      return true;
    } else {
      return false;
    }
  }


  // Boolean to check if the player win -------------------
  boolean fall() {
    // If the player fall
    if (player_lvl1g.location.y > height - 400 &&
      player_lvl1g.location.x > Platform8.x) {
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
Block [][] L1g_b1;
Block [][] L1g_b2;
Block [][] L1g_b3;
Block [][] L1g_b4;
Block [][] L1g_b5;
Block [][] L1g_b6;
Block [][] L1g_b7;
Block [][] L1g_b8;

// The background
Background level1gBG;
// The Player
Player player_lvl1g;