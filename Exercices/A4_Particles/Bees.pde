//---------------------------------------------------------------
//-----------------------------CLASS-----------------------------
//---------------------------------------------------------------
class Bees {
  // PVector variables
  PVector location;
  PVector origin;
  PVector acceleration;
  PVector velocity;
  
  // Image variable 
  PImage img;

  // Mass and size
  int size;
  float mass;

  
  //--------------------------CONSTRUCTOR--------------------------
  Bees(float x, float y) {
    // Set a new value for the PVector variables
    location = new PVector(x, y);
    origin = new PVector(x, y);
    acceleration = new PVector(0, 0);
    velocity = new PVector(random(-1, 1), random(-2,0));
    
    // Load the image
    img = loadImage("bee.png");
    
    // Set the size and the mass
    size = int(random(10, 20));
    mass = 3;
  }
  
  //----------------------------METHODS----------------------------
  
  // Method to spawn the bees ---------------------------
  void spawn() {
    update();
    display();
  }
  
  
  // Method to update the bees --------------------------
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    // Reset the acceleration value
    acceleration.mult(0);
  }
  
  
  // Method to apply a force to an object ------------------------
  void applyForce(PVector force) {
    // force / mass
    PVector f = PVector.div(force, mass);
    // acceleration + force / mass
    acceleration.add(f);
  }
  
  
  // Method to display the bee --------------------------
  void display() {
    // Change the imageMode to Center and display the image 
    imageMode(CENTER);
    image(img, location.x, location.y, size, size);

    // Reset to default
    imageMode(CORNER);
  }
  
  
  // Method to fly away the bees ------------------------
  void ifRain() {
    PVector d = new PVector(random(0.0, 0.07), random(0.0, 0.07));
    acceleration.add(d);
  }
  
  // Method to reset the bees position
  void backToRose() {
    if (location.x > origin.x) {
      PVector d = new PVector(-0.07, 0);
      acceleration.add(d);  
    }
    
    if (location.x < origin.x) {
      PVector d = new PVector(0.07, 0);
      acceleration.add(d);  
    }
    
    if (location.y > origin.y) {
      PVector d = new PVector(0, -0.07);
      acceleration.add(d);  
    }
    
    if (location.y < origin.y) {
      PVector d = new PVector(0, 0.07);
      acceleration.add(d);  
    }
  }
}