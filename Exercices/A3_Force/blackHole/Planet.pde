//---------------------------------------------------------------
//-----------------------------CLASS-----------------------------
//---------------------------------------------------------------
class Planet {
  // PVector variables
  PVector location;
  PVector acceleration;
  PVector velocity;

  // Image variable
  PImage img;

  // Float variables
  float size;
  float angle;
  float angleSpeed;

  // Activating variables
  float overCount;
  boolean firstActivate;

  // Float for mass
  float mass;


  //--------------------------CONSTRUCTOR--------------------------
  Planet(float x, int index, float rotation, float newSize, float newMass) {
    // Set a new size and mass
    size = newSize;
    mass = newMass;

    // Set the activating variables
    overCount = 0;
    firstActivate = false;

    // Set the rotation variables
    angle = 0.0;
    angleSpeed = rotation;

    // Initialize PVector variables
    location = new PVector(x, height/2);
    acceleration = new PVector(0, 0);
    velocity = new PVector(0, 0);

    // Load the image with the reference (index)
    img = loadImage("planet" + index + ".png");
  }


  //----------------------------METHODS----------------------------

  // Method to display the Planets ------------------------
  void display() {    
    // Translate the origin point to the center of the screen
    translate(location.x, location.y);
    // Increment the angle and start a rotation
    angle += angleSpeed;
    rotate(angle);
    // Change the imageMode to Center and display the image 
    imageMode(CENTER);
    image(img, 0, 0, size, size);

    // Reset to default
    imageMode(CORNER);
    resetMatrix();

    // If the force is activate
    if (activate()) {
      // Keep the force activate
      overCount ++;

      // Add one time the weight of the object to the playerWeight
      if (!firstActivate) {
        playerWeight += mass;
        firstActivate = !firstActivate;
      }
    }
  }


  // Method to apply a force to an object ------------------------
  void applyForce(PVector force) {
    // force / mass
    PVector f = PVector.div(force, mass);
    // acceleration + force / mass
    acceleration.add(f);
  }


  // Update the location of the planet ------------------------
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    // Reset the acceleration value
    acceleration.mult(0);
  }


  // Boolean to activate the gravity force ------------------------
  boolean activate() {
    // Chek if the player hitbox is on the object
    if (player.location.x > location.x - player.size  &&  
      player.location.x < location.x + size + player.size  &&
      player.location.y > location.y - player.size  &&  
      player.location.y < location.y + size + player.size &&
      // Chek if the playerWeight is bigger than the object and if it's 
      // the first time the player encounters with the object.
      chekWeight()  ||  overCount > 0) {
      return true;
      // If not
    } else {
      return false;
    }
  }


  // Boolean to check the object weight  ------------------------
  boolean chekWeight() {
    if (playerWeight > mass) {
      return true;
    } else {
      return false;
    }
  }
}