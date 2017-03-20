class System {
  System() {
    //---------------------------------------------------------------
    //-------------------------BEES SETUP----------------------------
    //---------------------------------------------------------------
    // Create a new array of stars
    bee = new Bees[15];

    // Initialise every stars with a random start position
    for (int i = 0; i < bee.length; i++) {
      bee[i] = new Bees(width/2, height/2);
    }
    
    
    //---------------------------------------------------------------
    //-------------------------METEO SETUP---------------------------
    //---------------------------------------------------------------
    meteo = new ArrayList<MeteoSystem>();
    meteo.add(new MeteoSystem(new PVector(width/2, 0 - 20)));
  } 
}