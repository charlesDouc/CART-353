//---------------------------------------------------------------
//-----------------------------CLASS-----------------------------
//---------------------------------------------------------------
class Level_1_Final {
  // Translate variable
  float valueX;
  float valueY;

  // Font variables
  PFont fontLevel;
  PFont credit;

  // Platforms' location in PVector
  PVector Platform1;
  PVector Platform2;
  PVector Platform3;
  PVector Platform4;
  PVector Platform5;
  PVector Platform6;
  PVector Platform7;
  PVector Platform8;
  
  // Float variables for the timer
  float currentTime;
  float initialTime;
  boolean startTimer;
  boolean beginEnd;
  float alpha;
  
  // Boolean to startLevel
  boolean startLevel;
  boolean dieSound;

  //--------------------------CONSTRUCTOR--------------------------
  Level_1_Final() {
    valueX = 0.0;
    valueY = 0.0;
    alpha = 0.0;

    // Font variables
    fontLevel = createFont("font/SourceCodePro-Bold.ttf", 16, true);
    credit = createFont("font/SourceCodePro-Bold.ttf", 16, true);

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
    player_lvl1_final = new Player(new PVector(385, Platform1.y - 50), 2);
    
    startLevel = true;
    beginEnd = false;
    dieSound = false;
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
      displayArray(L1_b1, Platform1);
      displayArray(L1_b2, Platform2);
      displayArray(L1_b4, Platform4);
      displayArray(L1_b3, Platform3);
      displayArray(L1_b5, Platform5);
      displayArray(L1_b6, Platform6);
      displayArray(L1_b7, Platform7);
      displayArray(L1_b8, Platform8);
  
      // Check the position of ............
      // the player            
      player_lvl1_final.chekPlatform(L1_b1);
      player_lvl1_final.chekPlatform(L1_b2);
      player_lvl1_final.chekPlatform(L1_b3);
      player_lvl1_final.chekPlatform(L1_b4);
      player_lvl1_final.chekPlatform(L1_b5);
      player_lvl1_final.chekPlatform(L1_b6);
      player_lvl1_final.chekPlatform(L1_b7);
      player_lvl1_final.chekPlatform(L1_b8);
  
      // Scenary BEHIND ...................
      // the player     
      scenary.displayTree(new PVector(Platform1.x + 500, Platform1.y));
      scenary.displayTree(new PVector(Platform2.x + 400, Platform2.y));
      scenary.displayTree(new PVector(Platform4.x + 300, Platform4.y));
      scenary.displayTree(new PVector(Platform6.x + 100, Platform6.y));
      scenary.displayWinPanel(new PVector(Platform8.x + 200, Platform8.y));
  
      // Display the player ...............
      player_lvl1_final.display();  
      player_lvl1_final.smileFace();
  
      // Scenary IN FRONT of ..............
      // the player    
      scenary.displayFlower(new PVector(Platform1.x + 100, Platform1.y));
      scenary.displayFlower(new PVector(Platform1.x + 250, Platform1.y));
      scenary.displayFlower(new PVector(Platform1.x + 275, Platform1.y));
      scenary.displayFlower(new PVector(Platform1.x + 300, Platform1.y));
      scenary.displayFlower(new PVector(Platform3.x + 50, Platform3.y));
      scenary.displayFlower(new PVector(Platform5.x + 500, Platform5.y));
      scenary.displayFlower(new PVector(Platform5.x + 525, Platform5.y));
      scenary.displayFlower(new PVector(Platform8.x + 125, Platform8.y));
      
      // Check Status ....................
      if (isDead()) {
        gameOver();
      }
      if (win()) {
        if (!dieSound) {
          corruptedSound.play();
          dieSound = true;
        }
        endTitle();
      }
    } else {
      background(0);
      setup();
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
    if (player_lvl1_final.location.x >= width - valueX - 400  && !beginEnd) {
      // Rearrange valueX (-)
      valueX -= 7;
    }
    // If the player is on the left edge of the screen
    if (player_lvl1_final.location.x <= 0 - valueX + 400   && !beginEnd) {
      // Rearrange valueX (+)
      valueX += 7;
    }
    if (beginEnd) {
      valueY += 2;
    }
    // Change the parameter of translate with new valueX
    translate(valueX, valueY);
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
      player_lvl1.location = new PVector(385, Platform1.y - 150);
    }
  }
  
  
  // Method to activate the end title --------------------------
  void endTitle() {
    // SET THE TIMER
    if (!startTimer) {
      // Set the initial time and change the start status
      initialTime = millis();
      startTimer = true;
    }    
    // Set the timer to 0
    currentTime = millis() - initialTime;
    
    if (currentTime > 3000 && currentTime < 10000) {
      beginEnd = true;
    }
    
    if (currentTime > 10000 &&  currentTime < 14000) {
      // Reset the matrix for the text
      resetMatrix();   
      // Set text align to center and the size
      textAlign(CENTER);
      textFont(credit, 75);
      fill(0);
      // Display the text
      text("The Fall", width/2, height/2 - 100);
      // Set text align to center and the size
      textFont(credit, 25);
      fill(255);
      // Display the text
      text("by Charles Doucet", width/2, height/2 - 50);
    }  
    if (currentTime > 16000 &&  currentTime < 21000) {
      // Reset the matrix for the text
      resetMatrix();   
      // Set text align to center and the size
      textAlign(CENTER);
      textFont(credit, 50);
      fill(0);
      // Display the text
      text("Musics", width/2, height/2 - 100);
      // Set text align to center and the size
      textFont(credit, 25);
      fill(255);
      // Display the text
      text("'Honjou Oiwake (Instrumental)' by Omodaka", width/2, height/2 - 50);
      text("'Panacea' by Disasterpeace", width/2, height/2 - 20);
      text("'Chimp Rave' by Manu Delago", width/2, height/2 + 10);
    }
    if (currentTime > 23000) {
      resetMatrix();   
      fill(0, alpha);
      if (alpha < 255) {
        alpha += 5;
      }
      rect(0, 0, width, height);
    }
    if (currentTime > 24500) {
      startLevel =!startLevel;
    }
  }


  // Boolean to check if the player is dead -------------------
  boolean isDead() {
    // If the player fall
    if (player_lvl1_final.location.y > height &&
      player_lvl1_final.location.x < Platform8.x + blockSize*4) {
      // Return true
      return true;
    } else {
      return false;
    }
  }


  // Boolean to check if the player win -------------------
  boolean win() {
    // If the player fall
    if (player_lvl1_final.location.y > height &&
        player_lvl1_final.location.x > Platform8.x) {
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


// The Player
Player player_lvl1_final;