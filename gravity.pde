/*
Tentative de simulation de gravite réaliste
 1 tick = 0.02s ( 50 fps )
 1 pixel = 100 Km
 */

double G = 6.6743 * pow(10, -11); //  m^3 kg^−1 s^−2

// 1 pixel = scale km
// moon: 1420
// ISS: 40
int scale = 60;
PVector pan = new PVector(0, 0);

float deltaTime = 0.1; // s
float iter = 100;

int lastFrame = 0; // ms
int framesCnt = 0;
double elapsed = 0; // s
// ISS = 92.9 * 60
// moon = 2360591.5104
double target = 0; // s



int planetCnt = 2;
//Astre[] planets = new Astre[planetCnt];
ArrayList<Astre> planets = new ArrayList<Astre>();

PrintWriter output;


void setup() {
  //frameRate(30);
  size(1000, 600);

  //output = createWriter("positions.csv");

  // ISS
  float dist = 6371 + 400; // Km
  Astre planet = new Astre(0, -dist, 444.615, 200);
  planet.setVel(7.66 * pow(10, 3), 0);
  planets.add(planet);

  // ISS Lourde
  dist = 6371 + 422 + 10000; // Km
  planet = new Astre(0, -dist, 444.615 * pow(10, 23), 200);
  planet.setVel(8 * pow(10, 3), 0);
  planets.add(planet);

  // moon
  dist = 6371 + 0.4055 * pow(10,6); // Km
  planet = new Astre(0, -dist, 0.07346 * pow(10, 24), 1737.4);
  planet.setVel(1.082 * pow(10, 3), 0);
  planets.add(planet);


  // earth
  planet = new Astre(0, 0, 5.97217 * pow(10, 24), 6371);
  planet.setVel(0 * pow(10, 3), 0);
  planets.add(planet);


  surface.setTitle("Gravity Simulation");
  surface.setResizable(true);
  background(30, 30, 30);
}



void drawCanvas() {
  noStroke();
  fill(30, 30, 30, 10);
  rect(0, 0, width, height);

  fill(30, 30, 50, 255);
  rect(0, 0, 100, 60);

  fill(255);
  text("fps: "+ frameRate, 10, 10);
  text("Δf: " + deltaTime * iter + "s", 10, 20);

  text("Δt: " + deltaTime + "s", 10, 30);
  //text("t: "+ round((millis() / 1000.0) * timeScale) + "s (" + framesCnt + " frames)", 10, 30);
  text("t: "+ Math.round( elapsed / 60 * 100) / 100f + "m", 10, 40);
  text("1000 km", 10, 50);
  stroke(255);

  line(25, 55, 25 + KmToPx(1000), 55);
}

void draw() {
  planetCnt = planets.size();
  //deltaTime = (millis() - lastFrame) / 1000.0 * timeScale;
  //println(planets.get(0).pos);
  //output.println(elapsed + "\t" + planets.get(0).pos.y);

  for (int i = 0; i< iter; i++) {

    // Gravitate planets O(n²)
    for (int planetA = 0; planetA < planetCnt; planetA++) {
      for (int planetB = 0; planetB < planetCnt; planetB++) {
        if (planetA != planetB) {
          //planets[planetA].gravitate(planets[planetB]);
          planets.get(planetA).gravitate(planets.get(planetB));
        }
      }
    }




    //planets.get(0).gravitate(planets.get(1));

    // update planets O(n)
    for (int planetId = 0; planetId <planetCnt; planetId++) {
      planets.get(planetId).update();
    }


    elapsed += deltaTime;


    if (target != 0 & elapsed >= target) {
      fill(255, 200, 200);
      text("SIMULTATION END", width/2, 20);
      noLoop();

      break;
    }
  }

  drawCanvas();

  push();
  translate(width/2 + pan.x, height/2 + pan.y);
  for (int i =0; i < planetCnt; i ++) {
    planets.get(i).draw();
  }
  pop();

  lastFrame = millis();
  framesCnt++;
}


void mouseWheel(MouseEvent event) {
  scale += event.getCount() * 4;
  println("scale: "+scale );
  background(30, 30, 30);
}


void keyPressed() {
  int d = 25;
  if (key == CODED) {
    if (keyCode == UP) {
      pan.y+=d;
    }
    if (keyCode == DOWN) {
      pan.y-=d;
    }
    if (keyCode == LEFT) {
      pan.x+=d;
    }
    if (keyCode == RIGHT) {
      pan.x-=d;
    }
  }
  background(30, 30, 30);
}
