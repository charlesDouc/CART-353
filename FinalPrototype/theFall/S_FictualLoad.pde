//---------------------------------------------------------------
//-----------------------------CLASS-----------------------------
//---------------------------------------------------------------
class FictualLoad {
  // PImage variables for the logos
  PImage ddc;
  PImage saturn;
  // PImage [] for the text box
  PImage [] text;
  
  // Float variables for the timer
  float currentTime;
  float initialTime;
  
  // Boolean to chek the start of the animation
  boolean start;
  boolean startSecond;
  boolean startThird;
  // Boolean to stop a animation
  boolean stopFirst;
  boolean stopSecond;
  boolean stopThird;
  
  // Margin of the text
  float textMargin;
  
  
  //--------------------------CONSTRUCTOR--------------------------
  FictualLoad() {
    // Load image for the logos
    ddc = loadImage("load/ddc_logo.png");
    saturn = loadImage("load/saturn_logo.png");
    
    // Set the text array and load the respective images
    text = new PImage [10];
    for (int i = 0; i < 7; i++) {
      text[i] = loadImage("load/text" + i + ".png");
    }
    text[7] = loadImage("load/text3-e.png");
    text[8] = loadImage("load/text5-e.png");
    text[9] = loadImage("load/error.png");
    
    // Set the boolean to false
    start = false;
    startSecond = false;
    stopFirst = false;
    stopSecond = false;
    startThird = false;
    stopThird = false;
    
    
    //Set the text Margin
    textMargin = 25.0;
  }
  
  
  //----------------------------METHODS--------------------------
  
  // Method to play the whole scene 1 -----------------
  void playFirst() {
    if (!stopFirst) {
      // Display the background of the scene
      loadBG.display();
      
      // Chek if the scene starts
      if (!start) {
        // Set the initial time and change the start status
        initialTime = millis();
        bootUpSound.play();
        start = true;
      }
      
      // Set the timer to 0
      currentTime = millis() - initialTime;
      
      
      // ANIMATION SETUP --------------
      if (currentTime < 11005) { 
        // Logos Activation .......
        if (currentTime > 1000) {
          // Display ddc logo
          image(ddc, 800, -50);
        }
        if (currentTime > 1400) {
          // Display saturn logo
          image(saturn, 830, 300);
        }
        
        // Texts Activation........
        if (currentTime > 1500) {
          // Display text0
          image(text[0], 50, 50);
        }
        if (currentTime > 2500) {
          // Display text1
          image(text[1], 50, 146);
        }
        if (currentTime > 3500) {
          // Display text2
          image(text[2], 50, 196);
        }
        if (currentTime > 5000) {
          // Display text3
          image(text[3], 50, 361);
        }
        if (currentTime > 5500) {
          // Display text4
          image(text[4], 50, 479);
        }
        if (currentTime > 6500) {
          // Display text5
          image(text[5], 50, 687);
        }
        if (currentTime > 8000) {
          // Display text6
          image(text[6], 50, 782);
        }
      }
      // End Activation.........
      if (currentTime > 11000) {
        // Blank bg
        background(200);
      }
      
      if (currentTime > 12000) {
        stopFirst = !stopFirst;
      }
    } else {
      fakeMenu.playFirst();
    }
  }
  
  
    // Method to play the whole scene 1 -----------------
  void playSecond() {
    if (!stopSecond) {
      // Display the background of the scene
      loadBG.display();
      
      // Chek if the scene starts
      if (!startSecond) {
        // Set the initial time and change the start status
        initialTime = millis();
        bootUpSound.play();
        startSecond = true;
      }
      
      // Set the timer to 0
      currentTime = millis() - initialTime;
      
      
      // ANIMATION SETUP --------------
      if (currentTime < 11005) { 
        // Logos Activation .......
        if (currentTime > 1000) {
          // Display ddc logo
          image(ddc, 800, -50);
        }
        if (currentTime > 1400) {
          // Display saturn logo
          image(saturn, 830, 300);
        }
        
        // Texts Activation........
        if (currentTime > 1500) {
          // Display text0
          image(text[0], 50, 50);
        }
        if (currentTime > 2500) {
          // Display text1
          image(text[1], 50, 146);
        }
        if (currentTime > 3500) {
          // Display text2
          image(text[2], 50, 196);
        }
        if (currentTime > 5000) {
          // Display text3
          image(text[7], 50, 361);
        }
        if (currentTime > 5500) {
          // Display text4
          image(text[4], 50, 479);
        }
        if (currentTime > 6500) {
          // Display text5
          image(text[8], 50, 687);
        }
        if (currentTime > 8000) {
          // Display text6
          image(text[6], 50, 782);
        }
        if (currentTime > 9000) {
          // Display text6
          image(text[9], 50, 837);
        }
        if (currentTime > 9200) {
          // Display text6
          image(text[9], 720, 50);
        }
        if (currentTime > 9400) {
          // Display text6
          image(text[9], 720, 310);
        }
        if (currentTime > 9600) {
          // Display text6
          image(text[9], 720, 570);
        }
        if (currentTime > 9800) {
          // Display text6
          image(text[9], 720, 830);
        }
        if (currentTime > 10000) {
          // Display text6
          image(text[9], 1440, 50);
        }
        if (currentTime > 10200) {
          // Display text6
          image(text[9], 1440, 310);
        }
        if (currentTime > 10400) {
          // Display text6
          image(text[9], 1440, 570);
        }
        if (currentTime > 10400) {
          // Display text6
          image(text[9], 1440, 830);
        }
      }
      // End Activation.........
      if (currentTime > 11000) {
        // Blank bg
        background(200);
      }
      
      if (currentTime > 12000) {
        stopSecond = !stopSecond;
      }
    } else {
      fakeMenu.playSecond();
    }
  }
  
  
  // Method to play the whole scene 1 -----------------
  void playThird() {
    if (!stopThird) {
      // Display the background of the scene
      loadBG.display();
      
      // Chek if the scene starts
      if (!startThird) {
        // Set the initial time and change the start status
        initialTime = millis();
        bootUpSound.play();
        startThird = true;
      }
      
      // Set the timer to 0
      currentTime = millis() - initialTime;
      
      
      // ANIMATION SETUP --------------
      if (currentTime < 11005) { 
        // Logos Activation .......
        if (currentTime > 1000) {
          // Display ddc logo
          image(ddc, 800, -50);
        }
        if (currentTime > 1400) {
          // Display saturn logo
          image(saturn, 830, 300);
        }
        
        // Texts Activation........
        if (currentTime > 1500) {
          // Display text0
          image(text[0], 50, 50);
        }
        if (currentTime > 2500) {
          // Display text1
          image(text[1], 50, 146);
        }
        if (currentTime > 3500) {
          // Display text2
          image(text[2], 50, 196);
        }
        if (currentTime > 5000) {
          // Display text3
          image(text[3], 50, 361);
        }
        if (currentTime > 5500) {
          // Display text4
          image(text[4], 50, 479);
        }
        if (currentTime > 6500) {
          // Display text5
          image(text[5], 50, 687);
        }
        if (currentTime > 8000) {
          // Display text6
          image(text[6], 50, 782);
        }
      }
      // End Activation.........
      if (currentTime > 11000) {
        // Blank bg
        background(200);
      }
      
      if (currentTime > 12000) {
        stopThird = !stopThird;
      }
    } else {
      level_1_Final.play();
    }
  }
}
//---------------------------------------------------------------
//-----------------------GLOBAL VARIABLES------------------------
//---------------------------------------------------------------

// The background
Background loadBG;