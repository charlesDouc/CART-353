//---------------------------------------------------------------
//-----------------------------CLASS-----------------------------
//---------------------------------------------------------------
class particleSprite {
  // PVector variables
  PVector location;
  PVector acceleration;
  PVector velocity;
  
  // Image variable 
  PImage img;

  // Float variables
  float size;
  
  int index;
  float mass;
  float lifeSpan;
  
  //--------------------------CONSTRUCTOR--------------------------
  particleSprite(PVector origin) {
    // Set a new value for the PVector variables
    location = origin.get();
    acceleration = new PVector(0, 0.05);
    velocity = new PVector(random(-1, 1), random(-2,0));
    // Pick a random number for the index
    index = int(random(1, 3));
    
    // Load the image
    img = loadImage("gameWorld/" + index + "sprite.png");
    
    // Set the float variables
    size = 99;
    mass = 3;
  }
  
  //----------------------------METHODS----------------------------
  // Method to spawn a particule ---------------------
  void spawn() {
    update();
    display();
  }
  
  
  // Method to update the particule ------------------
  void update() {
    // Make a force on the rain
    velocity.add(acceleration);
    location.add(velocity);
  }
  
  
  // Method to display the particule -----------------
  void display() {
    // Display the image and change imageMode
    imageMode(CENTER);
    image(img, location.x, location.y);
    
    // Reset imageMode to default
    imageMode(CORNER);
  }
  
  
  // Boolean to chek if the particule is dead
  boolean isDead() {
    // If the raindrop goes out of the screen, declare it dead.
    if (location.y > height + size) {
      return true;
    } else {
      return false;
    }
  }
}