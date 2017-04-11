//---------------------------------------------------------------
//-----------------------------CLASS-----------------------------
//---------------------------------------------------------------
class particleSystem {
  // Arraylist of particles
  ArrayList<particleSprite> sprites;
  ArrayList<particleTriangle> triangles;
  // PVector variables
  PVector origin;
  
  
  //--------------------------CONSTRUCTOR--------------------------
  particleSystem() {
    // Arraylist of particles
    sprites = new ArrayList<particleSprite>();
    triangles = new ArrayList<particleTriangle>();
  }
  
  
  //----------------------------METHODS----------------------------
  // Method to activate the particles Sprite -----------------
  void run() {
    // Call the iterator
    Iterator<particleSprite> it = sprites.iterator();
    
    // Always spaw a new particule
    while (it.hasNext()) {
      particleSprite d = it.next();
      d.spawn();
      
      // Kill a particle if it's dead
      if (d.isDead()) {
        it.remove();
      }
    }
  }
  
  // Method to add a particle -----------------------
  void addParticle(PVector position) {
    sprites.add(new particleSprite(position));
  }
  
  
  // Method to activate the particles RAM -----------------
  void runRAM() {
    // Call the iterator
    Iterator<particleTriangle> it = triangles.iterator();
    
    // Always spaw a new particule
    while (it.hasNext()) {
      particleTriangle d = it.next();
      d.spawn();
      
      // Kill a particle if it's dead
      if (d.isDead()) {
        it.remove();
      }
    }
  }
  
  // Method to add a particle -----------------------
  void addParticleRAM(PVector position, int level) {
    triangles.add(new particleTriangle(position, level));
  }
}