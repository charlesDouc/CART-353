class Texture {
  // Create int variable for searching the right texture
  int type;
  int index;
  // Boolean variable to chek if it's top or not
  boolean top;
  
  // The img texture
  PImage blockTexture;
  
  
  //--------------------------CONSTRUCTOR--------------------------
  Texture(int typeRefe, int indexRefe, boolean topRefe) {
    // Attribute the data into the variables
    type = typeRefe; 
    index = indexRefe;
    top = topRefe;
    
    // Load the image (chek if its a top block or not)
    if (top) {
      // Load the appropriate file name
      blockTexture = loadImage("texture/texture_" + type + "-" + index + "_top.jpg");
    } else {
      // Load the appropriate file name
      blockTexture = loadImage("texture/texture_" + type + "-" + index + ".jpg");
    }
  }
  
  
  //----------------------------METHODS----------------------------
  
  // Method to display the image
  void display(float x, float y, int size) {
    // display the texture
    image(blockTexture, x, y, size, size);
  }
}