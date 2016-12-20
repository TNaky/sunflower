final int w = 800;
final int h = w;

void settings() {
  size(w, h);
}

void setup() {  
  double gRatio = (1 + Math.sqrt(5)) / 2;
  double theta = 360 / (gRatio * gRatio);
  createInterNodes(w / 2, h / 2, 300, 8, Math.toRadians(theta));
}

void createInterNodes(double cx, double cy, double radius, double step, double theta) {
  
  colorMode(RGB, 256);
  stroke(200, 0, 0);
  ellipse((int) cx, (int) cy, 6, 6);
  
  double d = 0;
  int n = 1;
  while(true) {
    double x = step * Math.sqrt(n) * Math.cos(n * theta);
    double y = step * Math.sqrt(n) * Math.sin(n * theta);
    
    d = x * x + y * y;
    d = Math.sqrt(d);
    
    if (d >= radius) {
      break;
    }
    
    x += cx;
    y += cy;
    
    stroke(0, 200, 0);
    ellipse((int) x, (int) y, 3, 3);
    n++;
  }
}