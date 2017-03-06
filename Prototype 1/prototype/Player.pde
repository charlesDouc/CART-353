//---------------------------------------------------------------
//-----------------------------CLASS-----------------------------
//---------------------------------------------------------------
class Player {

  // PVector variables
  PVector location;
  PVector velocity;
  PVector acceleration;

  float speed;
  float topSpeed;
  float mass;

  // Image variable
  PImage bg;

  //--------------------------CONSTRUCTOR--------------------------
  Player() {
    // Update the variables 
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    
    // Set the speed
    speed = 1;
    mass= 1;
  }


  //----------------------------DISPLAY----------------------------
  // Method to display the player
  void display() {
    update();
    
    noStroke();
    fill(120);
    rectMode(CENTER);
    rect(location.x, location.y, 50, 50);
  }


  //----------------------------METHODS----------------------------

  // Method to update the position of the player
  void update() {
    move();
    velocity.add(acceleration); 
    velocity.limit(topSpeed);
    location.add(velocity);
  }


  // Method to move the player
  void move() {
    if (keyPressed) {
      // Move to the right
      if (keyCode == RIGHT) {
        // Reset the value of acceleration and add a value
        acceleration.y = 0;
        acceleration.x = 0;
        acceleration.x += speed; 
        // Set the topSpeed to 7
        topSpeed = 7;

        // Move to the Left
      } else if (keyCode == LEFT) {
        // Reset the value of acceleration and add a value
        acceleration.y = 0;
        acceleration.x = 0;
        acceleration.x -= speed; 
        // Set the topSpeed to 7
        topSpeed = 7;
      } 
      // When dosen't move
    } else if (topSpeed > 0) {
      // Decrease the value of topSpeed until 0
      topSpeed -= speed/2;
    }
  }
}


//---------------------------------------------------------------
//-----------------------GLOBAL VARIABLES------------------------
//---------------------------------------------------------------