//---------------------------------------------------------------
//-----------------------------CLASS-----------------------------
//---------------------------------------------------------------
class MeteoSystem {
  // Arraylist of particles
  ArrayList<Rain> drop;
  // PVector variables
  PVector origin;

  
  
  //--------------------------CONSTRUCTOR--------------------------
  MeteoSystem(PVector location) {
    // Set a new value for the PVector variables
    origin = location.get();
    drop = new ArrayList<Rain>();
  }
  
  //----------------------------METHODS----------------------------
  // Method to add a particle
  void addParticle() {
    drop.add(new Rain(origin));
  }
  
  // Method to run all particles
  void run() {
    // Call the iterator
    Iterator<Rain> it = drop.iterator();
    
    // Always spaw a new particule
    while (it.hasNext()) {
      Rain d = it.next();
      d.spawn();
      
      // Kill a particle if it's dead
      if (d.isDead()) {
        it.remove();
      }
    }
  }
}