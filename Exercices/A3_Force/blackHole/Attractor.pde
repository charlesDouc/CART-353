//---------------------------------------------------------------
//-----------------------------CLASS-----------------------------
//---------------------------------------------------------------
class Attractor {
  // PVector variables
  PVector location;
  PVector acceleration;
  PVector velocity;

  // Image variable
  PImage img;

  // Float variables
  float size;
  float angle;
  float speed;
  float topSpeed;

  float G;
  float mass;

  //--------------------------CONSTRUCTOR--------------------------
  Attractor() {
    // Set a new value for the PVector variables
    location = new PVector(width/2, height/2 + 250);
    acceleration = new PVector(0, 0);
    velocity = new PVector(0, 0);

    // Load the image
    img = loadImage("attractor.png");

    // Set the float variables
    size = 50.0;
    angle = 0.0;
    speed = 1;
    
    mass = 100;
    G = 0.8;
    playerWeight = 5.0;
  }


  //----------------------------METHODS----------------------------

  // Method to display the Attractor ------------------------
  void display() {
    // Update location
    update();

    // Translate the origin point to the center of the screen
    translate(location.x, location.y);
    // Increment the angle and start a rotation
    angle += 0.15;
    rotate(angle);
    // Change the imageMode to Center and display the image 
    imageMode(CENTER);
    image(img, 0, 0, size, size);

    // Reset to default
    imageMode(CORNER);
    resetMatrix();
  }


  // Method to update location.x and .y -----------------------
  void update() {
    move();
    checkEdges();
    
    if (onSun()) {
      drag();
    }
    
    velocity.add(acceleration);
    velocity.limit(topSpeed);
    location.add(velocity);
  }


  // Method to move the Attractor ------------------------
  void move() {
    if (keyPressed) {
      // Move to the right
      if (keyCode == RIGHT) {
        // Reset the value of acceleration and add a value
        acceleration.y = 0;
        acceleration.x = 0;
        acceleration.x += speed; 
        // Set the topSpeed to 5
        topSpeed = 9;

        // Move to the Left
      } else if (keyCode == LEFT) {
        // Reset the value of acceleration and add a value
        acceleration.y = 0;
        acceleration.x = 0;
        acceleration.x -= speed; 
        // Set the topSpeed to 5
        topSpeed = 9;

        // Move Up
      } else if (keyCode == UP) {
        // Reset the value of acceleration and add a value
        acceleration.y = 0;
        acceleration.x = 0;
        acceleration.y -= speed;
        // Set the topSpeed to 5
        topSpeed = 9;

        // Move Down
      } else if (keyCode == DOWN) {
        // Reset the value of acceleration and add a value
        acceleration.y = 0;
        acceleration.x = 0;
        acceleration.y += speed; 
        // Set the topSpeed to 5
        topSpeed = 9;
      }
      // When dosen't move
    } else if (topSpeed > 0) {
      // Decrease the value of topSpeed until 0
      topSpeed -= speed/2;
    }
  }


  // Method to check edges ------------------------
  void checkEdges() {
    // Check if the player is on the LEFT edge
    if (location.x < 0) {
      // Stop the speed, and "bump" the player
      topSpeed = 0;
      location.x ++;

      // Check if the player is on the RIGHT edge
    } else if (location.x > width) {
      // Stop the speed, and "bump" the player
      topSpeed = 0;
      location.x --;

      // Check if the player is on the UP edge
    } else if (location.y < 0) {
      // Stop the speed, and "bump" the player
      topSpeed = 0; 
      location.y ++;

      // Check if the player is on the DOWN edge
    } else if (location.y > height) {
      // Stop the speed, and "bump" the player
      topSpeed = 0; 
      location.y --;
    }
  }
  
  
  // Method to apply a force to an object ------------------------
  void applyForce(PVector force) {
    // force / mass
    PVector f = PVector.div(force, mass);
    // acceleration + force / mass
    acceleration.add(f);
  }
  
  
  // Method to apply a friction over the sun ------------------------
  void drag() {
    // formula to create a new speed over the sun
    float newSpeed = velocity.mag();
    float dragMagnitude = 40 * newSpeed * newSpeed;
    
    // Create a new copy of velocity
    PVector drag = velocity.copy();
    drag.mult(-1);
    drag.normalize();
    
    // Amplify the velocity
    drag.mult(dragMagnitude);
    // Aplly the new force
    applyForce(drag);
  }


  // PVector to create an attract force on stars ------------------------
  PVector attractStars(Star stars) {
    // Determine the distance from to vector point
    PVector force = PVector.sub(location, stars.location);
    float distance = force.mag();
    // Keep the effect in control
    distance = constrain(distance, 5.0, 15.0);

    force.normalize();
    // Formula of attraction
    float strength = (G * mass * stars.mass) / (distance * distance);
    // Multiply force by strength
    force.mult(strength);

    return force;
  }


  // PVector to create an attract force on planets ------------------------
  PVector attractPlanets(Planet planets) {
    // Determine the distance from to vector point
    PVector force = PVector.sub(location, planets.location);
    float distance = force.mag();
    // Keep the effect in control
    distance = constrain(distance, 5.0, 15.0);

    force.normalize();
    // Formula of attraction
    float strength = (G * mass * planets.mass) / (distance * distance);
    // Multiply force by strength
    force.mult(strength);

    return force;
  }


  // PVector to create an attract force on asteroids ------------------------
  PVector attractAsteroids(Asteroid asteroids) {
    // Determine the distance from to vector point
    PVector force = PVector.sub(location, asteroids.location);
    float distance = force.mag();
    // Keep the effect in control
    distance = constrain(distance, 5.0, 15.0);

    force.normalize();
    // Formula of attraction
    float strength = (G * mass * asteroids.mass) / (distance * distance);
    // Multiply force by strength
    force.mult(strength);

    return force;
  }
  
  
  // Boolean to check if the player is over the sun -----------------------
  boolean onSun() {
    // Chek if the player hitbox is on the sun
    if (location.x > planets[6].location.x - size  &&  
    location.x < planets[6].location.x + size  &&
    location.y > planets[6].location.y - size &&  
    location.y < planets[6].location.y + size) {
       
      return true;
      // If not
    } else {
      return false;
    }
  }
}