
ArrayList<Situation> situations = new ArrayList<Situation>();
class Situation {
  String name;
  ArrayList<Astre> astres;
  int scale;
  float dt;
  float iter;
  Situation(String name, int scale, float dt, float iter) {
    this.name = name;
    this.astres = new ArrayList<Astre>();
    this.scale = scale;
    this.dt = dt;
    this.iter = iter;

    situations.add(this);
  }
}

int scale = 60;
class Simulation {
  // Config
  float deltaTime = 0.1; // s
  float iter = 100;

  // ISS = 92.9 * 60
  // moon = 2360591.5104
  double endTime = 0; // s

  // Transforms
  PVector pan = new PVector(0, 0);

  // Props
  ArrayList<Astre> planets = new ArrayList<Astre>();
  double elapsed = 0; // s
  int lastFrame = 0; // ms
  int framesCnt = 0;
  boolean active = true;


  Simulation() {
    reset();
  }

  void load(Situation sit) {
    reset();

    for (Astre astre : sit.astres) {
      planets.add(astre.copy());
    }
    scale = sit.scale;
    deltaTime = sit.dt;
    iter = sit.iter;
    pan = new PVector(0, 0);
  }

  void reset() {
    background(30, 30, 30);
    elapsed = 0;
    planets.clear();
    active = false;
  }

  void update() {
    if (!active) {
      fill(200, 200, 255);
      text("SIMULTATION PAUSED", width / 2, 20);
      return;
    }

    for (int i = 0; i < iter; i++) {
      // Gravitate planets O(n²)
      for (Astre planetA : planets) {
        for (Astre planetB : planets) {
          if (planetA != planetB) {
            planetA.gravitate(planetB);
          }
        }
      }


      // update planets O(n)
      for (Astre planet : planets) {
        planet.update(deltaTime);
      }


      elapsed += deltaTime;

      if (endTime != 0 & elapsed >= endTime) {
        fill(255, 200, 200);
        text("SIMULTATION END", width / 2, 20);
        active = false;
        break;
      }

      ui.stats.update(deltaTime, iter, elapsed, scale);
    }
  }
  void draw() {
    noStroke();
    fill(30, 30, 30, 10);
    rect(0, 0, width, height);

    push();
    translate(width / 2 + pan.x, height / 2 + pan.y);
    for (Astre planet : planets) {
      planet.draw();
    }
    pop();
  }
}
