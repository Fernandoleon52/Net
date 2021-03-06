
int nDots = 200;
PVector[] dots;

void setup () {
  size(600, 600);

  dots = new PVector[nDots]; 
  for (int i = 0; i < nDots; i++) {
    dots[i] = new PVector(random(0, width), random(0, height));
  }

  noStroke();
}

void draw () {
  background(255);
  
  noStroke();
  fill(255,20);
  rect(0,0,width,height);

  updateDots();
  renderDots();
}

void updateDots() {
  for (int i = 0; i < nDots; i++) {
    PVector offset = new PVector(random(-3, 3), random(-3, 3));
    dots[i].add(offset);

    if (dots[i].x < 0) { 
      dots[i].x = width;
    }
    if (dots[i].x > width) { 
      dots[i].x = 0;
    }
    if (dots[i].y < 0) { 
      dots[i].y = height;
    }
    if (dots[i].y > height) { 
      dots[i].y = 0;
    }
  }
}

void renderDots() {
  noStroke();
  for (int i = 0; i < nDots; i++) {
    fill(255);
    ellipse(dots[i].x, dots[i].y, 6, 6);

    fill(153,245,239);
    ellipse(dots[i].x, dots[i].y, 33, 33);
  }
 stroke(255,246,57);
  for (int i = 0; i < nDots; i++) {
    for (int j = i + 1; j < nDots; j++) {
      float d = dist(dots[i].x, dots[i].y, dots[j].x, dots[j].y);
      if (d <= 60){
        line(dots[i].x, dots[i].y, dots[j].x, dots[j].y);
      }
      
    }
  }
}
