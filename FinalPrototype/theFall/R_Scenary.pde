//---------------------------------------------------------------
//-----------------------------CLASS-----------------------------
//---------------------------------------------------------------
class Scenary {
  
  // Images Game World varibales
  PImage tree;
  PImage treeGlitch;
  PImage flower;
  PImage flowerGlitch;
  PImage winPanel;
  PImage cloud;
  PImage glitch;
  
  // Images Computer World varibales
  PImage lineTree1;
  PImage lineTree2;
  PImage lineTree3;
  PImage lineTree1R;
  PImage lineTree2R;
  PImage lineTree3R;  
  PImage hub;
  PImage Flynn;
  
  //--------------------------CONSTRUCTOR--------------------------
  Scenary() {
    // Initialize Game World Variables
    tree = loadImage("gameWorld/tree1.png");
    treeGlitch = loadImage("gameWorld/tree2.png");
    flower = loadImage("gameWorld/flower1.png");
    flowerGlitch = loadImage("gameWorld/flower2.png");
    cloud = loadImage("gameWorld/cloud1.png");
    winPanel = loadImage("gameWorld/win1.png");
    glitch = loadImage("gameWorld/glitch.jpg");
    
    // Initialize Computer World Variables
    lineTree1 = loadImage("computerWorld/tree1.png");
    lineTree2 = loadImage("computerWorld/tree2.png");
    lineTree3 = loadImage("computerWorld/tree3.png");
    lineTree1R = loadImage("computerWorld/tree1-reverse.png");
    lineTree2R = loadImage("computerWorld/tree2-reverse.png");
    lineTree3R = loadImage("computerWorld/tree3-reverse.png");
    hub = loadImage("computerWorld/hub.png");
    Flynn = loadImage("computerWorld/flynn.png");
  }
  
  
  //----------------------------METHODS----------------------------
  
  // ......................   GAME WORLD   ........................
  // Method to display a Tree -------------------------------------
  void displayTree(PVector location) {
    float sizeH = 383;
    // Display it!
    image(tree, location.x, location.y - sizeH);
  }
  
  // Method to display a Flower ----------------------------------
  void displayFlower(PVector location) {
    float sizeH = 38;
    // Display it!
    image(flower, location.x, location.y - sizeH);
  }
  
  // Method to display a Flower ----------------------------------
  void displayWinPanel(PVector location) {
    float sizeH = 115;
    // Display it!
    image(winPanel, location.x, location.y - sizeH);
  }
  
  // Method to display a Glitch ----------------------------------
  void displayGlitch(PVector location) {
    float sizeH = 115;
    // Display it!
    image(glitch, location.x, location.y - sizeH);
  }
  
  // Method to display a FlowerGlitch ----------------------------------
  void displayFlowerGlitch(PVector location) {
    float sizeH = 38;
    // Display it!
    image(flowerGlitch, location.x, location.y - sizeH);
  }
  
  // Method to display a FlowerGlitch ----------------------------------
  void displayTreeGlitch(PVector location) {
    float sizeH = 383;
    // Display it!
    image(treeGlitch, location.x, location.y - sizeH);
  }
  
  
  // ...................   COMPUTER WORLD   ........................
  // Method to display a line Tree ---------------------------------
  void displayLineTree(PVector location, int index) {
    float sizeH = 385;
    // Display it depending on the index
    if (index == 1) {
      image(lineTree1, location.x, location.y - sizeH);
    } else if (index == 2) {
      image(lineTree2, location.x, location.y - sizeH);
    } else if (index == 3) {
      image(lineTree3, location.x, location.y - sizeH);
    }
  }
  
  // Method to display a line Tree ---------------------------------
  void displayLineTreeReverse(PVector location, int index) {
    // Display it depending on the index
    if (index == 1) {
      image(lineTree1R, location.x, location.y + 16);
    } else if (index == 2) {
      image(lineTree2R, location.x, location.y + 16);
    } else if (index == 3) {
      image(lineTree3R, location.x, location.y + 16);
    }
  }
  
  // Method to display a FlowerGlitch ----------------------------------
  void displayHub(PVector location) {
    // Display it!
    image(hub, location.x, location.y);
  }
  
  // Method to display a flynn ----------------------------------
  void displayFlynn(PVector location) {
    // Display it!
    image(Flynn, location.x, location.y);
  }
  
  
}