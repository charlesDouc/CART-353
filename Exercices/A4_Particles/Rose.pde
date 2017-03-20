//---------------------------------------------------------------
//-----------------------------CLASS-----------------------------
//---------------------------------------------------------------
class Rose {
  // PVector variables
  PVector location;
  PVector acceleration;
  PVector velocity;
  
  // Image variable 
  PImage img;

  // Float variables
  float sizeW;
  float sizeH;

  float G;
  float mass;
  
  //--------------------------CONSTRUCTOR--------------------------
  Rose() {
    // Set a new value for the PVector variables
    location = new PVector(370, 170);
    acceleration = new PVector(0, 0);
    velocity = new PVector(0, 0);
    
    // Load the image
    img = loadImage("rose.png");
    
    // Set the float variables
    sizeW = 137.0;
    sizeH = 117.0;
    
    mass = 5;
    G = 3.8;
  }
  
  //----------------------------METHODS----------------------------
  
  // Method to display the rose --------------------------
  void display() {
    // Change the imageMode to Center and display the image 
    imageMode(CENTER);
    image(img, location.x, location.y, sizeW, sizeH);

    // Reset to default
    imageMode(CORNER);
  }
  
  
  // Method to apply a force to an object -----------------
  void applyForce(PVector force) {
    // force / mass
    PVector f = PVector.div(force, mass);
    // acceleration + force / mass
    acceleration.add(f);
  }
  
  
  // PVector to create an attract force on bees -----------
  PVector attractBees(Bees bee) {
    // Determine the distance from to vector point
    PVector force = PVector.sub(location, bee.location);
    float distance = force.mag();
    // Keep the effect in control
    distance = constrain(distance, 5.0, 15.0);

    force.normalize();
    // Formula of attraction
    float strength = (G * mass * bee.mass) / (distance * distance);
    // Multiply force by strength
    force.mult(strength);

    return force;
  }
  
  
  
}