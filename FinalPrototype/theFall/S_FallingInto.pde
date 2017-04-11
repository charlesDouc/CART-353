//---------------------------------------------------------------
//-----------------------------CLASS-----------------------------
//---------------------------------------------------------------
class fallingInto {
  // Translate variable
  float valueX;

  // Font variables
  PFont fontLevel;
  
  // Boolean to stop the scene
  boolean stopScene;
  
  // Variables for the timer
  boolean starTimer;
  float currentTime;
  float initialTime;
  
  // Controlling the particles
  float recurence;
  

  //--------------------------CONSTRUCTOR--------------------------
  fallingInto() {
    starTimer = false;
    stopScene = false;
    
    recurence = 0.0;
  }
  
  
  //----------------------------METHOD-----------------------------
  
  // Method to play the whole -----------------
  void play() {
    if (!stopScene) {
      // Display the background of the scene
      loadBG.display();
      
      // Chek if the timer starts
      if (!starTimer) {
        // Set the initial time and change the start status
        initialTime = millis();
        // Start the music/sounds
        lv1g_music.stop();
        crash.play();
        starTimer = true;
      }
      
      // Set the timer to 0
      currentTime = millis() - initialTime;
      
      // ANIMATION SETUP --------------
      if (currentTime < 110005) { 
        // Activate the recurence
        recurence ++;
        
        //  Activation Flash .........
        if (currentTime > 1000  &&  currentTime < 1500) {
          // Display a new bg with recurence
          if(recurence % 5 == 1) {
              flash.play();
              background(200);
          }
        }
        if (currentTime > 2000  &&  currentTime < 2500) {
          // Display a new bg with recurence
          if(recurence % 5 == 1) {
              flash.play();
              background(200);
          }
        }
        if (currentTime > 3000  &&  currentTime < 4500) {
          // Display a new bg with recurence
          if(recurence % 5 == 1) {
              flash.play();
              background(200);
          }
        }
        
        //  Activation PArticles .........
        if (currentTime > 5000) {
          // Select the particle system
          for (particleSystem ps: playerSprite) {
            // Run it
            ps.run();
            // Add a particule based on the recurence
            if(recurence % 10 == 1) {
              ps.addParticle(player_lvl1g.location);
            }
          }
          //Display the player over the sprites
          player_lvl1g.display();
        }
        
        //  Activation Flashing Screen .........
        if (currentTime > 6000 && currentTime < 11000) {
          // Display a new bg with recurence
          if(recurence % 10 == 1) {
              background(200);
          }
        }
        if (currentTime > 11000 && currentTime < 12000) {
          // Display a new bg with recurence
          if(recurence % 5 == 1) {
              flash.play();
              background(200);
          }
        }
        if (currentTime > 12000) {
          // Display a new bg 
          background(200);
        }  
      }
      // End Scene.........  
      if (currentTime > 14000) {
        stopScene = !stopScene;
      }
    } 
  }
  
  
  // Boolean to check if the scene is over ----------------------
  boolean finished() {
    if (stopScene) {
      return true;
    } else {
      return false;
    }
  }
}

//---------------------------------------------------------------
//-----------------------GLOBAL VARIABLES------------------------
//---------------------------------------------------------------


// The background
Background sceneFallingIntoBG;

// ArrayList for playerSprite
ArrayList<particleSystem> playerSprite;