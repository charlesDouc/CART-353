class System {
  System() {
    // Initiate world and attractor
    level = new World();
    player = new Attractor();

    //---------------------------------------------------------------
    //-------------------------STARS SETUP---------------------------
    //---------------------------------------------------------------
    // Create a new array of stars
    stars = new Star[55];

    // Initialise every stars with a random start position
    for (int i = 0; i < stars.length; i++) {
      stars[i] = new Star(random(width), random(height));
    }


    //---------------------------------------------------------------
    //-----------------------PLANETS SETUP---------------------------
    //---------------------------------------------------------------
    // Create a new array of planets
    planets = new Planet[7];
    float middleX = width/2;

    // Initialise every planets
    // Planet(x, index, rotation, newSize, newMass)
    planets[0] = new Planet(middleX - 370, 3, -0.01, 60, 50);
    planets[1] = new Planet(middleX - 220, 1, 0.005, 100, 400);
    planets[2] = new Planet(middleX + 200, 2, 0.007, 70, 200);
    planets[3] = new Planet(middleX - 520, 5, -0.002, 120, 100);
    planets[4] = new Planet(middleX + 370, 4, 0.001, 150, 800);
    planets[5] = new Planet(middleX + 550, 6, -0.005, 40, 25);
    // Sun
    planets[6] = new Planet(middleX - 5, 7, -0.0005, 200, 1600);


    //---------------------------------------------------------------
    //----------------------ASTEROID SETUP---------------------------
    //---------------------------------------------------------------
    // Create a new array of asteroids
    asteroids = new Asteroid[3];

    // Initialise every asteroids
    // Planet(x, y, index, rotation, newSize, newMass)
    asteroids[0] = new Asteroid(width/3, -50, 1, -0.01, 40, 50);
    asteroids[1] = new Asteroid(width + 50, 200, 2, 0.07, 55, 150);
    asteroids[2] = new Asteroid(width - 400, height + 50, 3, -0.04, 60, 350);
  }
}