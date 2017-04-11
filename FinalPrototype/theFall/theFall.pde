/*-------------------------------------------------------------*/
/*-------------------------------------------------------------*/
/*-------------------------------------------------------------*/
/*                                                             */
/*The Fall                                                     */
/*By Charles Doucet                                            */
/*April 2017                                                   */
/*                                                             */
/*-------------------------------------------------------------*/
/*                                                             */
/*Musics:                                                      */
/*'Honjou Oiwake (Instrumental)' by Omodaka"                   */
/*'Panacea' by Disasterpeace                                   */
/*'Chimp Rave' by Manu Delago                                  */
/*                                                             */
/*-------------------------------------------------------------*/
/*                                                             */
/*NOTES:                                                       */
/*You'll find many errors similar to this one                  */
/*ERROR: /node/free: Node id -1 out of range                   */
/*                                                             */
/*This is the sound library from Processing that dosen't       */
/*like working with classes. However, those errors don't       */
/*disturb the software and are known by the library's creator. */
/*                                                             */
/*-------------------------------------------------------------*/
/*-------------------------------------------------------------*/
/*-------------------------------------------------------------*/

// Needed for sounds
import processing.sound.*;
// Needed for iterator
import java.util.Iterator;

//---------------------------------------------------------------
//-----------------------------SETUP-----------------------------
//---------------------------------------------------------------
void setup() {
  fullScreen();
  noCursor(); //<>//
  // Set all the game
  gameSet = new Setting();
  // Set the inputs
  cancelInput = false;
  
  //--------------Sound Setup----------------
  bootUpSound = new SoundFile(this, "sounds/bootUp.mp3");
  startButton = new SoundFile(this, "sounds/start.wav");
  glitchSound = new SoundFile(this, "sounds/soundLag.mp3");
  crash = new SoundFile(this, "sounds/soundLag2.mp3");
  flash = new SoundFile(this, "sounds/flash.wav");
  boom = new SoundFile(this, "sounds/boom.wav");
  corruptedSound = new SoundFile(this, "sounds/corrupted.wav");
  goUp = new SoundFile(this, "sounds/goUp.wav");
  talkSound = new SoundFile(this, "sounds/talk.wav");
  beep = new SoundFile(this, "sounds/beep.wav");
  
  lv1_music = new SoundFile(this, "sounds/HonjouOiwake.mp3");
  lv1g_music = new SoundFile(this, "sounds/HonjouOiwakeGlitch.mp3");
  lv4_music = new SoundFile(this, "sounds/Panacea.mp3");
  lv5_musicStart  = new SoundFile(this, "sounds/level5start.mp3");
  lv5_music = new SoundFile(this, "sounds/firstSegment.mp3");
  lv6_music = new SoundFile(this, "sounds/lastSegment.mp3");
  lv7_music = new SoundFile(this, "sounds/finalSegment.mp3");
}


//---------------------------------------------------------------
//-----------------------------DRAW------------------------------
//---------------------------------------------------------------
void draw() {
  background(0);
  // Launch the menu
  menu.play();
}


//---------------------------------------------------------------
//----------------------------INPUT------------------------------
//---------------------------------------------------------------
void keyPressed() {
  if (!cancelInput) {
    // If key pressed change boolean to true
    // (Able the user to press different key at the same time)
    if (keyCode == RIGHT) rightPressed = true;
    if (keyCode == LEFT) leftPressed = true;
    if (key == 32) spacePressed = true;
  }
  // Exit key is on escape  
  if (key == 27)  exit();  
}

void keyReleased() {
  // If key released change boolean to false
  if (keyCode == RIGHT) rightPressed = false;
  if (keyCode == LEFT) leftPressed = false;
  if (key == 32) spacePressed = false;
  
  // Exit key is on escape 
  if (key == 27)  exit();  
}


//---------------------------------------------------------------
//-----------------------GLOBAL VARIABLES------------------------
//---------------------------------------------------------------

// Setting variables
Setting gameSet;
Scenary scenary;

// Input variable
boolean rightPressed, leftPressed, spacePressed;
boolean cancelInput;

// Level variables
Menu menu;
Level_1 level_1;
Level_2 level_2;
Level_3 level_3;
Level_1_Glitch level_1_Glitch;
Level_4 level_4;
Level_5 level_5;
Level_6 level_6;
Level_7 level_7;
Level_1_Final level_1_Final;

// Scene Variables
fallingInto sceneFallingInto;
FictualLoad load_1;
FictualMenu fakeMenu;

// Sound variables for the sound---
SoundFile bootUpSound;
SoundFile startButton;
SoundFile glitchSound;
SoundFile crash;
SoundFile flash;
SoundFile boom;
SoundFile corruptedSound;
SoundFile goUp;
SoundFile talkSound;
SoundFile beep;

SoundFile lv1_music;
SoundFile lv1g_music;
SoundFile lv4_music;
SoundFile lv5_musicStart;
SoundFile lv5_music;
SoundFile lv6_music;
SoundFile lv7_music;