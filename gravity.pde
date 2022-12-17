UI ui;
Simulation sim;

void setup() {
  size(1000, 600);
  surface.setTitle("Gravity Simulation");
  surface.setResizable(true);
  
  background(30, 30, 30);


  // Create situations
  Situation EARTH_ISS = new Situation("EARTH - ISS",60, 0.01, 1000);
  EARTH_ISS.astres.add(  new Astre(0, 0, 5.97217 * pow(10, 24), 6371).setVel(0 * pow(10, 3), 0)); // earth
  EARTH_ISS.astres.add(new Astre(0, -(6371 + 400), 444.615, 200).setVel(7.66 * pow(10, 3), 0)  ); // iss

   Situation EARTH_MOON = new Situation("EARTH - MOON",1420, 0.01, 100);
  EARTH_MOON.astres.add(  new Astre(0, 0, 5.97217 * pow(10, 24), 6371).setVel(0 * pow(10, 3), 0)); // earth
  EARTH_MOON.astres.add(new Astre(0, -(6371 + 0.4055 * pow(10, 6)), 0.07346 * pow(10, 24), 1737.4).setVel(1.082 * pow(10, 3), 0)); // moon

   Situation EARTH_MOON_ISS = new Situation("EARTH - MOON - ISS",1420, 0.01, 100);
  EARTH_MOON_ISS.astres.add(  new Astre(0, 0, 5.97217 * pow(10, 24), 6371).setVel(0 * pow(10, 3), 0)); // earth
  EARTH_MOON_ISS.astres.add(new Astre(0, -(6371 + 0.4055 * pow(10, 6)), 0.07346 * pow(10, 24), 1737.4).setVel(1.082 * pow(10, 3), 0)); // moon
  EARTH_MOON_ISS.astres.add(new Astre(0, -(6371 + 400), 444.615, 200).setVel(7.66 * pow(10, 3), 0)  ); // iss

  ui = new UI(this);

  sim = new Simulation();
  sim.load(EARTH_ISS);
}


void draw() {
  drawCanvas();
  sim.draw();
  sim.update();
}


void mouseWheel(MouseEvent event) {
    scale += event.getCount() * 4;
    println("scale: " + scale);
    background(30, 30, 30);
}


void keyPressed() {
    int d = 25;
    if (key == CODED) {
        if (keyCode == UP) {
            sim.pan.y += d;
        }
        if (keyCode == DOWN) {
            sim.pan.y -= d;
        }
        if (keyCode == LEFT) {
            sim.pan.x += d;
        }
        if (keyCode == RIGHT) {
            sim.pan.x -= d;
        }
    }
    background(30, 30, 30);
}
