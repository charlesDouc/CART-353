/*----------------------------*/
/*-------Charles Doucet-------*/
/*---------A1 - Images--------*/
/*----------01/24/17----------*/
/*----------------------------*/


// Need to install the sound library
import processing.sound.*;

// Class Variables
Austria imgA;
Croatia imgB;
Portugal imgC;

// Variables for interactive counts
int clickCounts;
int keyCounts;

// WhiteNoise variables
WhiteNoise noise;
float amp = 0.0;

//-----------------------------------------------------------
//--------------------------SETUP----------------------------
//-----------------------------------------------------------
void setup() {
  // Set the size of the canvas to 500px by 500px
  size(500, 500);
  
  // Initialize variables
  imgA = new Austria();
  imgB = new Croatia();
  imgC = new Portugal();
  
  // Initialize clickCounts to 0
  clickCounts = 0;
  keyCounts = 0;
  
  // Initialize the white noise and play it
  noise = new WhiteNoise(this);
  noise.play();
}


//-----------------------------------------------------------
//--------------------------DRAW-----------------------------
//-----------------------------------------------------------
void draw() {
  // Set the background to black
  background(0);
  // Set the noise soud to 0;
  noise.amp(amp);
  
  
  // Change the image everytime the user click with the mouse
  if (clickCounts == 0) {
    imgA.display();
  } else if (clickCounts == 1) {
    imgB.display();
  } else {
    imgC.display();
  }
  
  
  // Create a static effect when the mouse is pressed
  if (mousePressed) {
    // Visual effect
    staticScreen();
    // Activate sound effect
    amp = 0.1;
  } else {
    // Desactivate sound effect
    amp = 0.0;
  }
}


//-----------------------------------------------------------
//-----------------------FUNCTIONS---------------------------
//-----------------------------------------------------------

// Function for when the mouse is pressed
void mousePressed() {
  // Condition for counting the numbers of click
  if (clickCounts < 2) {
    // Add value of clickCounts
    clickCounts ++;
  } else {
    // Return clickCounts to 0
    clickCounts = 0;
  }
}


// Save option when a key is pressed 
void keyPressed() {
  // Create a file image in the programm folder
  save("screenshot_" + keyCounts + ".jpg");
  // Add one to the keyCounts
  keyCounts ++;
}


// Function for displaying a static screen
void staticScreen() {
  // Call all the pixels
  loadPixels();
    
  // Loop to change the values of each pixel in the canvas
  for (int i = 0; i < pixels.length; i ++) {
    // Create 3 floats variable that are going to hold a random number (for colour)
    float randR = random(255);
    float randG = random(255);
    float randB = random(255);
      
    // Create a color with the random values
    color c = color(randR, randG, randB);
      
    // Attribute this color to the pixels
    pixels[i] = c;
  }
  updatePixels();
}