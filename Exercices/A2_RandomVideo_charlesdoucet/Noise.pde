class Noise {
  
  // Float variable
  float atomic = 0;
  
  //---------------------CONSTRUCTOR---------------------
  Noise() {
  }
  
  //-----------------------METHODS-----------------------
  
  // Method to create a 2D noise 
  void createNoise() {
    // Call all pixels
    loadPixels();
    
    // float variable xOff
    float xOff = 0.0; 

    // Select all the pixels on X axe
    for (int x = 0; x < width; x++) {
    // Float yOff variable
      float yOff = 0.0;
      
      // Select all pixels on the y Axe
      for (int y = 0; y < height; y++) {
        // Create a variable for each colors and create a noise effect
        float brightR = map(noise(xOff,yOff),0,1,0,200); 
        float brightG = map(noise(xOff,yOff),0,1,0,255); 
        float brightB = map(noise(xOff,yOff),0,1,0,150); 
   
        // Attribute those variable into a color function.
        // Set a new color for each pixels selected
        pixels[x+y*width] = color(brightR, brightG, brightB, atomic);
        
        // Increment yoff.
        yOff += 0.01; 
      }
      
      // Increment xoff.
      xOff += 0.01;  
    }
    
    // Update the pixels
    updatePixels();
  }
  
  
  // Method to activate the explosion effect
  void explosion() {
    atomic += 20;
  }
  
  
  // Method to reset the effect
  void resetExplosion() {
    atomic = 0;
  }
}