// Import video library into Processing
// Create a variable for the video
import processing.video.*;
Capture camera;

// Import java library (Normally there by default in Processing, but problems with new Processing version)
// Create a random variable
import java.util.*; 
Random generator;

// Create a class variable
Noise perlin;


//-----------------------------------------------------------
//--------------------------SETUP----------------------------
//-----------------------------------------------------------
void setup() {
  // Set the Size to 500 by 500
  size(500, 500);
  
  // Initialize camera variable and use star() function
  camera = new Capture(this, 512, 512);
  camera.start();
  
  // Initialize the generator variable
  generator = new Random();
  
  // Initialize perlin
  perlin = new Noise();
}


//-----------------------------------------------------------
//--------------------------DRAW-----------------------------
//-----------------------------------------------------------
void draw() {
  // Set the background to black
  background(0);
  
  // Add a tint effect when the mouse moves
  tint(mouseY, mouseY/2, 255);
  
  // Translate the origin to the middle of the display
  translate(width/2, height/2);
  // Change the image mode to center
  imageMode(CENTER);
  // Copy the image of the camera and put it on the display
  image(camera, 0, 0);
  
  
  // --------------------Spotlight effect--------------------
  
  // Add a vibrant spotlight effect
  // Set a random algorythm with the gaussian one (from Random class)
  float num = (float) generator.nextGaussian();
  // Create a sd float variable for the distance of step
  float sd = 10;
  // Variable for the mean (I want the center of the display)
  float mean = 0;
  // Deviation formula
  float x = sd * num + mean;
  
  // Cancel the stroke
  noStroke();
  // Set the fill to white and ad a transparacy effect
  fill(255,50);
  // Like the imageMode, ellipseMode set to Center
  ellipseMode(CENTER);
  // Draw an ellipse
  ellipse(x, 0, 520, 520);
  
  
  // -----------------------Mouse Event----------------------
  
  // If mouse is pressed
  if (mousePressed) {
    // Create the effect using a 2D Noise
    perlin.createNoise();
    perlin.explosion();
  } else {
    // Reset the effect so it can be create again
    perlin.resetExplosion();
  }
}


//-----------------------------------------------------------
//-----------------------FUNCTIONS---------------------------
//-----------------------------------------------------------

// Function to activate the capture of the camera
void captureEvent(Capture camera) {
  camera.read();
}