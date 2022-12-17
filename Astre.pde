/*
Tentative de simulation de gravite avec des valeurs non-arbitraires
 1 tick = 1s
 1 pixel = 100 Km
 */

class Astre {
  // Km
  PVectorD pos;
  float radius;

  // m/s
  PVectorD vel;

  // M/(S^2)
  PVectorD acc;

  // Kg
  double mass;

  //     Km        Km          Kg          Km
  Astre(double x, double y, double mass, float radius) {
    this.radius = radius;
    this.mass = mass;
    this.pos = new PVectorD(x, y);
    this.acc = new PVectorD(0, 0);
    this.vel =  new PVectorD(0, 0);
  }

  // Km/s
  Astre setVel(double x, double y) {
    this.vel = new PVectorD(x, y);
    return this;
  }

  void update(float deltaTime) {

    // vel : m/s
    // pos lm
    this.pos.x += this.vel.x * deltaTime * pow(10, -3);
    this.pos.y += this.vel.y * deltaTime * pow(10, -3);

    // println(this.pos.y, this.vel.y * deltaTime * pow(10,-3), this.pos.y + this.vel.y * deltaTime * pow(10,-3));

    // acc = m/s²
    // vel = m/s
    this.vel.add(this.acc.mult((double)deltaTime));

    this.acc.set(0, 0);
  }

  void gravitate(Astre target) {
    PVectorD vecEntre  = new PVectorD(target.pos.x - this.pos.x, target.pos.y - this.pos.y);

    double distanceSq = (powD( vecEntre.x, 2) + powD(vecEntre.y, 2)) * pow(10, 6); // m²
    //float dist = sqrt((float)distanceSq);
    //println(dist);
    //println(round(this.vel.x*100)/100f + " " + round( this.vel.y*100)/100f);
    double force = G * ((this.mass)  / dabs(distanceSq)) * target.mass; // N (Kg*m/s²)

    vecEntre.setMag((float)(force / this.mass)); // mag = m/s²
    this.acc.add(vecEntre);
    //println(this.vel);
    //https://fr.wikipedia.org/wiki/Gravitation
    //https://en.wikipedia.org/wiki/Acceleration
    //https://fr.wikipedia.org/wiki/Newton_(unit%C3%A9)
    //https://fr.wikipedia.org/wiki/Loi_universelle_de_la_gravitation
  }

  void draw() {
    fill(255, 255, 255);
    noStroke();
    circle(
      KmToPx(this.pos.x),
      KmToPx(this.pos.y),
      KmToPx(this.radius * 2)
      );

    stroke(0, 255, 0);

    //text(round(this.vel.x*10)/10f + " " + round( this.vel.y*10)/10f, KmToPx(this.pos.x), KmToPx(this.pos.y));

    line(KmToPx(this.pos.x), KmToPx(this.pos.y), KmToPx(this.pos.x + (this.vel.x / 10)), KmToPx(this.pos.y + (this.vel.y / 10)));
  }

  Astre copy() {
    Astre copied = new Astre(pos.x, pos.y, mass, radius);
    copied.acc.set(acc);
    copied.vel.set(vel);
    return copied;
  }
}
