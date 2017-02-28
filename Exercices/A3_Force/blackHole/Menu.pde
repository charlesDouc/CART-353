//---------------------------------------------------------------
//-----------------------------CLASS-----------------------------
//---------------------------------------------------------------
class Menu {
  // Alpha Variable for fade out effect
  int alpha;

  // Icon of the game
  PImage icon;

  // Rotation variables
  float angle;
  float speed; 

  //--------------------------CONSTRUCTOR--------------------------
  Menu() {
    // Set alpha to 255 and load image
    alpha = 0;
    icon = loadImage("attractor.png");

    // Set the ratation variables
    angle = 0.0;
    speed = 0.05;
  }


  //----------------------------METHODS----------------------------

  // Method to display the menu
  void display() {
    blackHole();
    drawTitle();

    // If the game start
    if (startGame && !backMenu && alpha > 0) {
      // Fade out effect on menu
      alpha -= 3;
    } 

    // When the menu load
    if (backMenu && alpha < 255) {
      alpha += 3;
    }
  }


  // Method to draw the text of the menu
  void drawTitle() {
    // Center the text and fill the color
    textAlign(CENTER);
    fill(225, alpha);
    // Change the size to 160
    textFont(fontTitle, 160);
    text("Black Hole", width/2, height/2 + 180);
    // Change the size to 20
    textFont(fontTitle, 20);
    text("- Press any Key to Start -", width/2, height/2 + 250);

    // Corner the text and fill the color
    textAlign(CORNER);
    fill(100, alpha);
    // Change the size to 14
    textFont(fontCredit, 14);
    text("On the music 'The Water Shelf' by Disasterpeace", 20, height - 37);
    // Change the size to 14
    textFont(fontCredit, 14);
    text("Game made by Charles Doucet - 2017", 20, height - 20);
  }


  // Method to draw the icon
  void blackHole() {
    // Translate the origin point and change the imageMode
    translate(width/2, height/2 - 150);
    imageMode(CENTER);
    // Start a rotation on the origin point
    angle += speed;
    rotate(angle);

    // Change the tint for the fade effect and draw image
    tint(255, alpha);
    image(icon, 0, 0, 350, 350);

    // Reset all modification to default
    tint(255, 255);
    imageMode(CORNER);
    resetMatrix();
  }
}