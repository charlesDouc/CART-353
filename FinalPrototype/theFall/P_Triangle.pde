//---------------------------------------------------------------
//-----------------------------CLASS-----------------------------
//---------------------------------------------------------------
class particleTriangle {
  // PVector variables
  PVector location;
  PVector acceleration;
  PVector velocity;
  
  // Image variable 
  PImage img;
  
  int index;
  int sizeW;
  int sizeH;
  float mass;
  float lifeSpan;
  
  // float for rotation
  float angle;
  float speed;
  int negative;
  
  //--------------------------CONSTRUCTOR--------------------------
  particleTriangle(PVector origin, int level) {
    // Set a new value for the PVector variables
    location = origin.get();
    acceleration = new PVector(0, -0.05);
    velocity = new PVector(random(-1, 1), random(-2,0));
    // Pick a random number for the index
    index = int(random(1, 4));
    sizeW = int(random(20, 150));
    sizeH = int(random(20, 150));
    negative = int(random(1, 3));
    
    if (level == 2) {
      // Load the image
      img = loadImage("computerWorld/trian" + index + "B.png");
    } else {
      img = loadImage("computerWorld/trian" + index + ".png");
    }
    
    // Set the float variables
    mass = 3;
    angle = 0.0;
    if (negative == 1) {
      speed = - 0.05;
    } else {
      speed = 0.05;
    }
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
    pushMatrix();
    translate(location.x, location.y);
    
    angle += speed;
    rotate(angle);
    image(img, 0, 0, sizeW, sizeH);
    
    // Reset imageMode and translate to default
    popMatrix();
    imageMode(CORNER);
  }
  
  
  // Boolean to chek if the particule is dead
  boolean isDead() {
    // If the raindrop goes out of the screen, declare it dead.
    if (location.y < 0 - sizeH) {
      return true;
    } else {
      return false;
    }
  }
}