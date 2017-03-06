//---------------------------------------------------------------
//-----------------------------CLASS-----------------------------
//---------------------------------------------------------------
class Block {
  
  Texture img;
  
  PVector position;
  int size;
  
  int type;
  int index;
  boolean top;
  
  //--------------------------CONSTRUCTOR--------------------------
  Block(int x, int y, int typeRefe, boolean topRefe) {
    // Attribute the new data into the variables
    position = new PVector(x, y);
    size = blockSize;
    
    // Reference for the texture selection
    type = typeRefe;
    index = int(random(1, 4));
    top = topRefe;
    
    img = new Texture(type, index, top);
  }
  
  
  //----------------------------METHODS----------------------------
  // Method to display the block
  void display() {
    img.display(position.x, position.y, size);
  }
  
}


//---------------------------------------------------------------
//-----------------------GLOBAL VARIABLES------------------------
//---------------------------------------------------------------

int blockSize = 50;