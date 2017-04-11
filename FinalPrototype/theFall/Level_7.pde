 //---------------------------------------------------------------
//-----------------------------CLASS-----------------------------
//---------------------------------------------------------------
class Level_7 {

  // Font variables
  PFont dialogueDD;

  // Platforms' location in PVector
  PVector Platform1;
  PVector Platform2;
  PVector Platform3;
  PVector Platform4;
  PVector Platform5;
  PVector Platform6;
  
  // Boolean to startLevel
  boolean startLevel;
  boolean playMusic;
  
  // Float variables for the timer
  float currentTime;
  float initialTime;
  boolean startTimer;
  boolean delete1;
  boolean delete2;
  boolean delete3;
  boolean delete4;
  
  
  // Controlling the particles
  float recurence;
  
  // Images Variables
  PImage on;
  PImage off;
  

  //--------------------------CONSTRUCTOR--------------------------
  Level_7() {
    recurence = 0.0;

    // Font variables
    dialogueDD = createFont("font/SourceCodePro-Bold.ttf", 16, true);

    // Initialize Platform' location
    Platform1 = new PVector(width/2 - 225, height - blockSize*7);
    Platform2 = new PVector(width/2 - 225, height - blockSize*6);
    Platform3 = new PVector(width/2 - 225, height - blockSize*5);
    Platform4 = new PVector(width/2 - 225, height - blockSize*4);
    Platform5 = new PVector(Platform4.x - blockSize*20, 0 - blockSize);
    Platform6 = new PVector(Platform4.x + blockSize*5, 0 - blockSize);

    // Initialize the player and starting position
    player_lvl7 = new Player(new PVector(Platform1.x + 225, 0 - 150), 2);
    
    // Initialize boolean
    startLevel = true;
    startTimer = false;
    playMusic = false;
    delete1 =  false;
    delete2 =  false;
    delete3 =  false;
    delete4 =  false;
    
    on = loadImage("computerWorld/switch_ON.png");
    off = loadImage("computerWorld/switch_OFF.png");
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
      if (!playMusic) {
        lv7_music.play();
        playMusic = true;
      }  
      //Sound effect--
      if (!delete1  &&  currentTime > 3000) {
        corruptedSound.play();
        delete1 = true;
      }
      if (!delete2  &&  currentTime > 6500) {
        corruptedSound.play();
        delete2 = true;
      }
      if (!delete3  &&  currentTime > 10000) {
        corruptedSound.play();
        delete3 = true;
      }
      if (!delete4  &&  currentTime > 12500) {
        corruptedSound.play();
        delete4 = true;
      }
  
      // Display Platforms ...............
      if (currentTime < 3000) {
        displayArray(L7_b1, Platform1);
      }
      if (currentTime < 6500) {
        displayArray(L7_b2, Platform2);
      }
      if (currentTime < 10000) {
        displayArray(L7_b3, Platform3);
      }
      if (currentTime < 12500) {
        displayArray(L7_b4, Platform4);
      }
      displayArray(L7_b5, Platform5);
      displayArray(L7_b6, Platform6);
      
  
      // Check the position of ............
      // the player  
      if (currentTime < 3000) {
        player_lvl7.chekPlatform(L7_b1);
      }
      if (currentTime < 6500) {
        player_lvl7.chekPlatform(L7_b2);
      }
      if (currentTime < 10000) {
        player_lvl7.chekPlatform(L7_b3);
      }
      if (currentTime < 12500) {
        player_lvl7.chekPlatform(L7_b4);
      }
      player_lvl7.chekPlatform(L7_b5);
      player_lvl7.chekPlatform(L7_b6);
      
  
      // Scenary BEHIND ...................
      // the player    
      imageMode(CORNER);
      if (player_lvl7.location.y > height - blockSize*2) {
        image(off, width/2 - 225, height - blockSize*3);
      } else {
        image(on, width/2 - 225, height - blockSize*3);
      }
  
      // Display the player ...............
      player_lvl7.noJump = true;
      player_lvl7.display();
      if (currentTime > 3000  && currentTime < 10000) {
        player_lvl7.scareFaceOne();
      }
      if (currentTime > 10000) {
        player_lvl7.scareFaceTwo();
      }
      player_lvl7.corrupted(3);
      
      // Scenary IN FRONT of ..............
      // the player  
          
      // Check Status ....................
      if (currentTime > 13500) {
        background(0);
      }
      if (currentTime > 19000) {
        startLevel = !startLevel;
      }
    // END OF THE LEVEL
    } else {
      background(0); 
      load_1.playThird();
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

  
  // Method for the game over --------------------------------
  void gameOver() {
    resetMatrix();
    player_lvl7.location = new PVector(width/2, 0 - 150);
  }
  
  // Boolean to check if the player is dead -------------------
  boolean isDead() {
    // If the player fall
    if (player_lvl7.location.y > height) {
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
Block [][] L7_b1;
Block [][] L7_b2;
Block [][] L7_b3;
Block [][] L7_b4;
Block [][] L7_b5;
Block [][] L7_b6;

// The Player
Player player_lvl7;