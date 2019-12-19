import processing.sound.*;

ParticleSystem ps;
FFT fft;
AudioIn in;

final int bands = 1024; //Spans the width
float[] spectrum = new float[bands];


void setup() {
  size(1650, 1000);
  colorMode(HSB, 1500, 100, 100, 100); // Sets the value for color

  ps = new ParticleSystem(new PVector(0, height/2));

  // Create an Input stream which is routed into the Amplitude analyzer
  fft = new FFT(this, bands);
  in = new AudioIn(this, 0);

  // start the Audio Input
  in.start();

  // patch the AudioIn
  fft.input(in);
}

void draw() {
  background(0); 
  fft.analyze(spectrum);
  for (int i = 0; i < bands; i++) {
    ps.addParticleExplosion(round(map(i,0,15,0,1024)), round(0.2+spectrum[i]*15));
    //print(spectrum[i]);
    //println();
  }

  ps.run();
}


// A class to describe a group of Particles
// An ArrayList is used to manage the list of Particles 
class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;

  ParticleSystem(PVector position) {
    origin = position.copy();
    particles = new ArrayList<Particle>();
  }

  void addParticle() {
    particles.add(new Particle(origin));
  }

  void addParticleExplosion(int x, int count) {
    for (int i = 0; i < count; i++) {
      particles.add(new Particle(new PVector(x, height/2)));
    }
  }

  void run() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.run();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }
}


class Particle {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  float originalx; 


  Particle(PVector l) {
    acceleration = new PVector(0, 0);
    velocity = new PVector(random(-1, 1), random(-15, 15));
    position = l.copy();
    originalx = position.x;
    lifespan = 70;
  }

  void run() {
    update();
    display();
  }

  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    lifespan -= 1.0;
  }

  void display() {
    stroke(0, 0);
    fill(originalx, 100, 100, lifespan); 
    ellipse(position.x, position.y, 20, 20);
    //print(position.y);
    //println();
  }

  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}
