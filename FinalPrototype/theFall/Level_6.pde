 //---------------------------------------------------------------
//-----------------------------CLASS-----------------------------
//---------------------------------------------------------------
class Level_6 {
  // Translate variable and fade
  float valueX;
  float newOrigin;
  float rightEdge;
  float edgePos;

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
  PVector Platform18;
  PVector Platform19;
  PVector Platform20;
  
  
  // Boolean to startLevel
  boolean startLevel;
  boolean playMusic;
  
  // Float variables for the timer
  float currentTime;
  float initialTime;
  boolean startTimer;
  
  // Controlling the particles
  float recurence;
  
  // Images Variables
  PImage main;
  PImage error;
  PImage edge;
  

  //--------------------------CONSTRUCTOR--------------------------
  Level_6() {
    valueX = 0.0;
    recurence = 0.0;
    newOrigin = 0.0;
    edgePos = 0 - 560;
    rightEdge = width;

    // Font variables
    dialogueDD = createFont("font/SourceCodePro-Bold.ttf", 16, true);

    // Initialize Platform' location
    Platform1 = new PVector(width/2 - 225, height - blockSize*3);
    Platform2 = new PVector(Platform1.x + 7*blockSize, height - blockSize*3);
    Platform3 = new PVector(Platform2.x + 3*blockSize, height - blockSize*4);
    Platform4 = new PVector(Platform3.x + 3*blockSize, height - blockSize*5);
    Platform5 = new PVector(Platform4.x + 3*blockSize, height - blockSize*6);
    Platform6 = new PVector(Platform5.x + 3*blockSize, height - blockSize*7);
    Platform7 = new PVector(Platform6.x + 15*blockSize, height - blockSize*6);
    Platform8 = new PVector(Platform7.x + 10*blockSize, height - blockSize*5);
    Platform9 = new PVector(Platform8.x + 10*blockSize, height - blockSize*4);
    Platform10 = new PVector(Platform9.x + 10*blockSize, height - blockSize*5);
    Platform11 = new PVector(Platform10.x + 10*blockSize, height - blockSize*6);
    Platform12 = new PVector(Platform11.x + 10*blockSize, height - blockSize*4);
    Platform13 = new PVector(Platform12.x + 10*blockSize, height - blockSize*3);
    Platform14 = new PVector(Platform13.x + 10*blockSize, height - blockSize*3);
    Platform15 = new PVector(Platform14.x + 10*blockSize, height - blockSize*3);
    Platform16 = new PVector(Platform15.x + 10*blockSize, height - blockSize*4);
    Platform17 = new PVector(Platform16.x + 10*blockSize, height - blockSize*5);
    Platform18 = new PVector(Platform17.x + 10*blockSize, height - blockSize*6);
    Platform19 = new PVector(Platform18.x + 10*blockSize, height - blockSize*3);
    Platform20 = new PVector(Platform19.x + 10*blockSize, height - blockSize*4);

    // Initialize the player and starting position
    player_lvl6 = new Player(new PVector(Platform1.x + 225, 0 - 150), 2);
    
    // Initialize boolean
    startLevel = true;
    startTimer = false;
    playMusic = false;
    
    // Image initialization
    main = loadImage("computerWorld/main.png");
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
        startTimer = true;
      }    
      // Set the timer to 0
      currentTime = millis() - initialTime;
      // ...........................................................
      
      // Music in the level ...............
      if (currentTime > 1500  && !playMusic) {
        lv6_music.play();
        playMusic = true;
      }
      
      // Scroll the level (if)............
      scrollPlatform();
  
      // Display Platforms ................
      if (currentTime > 1500  &&  currentTime < 43000) {
        displayArray(L6_b1, Platform1);
        displayArray(L6_b2, Platform2);
        displayArray(L6_b3, Platform3);
        displayArray(L6_b4, Platform4);
        displayArray(L6_b5, Platform5);
        displayArray(L6_b6, Platform6);
        displayArray(L6_b7, Platform7);
        displayArray(L6_b8, Platform8);
        displayArray(L6_b9, Platform9);
        displayArray(L6_b10, Platform10);
        displayArray(L6_b11, Platform11);
        displayArray(L6_b12, Platform12);
        displayArray(L6_b13, Platform13);
        displayArray(L6_b14, Platform14);
        displayArray(L6_b15, Platform15);
        displayArray(L6_b16, Platform16);
        displayArray(L6_b17, Platform17);
        displayArray(L6_b18, Platform18);
        displayArray(L6_b19, Platform19);
        displayArray(L6_b20, Platform20);
      }
  
      // Check the position of ............
      // the player  
      if (currentTime > 1500  &&  currentTime < 43000) {
        player_lvl6.chekPlatform(L6_b1);
        player_lvl6.chekPlatform(L6_b2);
        player_lvl6.chekPlatform(L6_b3);
        player_lvl6.chekPlatform(L6_b4);
        player_lvl6.chekPlatform(L6_b5);
        player_lvl6.chekPlatform(L6_b6);
        player_lvl6.chekPlatform(L6_b7);
        player_lvl6.chekPlatform(L6_b8);
        player_lvl6.chekPlatform(L6_b9);
        player_lvl6.chekPlatform(L6_b10);
        player_lvl6.chekPlatform(L6_b11);
        player_lvl6.chekPlatform(L6_b12);
        player_lvl6.chekPlatform(L6_b13);
        player_lvl6.chekPlatform(L6_b14);
        player_lvl6.chekPlatform(L6_b15);
        player_lvl6.chekPlatform(L6_b16);
        player_lvl6.chekPlatform(L6_b17);
        player_lvl6.chekPlatform(L6_b18);
        player_lvl6.chekPlatform(L6_b19);
        player_lvl6.chekPlatform(L6_b20);
      }
  
      // Scenary BEHIND ...................
      // the player    
      imageMode(CENTER);
      if (currentTime > 1500) {
        image(main, width/2, height - blockSize*7);
        imageMode(CORNER);
        scenary.displayLineTreeReverse(new PVector(Platform2.x + 25, Platform2.y), 2);
        scenary.displayLineTreeReverse(new PVector(Platform3.x + 50, Platform3.y), 1);
        scenary.displayLineTreeReverse(new PVector(Platform4.x + 25, Platform4.y), 2);
        scenary.displayLineTreeReverse(new PVector(Platform5.x + 50, Platform5.y), 3);
    }
     
  
      // Display the player ...............
      if (currentTime > 15000) {
        player_lvl6.maxSpeed();
      }
      player_lvl6.display();
      player_lvl6.corrupted(3);
      
      // Scenary IN FRONT of ..............
      // the player  
      circuitRAM();
          
      // Check Status ....................
      // Check the position of the player
      if (isDead() && currentTime < 42000) {
        player_lvl6.location.y = 0 - 150;
      }
      // Check if the player touch the particles
      if (player_lvl6.location.x < newOrigin + 40) {
        player_lvl6.location.x += 600;
      }
      // Check if it goes to the right edge
      if (player_lvl6.location.x > rightEdge - 33) {
        player_lvl6.location.x -= 10;
      }
      // Stop the level
      if (currentTime > 44000) {
        startLevel = !startLevel;
      }
    // END OF THE LEVEL
    } else {
      background(0); 
      level_7.play();
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
    if (currentTime > 2000 && currentTime < 15500) {
      // Rearrange valueX (-)
      valueX -= 4;
      newOrigin +=4;
      rightEdge +=4;
    } else if (currentTime > 15500) {
      // Rearrange valueX (-)
      valueX -= 12;
      newOrigin +=12;
      rightEdge +=12;
    }
    // Change the parameter of translate with new valueX
    translate(valueX, 0);
  }
  
  
  // Method to activate Particles RAM -----------------------------
  void circuitRAM() {
    resetMatrix();
    if (currentTime > 1500) {
      // Edge background
      image(edge, edgePos, 0);
      // coming of the edge
      if (edgePos < 0  &&  currentTime < 40000) {
        edgePos += 10;
      } else {
        edgePos -= 10;
      }
      
      recurence ++;
      for (particleSystem ps: particuleRAM) {
        // Run it
        ps.runRAM();
        // Add a particule based on the recurence and the timer
        if(recurence % 5 == 1  && currentTime < 38000) {
          ps.addParticleRAM(new PVector(40, height + 150), 2);
        }
      }
    }
  }
  
  
  
  // Method for the game over --------------------------------
  void gameOver() {
    resetMatrix();
    player_lvl6.location = new PVector(width/2, 0 - 150);
  }
  
  


  // Boolean to check if the player is dead -------------------
  boolean isDead() {
    // If the player fall
    if (player_lvl6.location.y > height) {
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
Block [][] L6_b1;
Block [][] L6_b2;
Block [][] L6_b3;
Block [][] L6_b4;
Block [][] L6_b5;
Block [][] L6_b6;
Block [][] L6_b7;
Block [][] L6_b8;
Block [][] L6_b9;
Block [][] L6_b10;
Block [][] L6_b11;
Block [][] L6_b12;
Block [][] L6_b13;
Block [][] L6_b14;
Block [][] L6_b15;
Block [][] L6_b16;
Block [][] L6_b17;
Block [][] L6_b18;
Block [][] L6_b19;
Block [][] L6_b20;

// The Player
Player player_lvl6;