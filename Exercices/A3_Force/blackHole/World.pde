//---------------------------------------------------------------
//-----------------------------CLASS-----------------------------
//---------------------------------------------------------------
class World {

  float alpha;

  //--------------------------CONSTRUCTOR--------------------------
  World() {
    alpha = 0;
  }


  //----------------------------METHODS----------------------------

  // Method to play the game -----------------------
  void playGame() {
    // For the fade effect
    if (!endGame && alpha < 255.0) {
      alpha += 10;
    } 
    if (endGame && alpha > 0.0) {
      alpha -= 10;
    }
    tint(255, alpha);

    // Call all stars objects 
    for (int i = 0; i < stars.length; i++) {
      // Display them
      stars[i].display();

      // If the player goes over the object, activate a force
      if (stars[i].activate()) {
        PVector force = player.attractStars(stars[i]);
        stars[i].applyForce(force);
        stars[i].update();
      }
    }

    // Call all planets objects 
    for (int i = 0; i < planets.length; i++) {
      // Display them
      planets[i].display();

      // If the player goes over the object, activate a force
      if (planets[i].activate()) {
        PVector force = player.attractPlanets(planets[i]);
        planets[i].applyForce(force);
        planets[i].update();
      }
    }

    // Display the player 
    player.display();
    // See the playerWeight in the console
    //println("playerWeight : " + playerWeight);

    //reset tint()
    tint(255, 255);
  }


  // Method to display the asteroids ----------------------
  void activateAsteroid(int index) {
    // For fadeOut effect
    if (endGame && alpha > 0.0) {
      alpha -= 10;
    }
    tint(255, alpha);

    // select the good asteroid
    asteroids[index].display();

    // If the player goes over the object, activate a force
    if (asteroids[index].activate()) {
      PVector force = player.attractAsteroids(asteroids[index]);
      asteroids[index].applyForce(force);
      asteroids[index].update();
    } else {
      // Move by itself
      asteroids[index].move(index);
      asteroids[index].update();
    }

    // reset the tint()
    tint(255, 255);
  }
}