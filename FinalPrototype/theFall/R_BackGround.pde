//---------------------------------------------------------------
//-----------------------------CLASS-----------------------------
//---------------------------------------------------------------
class Background {
  
  // Int variables
  int level;
  int index;

  // PVector variable
  PVector position;
  
  // Image variable
  PImage bg;
  
  // Boolean to center the background
  boolean center;
  
  //--------------------------CONSTRUCTOR--------------------------
  Background(int x, int y, int levelRefe, int indexRefe, boolean imageAlign) {
    // Update the variables 
    position = new PVector(x, y);
    level = levelRefe;
    index = indexRefe;
    center = imageAlign;
    
    // Load the image
    bg = loadImage("bg/" + level + "-" + index + ".jpg");
  }
  
  
  //----------------------------METHODS----------------------------
  // Method to load the background and display it
  void display() {
    if (center) {
      imageMode(CENTER);
    } else {
      imageMode(CORNER);
    }
    image(bg, position.x, position.y);
    imageMode(CORNER);
  }
}