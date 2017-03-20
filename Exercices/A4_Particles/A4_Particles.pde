// Assignment #4 - Particles //
// Charles Doucet            //
// 03/21/17                  //



//---------------------------------------------------------------
//-----------------------------SETUP-----------------------------
//---------------------------------------------------------------
void setup() {
  // Set the size of the canvas
  size(700, 400);
  
  // Load the background
  bg = loadImage("bg.jpg");
  // Set all objects
  system = new System();
  
  // Initialize classes
  rose = new Rose();
  plant = new Plant();
}


//---------------------------------------------------------------
//-----------------------------DRAW------------------------------
//---------------------------------------------------------------
void draw() {
  // Display the background
  image(bg, 0, 0);
  
  // Display the plant and the rose
  plant.display();
  rose.display();
  
  // Make it rain when mouse is pressed
  for (MeteoSystem ps: meteo) {
    ps.run();
    if (mousePressed) {
      ps.addParticle();
    }
  }
  
  
  // Call all Bees objects 
  for (int i = 0; i < bee.length; i++) {
    // If it rains, make the bees go away
    if (mousePressed) {
      bee[i].ifRain();
    } else {
      // If not, the bees are going around the rose (not after a rain)
      PVector force = rose.attractBees(bee[i]);
      bee[i].applyForce(force);
    }
    // Spaw the bees
    bee[i].spawn();
  }
}


//---------------------------------------------------------------
//-----------------------GLOBAL VARIABLES------------------------
//---------------------------------------------------------------
// Needed for iterator
import java.util.Iterator;

// Bg variable
PImage bg;

// System variable
System system;
// ArrayList for meteo
ArrayList<MeteoSystem> meteo;

// Class variables
Rose rose;
Plant plant;
Bees [] bee;