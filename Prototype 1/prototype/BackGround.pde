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
  
  //--------------------------CONSTRUCTOR--------------------------
  Background(int x, int y, int levelRefe, int indexRefe) {
    // Update the variables 
    position = new PVector(x, y);
    level = levelRefe;
    index = indexRefe;
    
    // Load the image
    bg = loadImage("bg/" + level + "-" + index + ".jpg");
  }
  
  
  //----------------------------METHODS----------------------------
  // Method to load the background and display it
  void display() {
    image(bg, position.x, position.y);
  }
}


//---------------------------------------------------------------
//-----------------------GLOBAL VARIABLES------------------------
//---------------------------------------------------------------

Background proto;