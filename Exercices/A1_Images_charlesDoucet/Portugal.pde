class Portugal {
  PImage portugal;
  
  // Constructor ------------------------------------
  Portugal () {
    portugal = loadImage("portugal.jpg");
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
    for (int x = 0; x < portugal.width; x++) {
      for(int y = 0; y < portugal.width; y++) {     
        // Determine all the pixels
        // Use the formula to calculate the width (number) of the pixels (x + y * width)
        int loc = x + y * portugal.width;
        
        // Get the colors in RGB 
        // Use the loc variable to select all pixels of the image
        float r = red(portugal.pixels[loc]);
        float g = green(portugal.pixels[loc]);
        float b = blue(portugal.pixels[loc]);
        
        
        // Track the mouse position
        float colorEffect = map(mouseX, 0, width, 5, 0);
        
        // Adjust the colors on the pixels using the data from g and b
        g *= colorEffect;
        b *= colorEffect;
        // Make sure that the value is between 0 and 255
        g = constrain(g, 50, 255);
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