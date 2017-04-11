//---------------------------------------------------------------
//-----------------------------CLASS-----------------------------
//---------------------------------------------------------------
class Block {
  // Create a new Texture variable
  Texture img;
  
  // PVector for the position
  PVector location;
  
  // Size of blocks (INT)
  int size;
  // Variables for image reference
  int type;
  int index;
  boolean top;
  
  //--------------------------CONSTRUCTOR--------------------------
  Block(int typeRefe, int indexRefe, boolean topRefe) {
    size = blockSize;
    
    // Reference for the texture selection
    type = typeRefe;
    index = indexRefe;
    top = topRefe;
    
    // Initialize Texture
    img = new Texture(type, index, top);
  }
  
  
  //----------------------------METHODS----------------------------
  // Method to display the block
  void display(PVector newPosition) {
    location = newPosition;
    img.display(location.x, location.y, size);
  }
}


//---------------------------------------------------------------
//-----------------------GLOBAL VARIABLES------------------------
//---------------------------------------------------------------

// Size of all Blocks
int blockSize = 100;