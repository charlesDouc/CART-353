//---------------------------------------------------------------
//-----------------------------CLASS-----------------------------
//---------------------------------------------------------------
class Player {

  // PVector variables
  PVector location;
  PVector velocity;
  PVector moveVelocity;
  PVector acceleration;
  PVector moveAcceleration;
  
  // Force Variables
  float speed;
  float topSpeed;
  boolean speedUp;
  boolean noJump;
  
  PVector gravity;
  float mass;
  float sizeH;
  float sizeW;
  
  // Boolean to  chek platform
  boolean onPlatform;
  boolean aWallLeft;
  boolean aWallRight;
  
  // Translate variable
  float valueX;
  
  
  // player sprite
  float walk;
  boolean isWalking;
  
  PImage rightBody;
  PImage leftBody;
  PImage rightFootA;
  PImage rightFootB;
  PImage leftFootA;
  PImage leftFootB;
  
  // PLayer Emotion
  PImage rightSmile;
  PImage leftSmile;
  PImage rightSurprise;
  PImage leftSurprise;
  PImage rightCorr1;
  PImage rightCorr2;
  PImage rightCorr3;
  PImage leftCorr1;
  PImage leftCorr2;
  PImage leftCorr3;
  PImage rightSick;
  PImage leftSick;
  PImage rightScare1;
  PImage leftScare1;
  PImage rightScare2;
  PImage leftScare2;
  
  // Boolean to stop gravity
  boolean stopGravity;
  
  
  //--------------------------CONSTRUCTOR--------------------------
  Player(PVector newPos, int playerIndex) {
    // Update the variables 
    location = new PVector(newPos.x, newPos.y);
    velocity = new PVector(0, 0);
    moveVelocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    moveAcceleration = new PVector(0, 0);
    
    // Set the speed
    speed = 1;
    
    // Set force variables
    mass= 10;
    speedUp = false;
    gravity = new PVector(0, 2);
    // Size Variables
    sizeH = 99;
    sizeW = 67;
    
    // Boolean for the platform
    onPlatform = false;
    aWallLeft = false;
    aWallRight = false;
    stopGravity = false;
    noJump = false;
    
    walk = 0;
    isWalking = false;
    
   
   // Player sprite initialize
   rightBody = loadImage("player/" + playerIndex + "rightBody.png");
   leftBody = loadImage("player/" + playerIndex + "leftBody.png");
   rightFootA = loadImage("player/" + playerIndex + "rightFoot_A.png");
   leftFootA = loadImage("player/" + playerIndex + "leftFoot_A.png");
   rightFootB = loadImage("player/" + playerIndex + "rightFoot_B.png");
   leftFootB = loadImage("player/" + playerIndex + "leftFoot_B.png");
   
   rightSurprise = loadImage("player/2rightBody_Surprise.png");
   leftSurprise = loadImage("player/2leftBody_Surprise.png");
   rightCorr1 = loadImage("player/corr1Right.png");
   rightCorr2 = loadImage("player/corr2Right.png");
   rightCorr3 = loadImage("player/corr3Right.png");
   leftCorr1 = loadImage("player/corr1Left.png");
   leftCorr2 = loadImage("player/corr2Left.png");
   leftCorr3 = loadImage("player/corr3Left.png");
   rightSmile = loadImage("player/2rightBody_Smile.png");
   leftSmile = loadImage("player/2leftBody_Smile.png");
   rightSick = loadImage("player/2rightBody_Sick.png");
   leftSick = loadImage("player/2leftBody_Sick.png");
   rightScare1  = loadImage("player/2rightBody_ScareOne.png");
   leftScare1  = loadImage("player/2leftBody_ScareOne.png");
   rightScare2  = loadImage("player/2rightBody_ScareTwo.png");
   leftScare2  = loadImage("player/2leftBody_ScareTwo.png");
  }


  //----------------------------DISPLAY----------------------------
  // Method to displ_ay the player
  void display() {
    
    // Check if the player is on a platform
    if (!onPlatform & !stopGravity) {
      // Apply gravity force
      applyForce(gravity);
    } else if (!stopGravity) {
      // Stop movement on y axe, change the value onPlatform and 
      // move the player on the platform.
      velocity.y = 0;
      onPlatform = !onPlatform;
      location.y -= 0.5;
    }
    
    // Update the location
    update();
    // Display the player's sprite
    showGraphic();
  }


  //----------------------------METHODS----------------------------

  // Method to update the position of the player ------------
  void update() {
    // Environnement forces
    velocity.add(acceleration); 
    location.add(velocity);
    acceleration.mult(0);
    
    
    // Force due to movement
    move();
    moveVelocity.add(moveAcceleration); 
    moveVelocity.limit(topSpeed);
    
    // Stop movement if hit a wall
    if (aWallLeft) {
      moveVelocity.x = 0;
      // Push away the player
      location.x += 1;
      aWallLeft = !aWallLeft;
    }
    if (aWallRight) {
      moveVelocity.x = 0;
      // Push away the player
      location.x -= 1;
      aWallRight = !aWallRight;
    }
  
    // Add the force to the location of the player
    location.add(moveVelocity);
  }


  // Method to move the player ------------------------------
  void move() { 
    // Move to the left
    if (leftPressed) {
      // Cancel right movement
      rightPressed = false;
      // Reset the value of acceleration and add a value
      moveAcceleration.y = 0;
      moveAcceleration.x = 0;
      moveAcceleration.x -= speed;
      
      // Set the topSpeed to 7 (unless SpeedUp)
      if (speedUp) {
        topSpeed = 14;
      } else {
        topSpeed = 7;
      }
    }
   
    // Move to the right
    if (rightPressed) {
      // Cancel right movement
      leftPressed = false;
      // Reset the value of acceleration and add a value
      moveAcceleration.y = 0;
      moveAcceleration.x = 0;
      moveAcceleration.x += speed;
      
      // Set the topSpeed to 7 (unless SpeedUp)
      if (speedUp) {
        topSpeed = 14;
      } else {
        topSpeed = 7;
      }
    } 
    
    // Jump!  
    if (spacePressed && !noJump) {
      // Reset the value of acceleration
      moveAcceleration.y = 0;
      
      // Descelerate right direction
      if (moveAcceleration.x > 0) {
        moveAcceleration.x -= 0.1;
      }
      // Descelerate left direction
      if (moveAcceleration.x < 0) {
        moveAcceleration.x += 0.1;
      }
      
      // Add a value
      moveAcceleration.y -= speed*3;
      // Set the topSpeed to 15
      topSpeed = 10;  
    }

    // Ease the the desceleration when the player is not moving
    if (topSpeed > 0) {
      // Decrease the value of topSpeed until 0
      topSpeed -= speed/2;
    }
  }
  
  
  // Method to speed up the player -------------------------------
  void maxSpeed() {
    speedUp = true;
  }
  
  
  // Method to apply a force -------------------------------
  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }
  
  
  // Method to stop the player -----------------------------
  void stopPlayer() {
    velocity = new PVector(0, 0);
    moveVelocity = new PVector(0, 0);
    stopGravity = true;
  }
  
  
  // Method check if player is on a Platform --------------
  void chekPlatform(Block platform[][]) {
    // Call the Block array
    for (int i = 0; i < platform.length; i++) {
      // Set j to 0 (we only want the first row
      int j = 0;
      // Search if the player is on the platform's y coordinate
      if (location.y + sizeH/2 >= platform[i][j].location.y   && 
          location.y + sizeH/2 <= platform[i][j].location.y + 25   && 
          location.x <= platform[platform.length - 1][j].location.x + blockSize &&
          location.x >= platform[0][j].location.x) {
            
        // If so, tell it to the boolean
        onPlatform = true;
      }
      
      // Search if the player is on a platform<s left wall
      if (location.x - 67/2 <= platform[platform.length - 1][j].location.x + blockSize   &&
          location.x - 67/2 >= platform[i][j].location.x   &&
          location.y + sizeH/2 > platform[i][j].location.y + 25) {
        
        // If so, tell it to the boolean
        aWallLeft = true;
      }
      
      // Search if the player is on a platform<s right wall
      if (location.x + 67/2 <= platform[0][j].location.x + blockSize   &&
          location.x + 67/2 >= platform[0][j].location.x   &&
          location.y + sizeH/2 > platform[i][j].location.y + 25) {
        
        // If so, tell it to the boolean
        aWallRight = true;
      }
    }
  }
 
  
  // Method to animate the player -----------------------------
  void showGraphic() {
    // Activate the walking effect
    walk ++;
    if (walk % 5 == 1) {
      isWalking = !isWalking;
    }
    // Change the image mode to center
    imageMode(CENTER);
    
    //If the player goes to the left
    if (leftPressed) {
      // change the sprite of is foot
      if (isWalking && !spacePressed) {
        // display foot A
        image(leftFootA, location.x, location.y + 38);
      } else {
        // display foot B
        image(leftFootB, location.x, location.y + 38);
      }
      // Display the body of the  player
      image(leftBody, location.x, location.y - 12);
    } 
    
    //If the player goes to the right
    if(rightPressed) {
      // change the sprite of is foot
      if (isWalking && !spacePressed) {
        // display foot A
        image(rightFootA, location.x, location.y + 38);
      } else {
        // display foot B
        image(rightFootB, location.x, location.y + 38);
      }
      // Display the body of the  player
      image(rightBody, location.x, location.y - 12);
    } else if (!leftPressed) {
      image(rightFootA, location.x, location.y + 38);
      image(rightBody, location.x, location.y - 12);
    }
    
    // Reset the image mode to corner
    imageMode(CORNER);
  }
  
  
  // Method to suprise the player -----------------------------
  void surpriseFace() {
    imageMode(CENTER);
    if (leftPressed) {
      image(leftSurprise, location.x, location.y - 12);
    } 
    
    if(rightPressed) {
      // Display the surprise body of the  player
      image(rightSurprise, location.x, location.y - 12);
    } else if (!leftPressed) {
      image(rightSurprise, location.x, location.y - 12);
    }
   
   // Reset the image mode to corner
   imageMode(CORNER);
  }
  
  
  // Method to change the face of the player to smile -----------------------------
  void smileFace() {
    imageMode(CENTER);
    if (leftPressed) {
      image(leftSmile, location.x, location.y - 12);
    } 
    
    if(rightPressed) {
      // Display the surprise body of the  player
      image(rightSmile, location.x, location.y - 12);
    } else if (!leftPressed) {
      image(rightSmile, location.x, location.y - 12);
    }
   
   // Reset the image mode to corner
   imageMode(CORNER);
  }
  
  
  // Method to change the face of the player to sick -----------------------------
  void sickFace() {
    imageMode(CENTER);
    if (leftPressed) {
      image(leftSick, location.x, location.y - 12);
    } 
    
    if(rightPressed) {
      // Display the surprise body of the  player
      image(rightSick, location.x, location.y - 12);
    } else if (!leftPressed) {
      image(rightSick, location.x, location.y - 12);
    }
   
   // Reset the image mode to corner
   imageMode(CORNER);
  }
  
  
  // Method to change the face of the player to scare1 -----------------------------
  void scareFaceOne() {
    imageMode(CENTER);
    if (leftPressed) {
      image(leftScare1, location.x, location.y - 12);
    } 
    
    if(rightPressed) {
      // Display the surprise body of the  player
      image(rightScare1, location.x, location.y - 12);
    } else if (!leftPressed) {
      image(rightScare1, location.x, location.y - 12);
    }
   
   // Reset the image mode to corner
   imageMode(CORNER);
  }
  
  
  // Method to change the face of the player to scare2 -----------------------------
  void scareFaceTwo() {
    imageMode(CENTER);
    if (leftPressed) {
      image(leftScare2, location.x, location.y - 12);
    } 
    
    if(rightPressed) {
      // Display the surprise body of the  player
      image(rightScare2, location.x, location.y - 12);
    } else if (!leftPressed) {
      image(rightScare2, location.x, location.y - 12);
    }
   
   // Reset the image mode to corner
   imageMode(CORNER);
  }
  
  
  // Method to corrupt the player -----------------------------
  void corrupted(int index) {
    imageMode(CENTER);
    // Display the surprise body of the  player
    if (leftPressed) {
      // Select the good image
      if (index == 1) {
        image(leftCorr1, location.x, location.y - 12);
      } else if (index == 2) {
        image(leftCorr2, location.x, location.y - 12);
      } else if (index == 3) {
        image(leftCorr3, location.x, location.y - 12);
      }
    } 
    
    if(rightPressed) {
      // Select the good image
      if (index == 1) {
        image(rightCorr1, location.x, location.y - 12);
      } else if (index == 2) {
        image(rightCorr2, location.x, location.y - 12);
      } else if (index == 3) {
        image(rightCorr3, location.x, location.y - 12);
      }
    } else if (!leftPressed) {
      if (index == 1) {
        image(rightCorr1, location.x, location.y - 12);
      } else if (index == 2) {
        image(rightCorr2, location.x, location.y - 12);
      } else if (index == 3) {
        image(rightCorr3, location.x, location.y - 12);
      }
    }
   
   // Reset the image mode to corner
   imageMode(CORNER);
  }
}


//---------------------------------------------------------------
//-----------------------GLOBAL VARIABLES------------------------
//---------------------------------------------------------------