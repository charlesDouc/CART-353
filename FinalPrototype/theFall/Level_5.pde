//---------------------------------------------------------------
//-----------------------------CLASS-----------------------------
//---------------------------------------------------------------
class Level_5 {
  // Translate variable and fade
  float valueX;
  int alpha;
  float newOrigin;
  float edgePos;
  float rightEdge;

  // Font variables
  PFont dialogueDD;

  // Platforms' location in PVector
  PVector Platform1;
  PVector Platform2;
  PVector Platform3;
  PVector Platform4;
  PVector Platform5;
  PVector Platform6;
  PVector Platform7;
  PVector Platform8;
  PVector Platform9;
  PVector Platform10;
  PVector Platform11;
  PVector Platform12;
  PVector Platform13;
  PVector Platform14;
  PVector Platform15;
  PVector Platform16;
  PVector Platform17;


  // Boolean to startLevel
  boolean startLevel;
  boolean playMusic;
  boolean beepEffect1;
  boolean beepEffect2;
  boolean beepEffect3;
  boolean beepEffect4;

  // Float variables for the timer
  float currentTime;
  float initialTime;
  boolean startTimer;

  // Controlling the particles
  float recurence;

  // Images Variables
  PImage welcome;
  PImage error;
  PImage edge;

  //--------------------------CONSTRUCTOR--------------------------
  Level_5() {
    valueX = 0.0;
    recurence = 0.0;
    alpha = 255;
    newOrigin = 0.0;
    edgePos = 0 - 560;
    rightEdge = width;

    // Font variables
    dialogueDD = createFont("font/SourceCodePro-Bold.ttf", 16, true);

    // Initialize Platform' location
    Platform1 = new PVector(width/2 - 225, height - blockSize*3);
    Platform2 = new PVector(Platform1.x + 7*blockSize, height - blockSize*3);
    Platform3 = new PVector(Platform2.x + 5*blockSize, height - blockSize*4);
    Platform4 = new PVector(Platform3.x + 10*blockSize, height - blockSize*4);
    Platform5 = new PVector(Platform4.x + 5*blockSize, height - blockSize*4);
    Platform6 = new PVector(Platform5.x + 5*blockSize, height - blockSize*4);
    Platform7 = new PVector(Platform6.x + 5*blockSize, height - blockSize*4);
    Platform8 = new PVector(Platform7.x + 12*blockSize, height - blockSize*2);
    Platform9 = new PVector(Platform8.x + 5*blockSize, height - blockSize*3);
    Platform10 = new PVector(Platform9.x + 7*blockSize, height - blockSize*3);
    Platform11 = new PVector(Platform10.x + 5*blockSize, height - blockSize*4);
    Platform12 = new PVector(Platform11.x + 7*blockSize, height - blockSize*4);
    Platform13 = new PVector(Platform12.x + 6*blockSize, height - blockSize*3);
    Platform14 = new PVector(Platform13.x + 7*blockSize, height - blockSize*3);
    Platform15 = new PVector(Platform14.x + 5*blockSize, height - blockSize*3);
    Platform16 = new PVector(Platform5.x + blockSize, height - blockSize*6);
    Platform17 = new PVector(Platform9.x - blockSize, height - blockSize*6);

    // Initialize the player and starting position
    player_lvl5 = new Player(new PVector(Platform1.x + 225, 0 - 150), 2);

    // Initialize boolean
    startLevel = true;
    startTimer = false;
    playMusic = false;
    beepEffect1 = false;
    beepEffect2 = false;
    beepEffect3 = false;
    beepEffect4 = false;

    // Image initialization
    welcome = loadImage("computerWorld/welcome.png");
    error = loadImage("load/error.png");
    edge = loadImage("computerWorld/hub2.png");
  }

  //----------------------------METHODS----------------------------

  // Method for creating first level ------------------------------
  void play() {      
    if (startLevel) {
      // Display Background ...............
      level5BG.display();


      // Chek if the timer starts...................................
      if (!startTimer) {
        // Set the initial time and change the start status
        initialTime = millis();
        lv4_music.stop();
        lv5_musicStart.play();
        startTimer = true;
      }    
      // Set the timer to 0
      currentTime = millis() - initialTime;
      // ...........................................................

      // Music in the level ...............
      if (currentTime > 16000  && !playMusic) {
        lv5_music.play();
        playMusic = true;
      }

      // Scroll the level (if)............
      scrollPlatform();

      // Display Platforms ................
      displayArray(L5_b1, Platform1);
      if (currentTime > 16000  &&   currentTime < 58000) {
        displayArray(L5_b2, Platform2);
        displayArray(L5_b3, Platform3);
        displayArray(L5_b4, Platform4);
        displayArray(L5_b5, Platform5);
        displayArray(L5_b6, Platform6);
        displayArray(L5_b7, Platform7);
        displayArray(L5_b8, Platform8);
        displayArray(L5_b9, Platform9);
        displayArray(L5_b10, Platform10);
        displayArray(L5_b11, Platform11);
        displayArray(L5_b12, Platform12);
        displayArray(L5_b13, Platform13);
        displayArray(L5_b14, Platform14);
        displayArray(L5_b15, Platform15);
        displayArray(L5_b16, Platform16);
        displayArray(L5_b17, Platform17);
      }

      // Check the position of ............
      // the player  
      player_lvl5.chekPlatform(L5_b1);
      if (currentTime > 16000  &&   currentTime < 58000) {
        player_lvl5.chekPlatform(L5_b2);
        player_lvl5.chekPlatform(L5_b3);
        player_lvl5.chekPlatform(L5_b4);
        player_lvl5.chekPlatform(L5_b5);
        player_lvl5.chekPlatform(L5_b6);
        player_lvl5.chekPlatform(L5_b7);
        player_lvl5.chekPlatform(L5_b8);
        player_lvl5.chekPlatform(L5_b9);
        player_lvl5.chekPlatform(L5_b10);
        player_lvl5.chekPlatform(L5_b11);
        player_lvl5.chekPlatform(L5_b12);
        player_lvl5.chekPlatform(L5_b13);
        player_lvl5.chekPlatform(L5_b14);
        player_lvl5.chekPlatform(L5_b15);
      }

      // Scenary BEHIND ...................
      // the player    
      imageMode(CENTER);
      image(welcome, width/2, height - blockSize*7);
      imageMode(CORNER);
      // Error Messages
      if (currentTime > 8000) {
        // Do a beep sound
        if (!beepEffect1) {
          beep.play();
          beepEffect1 = true;
        }
        image(error, 50, 50);
      }
      if (currentTime > 8500) {
        // Do a beep sound
        if (!beepEffect2) {
          beep.play();
          beepEffect2 = true;
        }
        image(error, 50, 310);
      }
      if (currentTime > 9000) {
        // Do a beep sound
        if (!beepEffect3) {
          beep.play();
          beepEffect3 = true;
        }
        image(error, 50, 570);
      }
      if (currentTime > 9500) {
        // Do a beep sound
        if (!beepEffect4) {
          beep.play();
          beepEffect4 = true;
        }
        image(error, 50, 830);
      }
      if (currentTime > 16000  &&  currentTime < 58000) {
        image(error, Platform16.x + 30, Platform16.y - 150);
        image(error, Platform17.x+ 30, Platform17.y - 150);
        scenary.displayLineTreeReverse(new PVector(Platform2.x + 50, Platform2.y), 2);
        scenary.displayLineTreeReverse(new PVector(Platform3.x + 150, Platform3.y), 1);
        scenary.displayLineTreeReverse(new PVector(Platform3.x + 350, Platform3.y), 3);
        scenary.displayLineTreeReverse(new PVector(Platform3.x + 600, Platform3.y), 1);
        scenary.displayLineTreeReverse(new PVector(Platform4.x + 25, Platform4.y), 2);
        scenary.displayLineTreeReverse(new PVector(Platform5.x + 50, Platform5.y), 1);
        scenary.displayFlynn(new PVector(Platform7.x + 200, Platform7.y - 359));
        scenary.displayLineTreeReverse(new PVector(Platform6.x + 50, Platform6.y), 3);
        scenary.displayLineTreeReverse(new PVector(Platform7.x + 50, Platform7.y), 2);
        scenary.displayLineTreeReverse(new PVector(Platform7.x + 50, Platform7.y), 3);
        scenary.displayLineTreeReverse(new PVector(Platform7.x + 200, Platform7.y), 1);
        scenary.displayLineTreeReverse(new PVector(Platform7.x + 500, Platform7.y), 2);
        scenary.displayLineTreeReverse(new PVector(Platform7.x + 700, Platform7.y), 1);
        scenary.displayLineTreeReverse(new PVector(Platform8.x + 100, Platform8.y), 2);
        scenary.displayLineTreeReverse(new PVector(Platform9.x + 25, Platform9.y), 1);
        scenary.displayLineTreeReverse(new PVector(Platform9.x + 150, Platform9.y), 3);
        scenary.displayLineTreeReverse(new PVector(Platform10.x + 25, Platform10.y), 2);
        scenary.displayLineTreeReverse(new PVector(Platform11.x + 50, Platform11.y), 3);
        scenary.displayLineTreeReverse(new PVector(Platform11.x + 50, Platform11.y), 1);
        scenary.displayLineTreeReverse(new PVector(Platform12.x + 100, Platform12.y), 2);
        scenary.displayLineTreeReverse(new PVector(Platform12.x + 200, Platform12.y), 2);
      }


      // Display the player ...............
      if (currentTime > 3000) {
        player_lvl5.display();
        if (currentTime > 8000  && currentTime < 9500) {
          player_lvl5.surpriseFace();
        }
        if (currentTime > 58000) {
          player_lvl5.sickFace();
        }
        player_lvl5.corrupted(3);
      } 

      // Scenary IN FRONT of ..............
      // the player  
      circuitRAM();
      dialogue();


      // Check Status ....................
      // The opening effect
      openingEffect();
      // Check the position of the player
      if (isDead()) {
        player_lvl5.location.y = 0 - 150;
      }
      // Check if the player touch the particles
      if (player_lvl5.location.x < newOrigin + 40) {
        corruptedSound.play();
        player_lvl5.location.x += 600;
      }
      // Check if it goes to the right edge
      if (player_lvl6.location.x > rightEdge - 33) {
        player_lvl6.location.x -= 10;
      }
      // If the scene ends
      if (currentTime > 71500) {
        startLevel = !startLevel;
      }
      // END OF THE LEVEL
    } else {
      background(0);
      level_6.play();
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
    if (currentTime > 16000   &&   currentTime < 58000) {
      // Rearrange valueX (-)
      valueX -= 4;
      newOrigin +=4;
      rightEdge +=4;
    }
    // Change the parameter of translate with new valueX
    translate(valueX, 0);
  }


  // Method to activate Particles RAM -----------------------------
  void circuitRAM() {
    resetMatrix();
    if (currentTime > 9500) {
      // Edge background
      image(edge, edgePos, 0);
      // coming of the edge
      if (edgePos < 0   &&   currentTime < 58000) {
        edgePos += 10;
      } else {
        edgePos -= 10;
      }

      recurence ++;
      for (particleSystem ps : particuleRAM) {
        // Run it
        ps.runRAM();
        // Add a particule based on the recurence and the timer
        if (recurence % 5 == 1  &&   currentTime < 58000) {
          ps.addParticleRAM(new PVector(40, height + 150), 2);
        }
      }
    }
  }


  // Method to activate fadeEffect ------------------------------
  void openingEffect() {
    // Check to open the fade effect
    if (alpha > 0  && currentTime > 3000) {
      alpha -= 5;
    }
    // Display a white screen
    fill(0, alpha);
    noStroke();
    rect(0, 0, width, height);
  }
  
  
    // Method to activate dialogue ------------------------------
  void dialogue() {
    // Set text align to center and the size
    textAlign(CENTER);
    textFont(dialogueDD, 25);
    fill(254, 190, 70);
    
    // 2 line
    if (currentTime > 66000  && currentTime < 70000) {
      text("< You are nearly there />", width/2, height/2 - 50);
    }
  }


  // Method for the game over --------------------------------
  void gameOver() {
    resetMatrix();
    player_lvl5.location = new PVector(width/2, 0 - 150);
  }




  // Boolean to check if the player is dead -------------------
  boolean isDead() {
    // If the player fall
    if (player_lvl5.location.y > height) {
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
Block [][] L5_b1;
Block [][] L5_b2;
Block [][] L5_b3;
Block [][] L5_b4;
Block [][] L5_b5;
Block [][] L5_b6;
Block [][] L5_b7;
Block [][] L5_b8;
Block [][] L5_b9;
Block [][] L5_b10;
Block [][] L5_b11;
Block [][] L5_b12;
Block [][] L5_b13;
Block [][] L5_b14;
Block [][] L5_b15;
Block [][] L5_b16;
Block [][] L5_b17;



// The background
Background level5BG;
// The Player
Player player_lvl5;