class Austria {
  PImage austria;
  
  // Constructor ------------------------------------
  Austria () {
    // Load image
    austria = loadImage("austria.jpg");
  }
  
  
  // Display ----------------------------------------
  void display() {
    image(austria, 0, 0);
    imageEffect();
  }
  
  
  // Methods ----------------------------------------
  
  // Method to add an effect to the image
  void imageEffect() {
    // Call all pixels
    loadPixels();
    
    // For loop - creating the effect
    for (int x = 0; x < austria.width; x++) {
      for (int y = 0; y < austria.height; y++) {
        // Determine all the pixels
        // Use the formula to calculate the width (number) of the pixels (x + y * width)
        int loc = x + y * austria.width;
        
        // Get the colors in RGB 
        // Use the loc variable to select all pixels of the image
        float r = red(austria.pixels[loc]);
        float g = green(austria.pixels[loc]);
        float b = blue(austria.pixels[loc]);
        
        
        // Create a spotlight effect using the distance of the mouse
        // Track the mouse position
        float distance = dist(x, y, mouseX, mouseY);
        float lightEffect = map(distance, 0, 150, 3, 0);
        
        // Adjust the colors on the pixels using the data from r,g and b
        r *= lightEffect;
        g *= lightEffect;
        b *= lightEffect;
        // Make sure that the value is between 0 and 255
        r = constrain(r, 50, 255);
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