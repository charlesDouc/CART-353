 //---------------------------------------------------------------
//-----------------------------CLASS-----------------------------
//---------------------------------------------------------------
class Level_4 {
  // Translate variable and fade
  float valueX;
  int alpha;

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
  
  // Boolean to startLevel
  boolean startLevel;
  boolean platformEffect;
  
  // Float variables for the timer
  float currentTime;
  float initialTime;
  boolean startTimer;
  boolean corrupted1;
  boolean corrupted2;
  boolean corrupted3;
  boolean ciruitSound;
  
  // Image for the "computer master"
  PImage ddOrigin;
  PImage ddTalk1;
  PImage ddTalk2;
  boolean talking;
  
  // Controlling the particles
  float recurence;

  //--------------------------CONSTRUCTOR--------------------------
  Level_4() {
    valueX = 0.0;
    recurence = 0.0;
    alpha = 255;

    // Font variables
    dialogueDD = createFont("font/SourceCodePro-Bold.ttf", 16, true);

    // Initialize Platform' location
    Platform1 = new PVector(width/2 - 225, height - blockSize*3);
    Platform2 = new PVector(Platform1.x + 6*blockSize, height - blockSize*3);
    Platform3 = new PVector(Platform2.x + 3*blockSize, height - blockSize*4);
    Platform4 = new PVector(Platform3.x + 8*blockSize, height - blockSize*3);
    Platform5 = new PVector(Platform4.x + 13*blockSize, height - blockSize*4);
    Platform6 = new PVector(Platform5.x + 5*blockSize, height - blockSize*5);
    Platform7 = new PVector(Platform6.x + 5*blockSize, height - blockSize*6);
    Platform8 = new PVector(Platform7.x + 6*blockSize, height - blockSize*6);

    // Initialize the player and starting position
    player_lvl4 = new Player(new PVector(Platform1.x + 225, 0 - 150), 2);
    
    // Initialize boolean
    startLevel = true;
    startTimer = false;
    talking = false;
    platformEffect = false;
    corrupted1 = false;
    corrupted2 = false;
    corrupted3 = false;
    ciruitSound = false;
    
    // Initialize images
    ddOrigin = loadImage("computerWorld/dd_origin.png");
    ddTalk1 = loadImage("computerWorld/dd_talk1.png");
    ddTalk2 = loadImage("computerWorld/dd_talk2.png");
  }

  //----------------------------METHODS----------------------------

  // Method for creating first level ------------------------------
  void play() {      
    if (startLevel) {
      // Display Background ...............
      level4BG.display();
 
      
      // Chek if the timer starts...................................
      if (!startTimer) {
        // Set the initial time and change the start status
        initialTime = millis();
        lv4_music.play();
        startTimer = true;
      }    
      // Set the timer to 0
      currentTime = millis() - initialTime;
      // ...........................................................
  
      // Scroll the level (if)............
      scrollPlatform();
  
      // Display Platforms ................
      displayArray(L4_b1, Platform1);
      if (currentTime > 56000) {
        if (!platformEffect) {
          boom.play();
          platformEffect = !platformEffect;
        }
        displayArray(L4_b2, Platform2);
        displayArray(L4_b3, Platform3);
        displayArray(L4_b4, Platform4);
        displayArray(L4_b5, Platform5);
        displayArray(L4_b6, Platform6);
        displayArray(L4_b7, Platform7);
        displayArray(L4_b8, Platform8);
      }
  
      // Check the position of ............
      // the player            
      player_lvl4.chekPlatform(L4_b1);
      if (currentTime > 56000) {
        player_lvl4.chekPlatform(L4_b2);
        player_lvl4.chekPlatform(L4_b3);
        player_lvl4.chekPlatform(L4_b4);
        player_lvl4.chekPlatform(L4_b5);
        player_lvl4.chekPlatform(L4_b6);
        player_lvl4.chekPlatform(L4_b7);
        player_lvl4.chekPlatform(L4_b8);
      }
  
      // Scenary BEHIND ...................
      // the player    
      imageMode(CENTER);
      image(ddOrigin, width/2, 300);
      imageMode(CORNER);
      if(currentTime > 15000  && currentTime < 58001) {
        dialogue();
      }
      // Display a hub
      scenary.displayHub(new PVector(Platform8.x + 7*blockSize + 50, 0));
      // Display the RAM highway
      circuitRAM();
  
      // Display the player ...............
      if (currentTime > 7000) {
        player_lvl4.display(); 
        // Show a surprise emotion
        if(currentTime > 15000 && currentTime < 54000) {
          player_lvl4.surpriseFace();
        }
        // Start Corruptions
        if (player_lvl4.location.x > Platform3.x + 350 + 127) {
          if (!corrupted1) {
            corruptedSound.play();
            corrupted1 = true;
          }
          player_lvl4.corrupted(1);
        } else {
          corrupted1 = false;
        }
        // For the second corruption
        if (player_lvl4.location.x > Platform4.x + 500 + 88) {
          if (!corrupted2) {
            corruptedSound.play();
            corrupted2 = true;
          }
          player_lvl4.corrupted(2);
        }else {
          corrupted2 = false;
        }
        // For the third corruption
        if (player_lvl4.location.x > Platform6.x + 150 + 144) {
          if (!corrupted3) {
            corruptedSound.play();
            corrupted3 = true;
          }
          player_lvl4.corrupted(3);
        } else {
          corrupted3 = false;
        }
      }
      
      // Scenary IN FRONT of ..............
      // the player  
      // The falling sprites at the begining
      fallingSprites();
      // Scenary
      if (currentTime > 56000) {
        scenary.displayLineTree(new PVector(Platform3.x + 350, Platform3.y), 1);
        scenary.displayLineTreeReverse(new PVector(Platform2.x + 50, Platform2.y), 2);
        scenary.displayLineTree(new PVector(Platform4.x + 500, Platform4.y), 3);
        scenary.displayLineTreeReverse(new PVector(Platform5.x + 50, Platform5.y), 1);
        scenary.displayLineTree(new PVector(Platform6.x + 150, Platform6.y), 2);
        scenary.displayLineTreeReverse(new PVector(Platform7.x + 50, Platform7.y), 3);
      }
      
    
      // Check Status ....................
      // The opening effect
      openingEffect();
    
      if (isDead()) {
        gameOver();
      }
      if (fly()) {
        if (!ciruitSound) {
          goUp.play();
          ciruitSound = true;
        }
        player_lvl4.location.y -= 30;
        if (player_lvl4.location.y + 50 < 0) {
          startLevel = !startLevel;
        }
      }
    // END OF THE LEVEL
    } else {
      background(0);
      level_5.play();
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
    if (player_lvl4.location.x >= width - valueX - 600) {
      // Rearrange valueX (-)
      valueX -= 7;
    }
    // If the player is on the left edge of the screen
    if (player_lvl4.location.x <= 0 - valueX + 600) {
      // Rearrange valueX (+)
      valueX += 7;
    }
    // Change the parameter of translate with new valueX
    translate(valueX, 0);
  }
  
  
  // Method to activate Particles Sprite -----------------------------
  void fallingSprites() {
    if (currentTime < 15000) {
      recurence ++;
      for (particleSystem ps: playerSprite) {
        // Run it
        ps.run();
        // Add a particule based on the recurence and the timer
        if(recurence % 10 == 1 && currentTime < 6000) {
          ps.addParticle(new PVector(width/2, 0 - 150));
        }
      }
    }
  }
  
  
  // Method to activate Particles RAM -----------------------------
  void circuitRAM() {
    if (currentTime > 58000) {
      recurence ++;
      for (particleSystem ps: particuleRAM) {
        // Run it
        ps.runRAM();
        // Add a particule based on the recurence and the timer
        if(recurence % 5 == 1) {
          ps.addParticleRAM(new PVector(Platform8.x + 7*blockSize + 300, height + 150), 1);
        }
      }
    }
  }
  
  
  // Method to activate fadeEffect ------------------------------
  void openingEffect() {
    // Check to open the fade effect
    if (alpha > 0  && currentTime > 3000) {
        alpha -= 1;
      }
    // Display a white screen
    fill(255, alpha);
    noStroke();
    rect(0, 0, width, height);
  }
  
  
  // Method to activate dialogue ------------------------------
  void dialogue() {
    // Set text align to center and the size
    textAlign(CENTER);
    textFont(dialogueDD, 25);
    fill(254, 190, 70);
    // Set an animation based on recurence
    if(recurence % 4 == 1) {
      talking = !talking;
    }
    
    // Talking effect
    if (currentTime > 15000 && currentTime < 16000  ||
        currentTime > 18500 && currentTime < 20000  ||
        currentTime > 22500 && currentTime < 24000  ||
        currentTime > 26500 && currentTime < 28000  ||
        currentTime > 30500 && currentTime < 32000  ||
        currentTime > 34500 && currentTime < 36000  ||
        currentTime > 38500 && currentTime < 40000  ||
        currentTime > 42500 && currentTime < 44000  ||
        currentTime > 46500 && currentTime < 48000  ||
        currentTime > 50500 && currentTime < 52000  ) {
      recurence ++;
      imageMode(CENTER);
      if (talking) {
        talkSound.play();
        image(ddTalk1, width/2, 300);
      } else {
        image(ddTalk2, width/2, 300);
      }
      imageMode(CORNER);
    }
    
    // 1 line
    if (currentTime > 15000  && currentTime < 18000) {
      text("< Hello, unusual sprite />", width/2, height/2 - 50);
    }
    // 2 line
    if (currentTime > 18500  && currentTime < 22000) {
      text("< My system is being corrupted by a common error />", width/2, height/2 - 50);
    }
    // 3 line
    if (currentTime > 22500  && currentTime < 26000) {
      text("< I can see that you are not alone />", width/2, height/2 - 50);
    }
    // 4 line
    if (currentTime > 26500  && currentTime < 30000) {
      text("< Please help me put an end to all this />", width/2, height/2 - 50);
    }
    // 5 line
    if (currentTime > 30500  && currentTime < 34000) {
      text("< There’s a manual switch in my core, find it />", width/2, height/2 - 50);
    }
    // 6 line
    if (currentTime > 34500  && currentTime < 38000) {
      text("< It will reboot me safely and clean all errors />", width/2, height/2 - 50);
    }
    // 7 line
    if (currentTime > 38500  && currentTime < 42000) {
      text("< I don't have much time left />", width/2, height/2 - 50);
    }
    // 8 line
    if (currentTime > 42500  && currentTime < 46000) {
      text("< Use the RAM Highway, it will direct you to my core />", width/2, height/2 - 50);
    }
    // 9 line
    if (currentTime > 46500  && currentTime < 50000) {
      text("< It's not far away, only few Kylobytes to the right />", width/2, height/2 - 50);
    }
    // 10 line
    if (currentTime > 50500  && currentTime < 54000) {
      text("< Now, go on before you start being corrupted yourself />", width/2, height/2 - 50);
    }
    // 11 line
    if (currentTime > 54500  && currentTime < 58000) {
      text("< Good Luck />", width/2, height/2 - 50);
    } 
  }


  // Method to activate gameOver ------------------------------
  void gameOver() {
    player_lvl4.location = new PVector(width/2, 0 - 150);
  }
  


  // Boolean to check if the player is dead -------------------
  boolean isDead() {
    // If the player fall
    if (player_lvl4.location.y > height) {
      // Return true
      return true;
    } else {
      return false;
    }
  }


  // Boolean to check if the player win -------------------
  boolean fly() {
    // If the player fall
    if (player_lvl4.location.x > Platform8.x + 7*blockSize + 100) {
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
Block [][] L4_b1;
Block [][] L4_b2;
Block [][] L4_b3;
Block [][] L4_b4;
Block [][] L4_b5;
Block [][] L4_b6;
Block [][] L4_b7;
Block [][] L4_b8;


// The background
Background level4BG;
// The Player
Player player_lvl4;

// ArrayList for particuleRAM
ArrayList<particleSystem> particuleRAM;