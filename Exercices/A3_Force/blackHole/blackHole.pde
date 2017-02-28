
/*----------------NOTE----------------
All visuals are made by me. 
Using the music by Disasterpeace:
"The Water Shelf" - 2016








-------------------------------------*/



//---------------------------------------------------------------
//-----------------------------SETUP-----------------------------
//---------------------------------------------------------------
void setup() {
  // Set the size to fullScreen, the background black and delete the user's cursor
  fullScreen();
  background(0);
  noCursor();

  // Initiate the system and the menu
  system = new System();
  menu = new Menu();

  //Set font
  fontTitle = createFont("font/Mada-Regular.ttf", 16, true);
  fontCredit = createFont("font/Mada-Light.ttf", 16, true);

  // Load the background image
  bg = loadImage("bg.jpg");

  // Set the starting game variables to false
  firstClick = false;
  startGame = false;
  endGame = false;
  backMenu = true;

  // Load a soundfile from the /data folder of the sketch and play it back
  file = new SoundFile(this, "sound/TheWaterShelf.mp3");
  file.play();
}

//---------------------------------------------------------------
//-----------------------------DRAW------------------------------
//---------------------------------------------------------------
void draw() {
  // Display the background
  background(0);
  image(bg, 0, 0);

  // Display the menu
  menu.display();

  // If the user starts the game -----------------------
  if (startGame) {
    // Set the timer so the animation can be syncronysed
    currentTime = millis() - startTimer;
    backMenu = false;
    // after 2 sec
    if (currentTime > 2000) {
      // Play the game
      level.playGame();
    } 
    // Activate an asteroid 1
    if (currentTime > 35000) {
      level.activateAsteroid(0);
    }
    // Activate an asteroid 2
    if (currentTime > 75000) {
      level.activateAsteroid(1);
    }
    // Activate an asteroid 3
    if (currentTime > 110000) {
      level.activateAsteroid(2);
    }
    // After 2min30, stop the game
    if (currentTime > 152000) {
      endGame = true;
    } 
    // Restart the game and come back to the menu
    if (currentTime > 154000) {
      // Stop the music
      file.stop();
      // reset the game
      firstClick = false;
      setup();
      startGame = false;
    }
  }
}


//---------------------------------------------------------------
//--------------------------KEYPRESSED---------------------------
//---------------------------------------------------------------
void keyPressed() {
  if (!firstClick) {
    startGame = !startGame;
    firstClick = !firstClick;

    // Set startTimer
    startTimer = millis();
  }
}

//---------------------------------------------------------------
//-----------------------GLOBAL VARIABLES------------------------
//---------------------------------------------------------------

// Import the music to the processing file
import processing.sound.*;
SoundFile file;

// Object variables
System system;
World level;
Attractor player;
Menu menu;

// BackGround image
PImage bg;
// playerWeight
float playerWeight;

// Starting game variables
boolean startGame;
boolean firstClick;
boolean endGame;
boolean backMenu;


// Font variables
PFont fontTitle;
PFont fontCredit;

// Variables for timer
int startTimer;
int currentTime;

// Array objects variables
Star [] stars;
Planet [] planets;
Asteroid [] asteroids;