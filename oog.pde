class Oog {
  int x, y, w, h;
  color col;
  int eyes;
  int moveX;
  
  Oog() {
    x = (int) random(640);
    h = 100 + (int) random(200);
    y = 500 - h;// + (int) random(50);
    w = 80;
    eyes = 1 + (int) random(3);
    moveX = 1 + (int) random(2);
    if (random(1) > 0.5) {
      moveX *= -1;
    }
    
    col = color(random(255), random(255), random(255));
  }
  
  void draw() {
    x += moveX;
    if (x > 700) {
      x = -100;
    } else if (x < -100) {
      x = 700;
    }
    
    pushMatrix();
    translate(x, y);
    fill(col);
    rect(0, 0, w, h, 20, 20, 0, 0);
    
    for (int i = 0; i < eyes; i++) {
      int baseX = (int) (20*i + (w-eyes*20.0)*0.5+10);
      
      fill(255);
      ellipse(baseX, 20, 20, 20);
      
      PVector left = new PVector(baseX, 20);
      left = left.add(new PVector(mouseX - x, mouseY - y).sub(left).setMag(5));
      
      fill(0);
      ellipse(left.x, left.y, 10, 10);
    }
    
    popMatrix();
  }
}

Oog[] oogs = new Oog[20];

void setup() {
  size(640, 480);
  
  for (int i = 0; i < oogs.length; i++) {
    oogs[i] = new Oog();
  }
}

void draw() {
  background(128, 200, 255);
  noStroke();
  
  for (int i = 0; i < 10; i++) {
    int a = i * 10 + 100;
    fill(255, 255, a);
    int size = (int) (70.0 + 2.0 * (10.0-i)*sin(millis() / 300.0));
    ellipse(140, 100, size, size);
  }
  
  for (int i = 0; i < oogs.length; i++) {
    oogs[i].draw();
  }
}