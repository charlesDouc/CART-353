//---------------------------------------------------------------
//-----------------------------CLASS-----------------------------
//---------------------------------------------------------------
class Plant {
  // PVector variables
  PVector location;
  
  // Image variable
  PImage img;

  // Float variables
  float sizeW;
  float sizeH;
  
  //--------------------------CONSTRUCTOR--------------------------
  Plant() {
    // Set a new value for the PVector variables
    location = new PVector(285, 210);
    
    // Load the image
    img = loadImage("plant.png");
    
    // Set the float variables
    sizeW = 160.0;
    sizeH = 190.0;
  }
  
  //----------------------------METHODS----------------------------
  
  // Method to display the plant --------------------------
  void display() {
    // Display the image 
    image(img, location.x, location.y, sizeW, sizeH);
  }
}