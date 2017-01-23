class Croatia {
  PImage croatia;
  
  // Constructor ------------------------------------
  Croatia () {
    croatia = loadImage("croatia.jpg");
  }
  
  // Display ----------------------------------------
  void display() {
    imageEffect();
  }
  
  
  // Methods ----------------------------------------
  
  // Method to add an effect to the image
  void imageEffect() {
    // Call all pixels
    loadPixels();
    
    // For loop - creating the effect
    for (int x = 0; x < croatia.width; x++) {
      for(int y = 0; y < croatia.width; y++) {     
        // Determine all the pixels
        // Use the formula to calculate the width (number) of the pixels (x + y * width)
        int loc = x + y * croatia.width;
        
        // Get the colors in RGB 
        // Use the loc variable to select all pixels of the image
        float r = red(croatia.pixels[loc]);
        float g = green(croatia.pixels[loc]);
        float b = blue(croatia.pixels[loc]);
        
        
        // Track the mouse position
        float colorEffect = map(mouseY, 0, height, 5, 0);
        
        // Adjust the colors on the pixels using the data from r and b
        r *= colorEffect;
        b *= colorEffect;
        // Make sure that the value is between 0 and 255
        r = constrain(r, 50, 255);
        b = constrain(b, 50, 255);
        
        // Make a new color with all the data collected
        color c = color(r, g, b);
        // Apply the new color value to the pixels
        pixels[loc] = c; 
      }
    }
    // Actualize the pixels on screen
    updatePixels();
  }

}