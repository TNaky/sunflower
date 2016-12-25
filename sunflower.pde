import java.awt.geom.Point2D;

/**
 * 横画面サイズ
 */
final int w = 800;
/**
 * 縦画面サイズ
 */
final int h = w;
/**
 * 中心X座標
 */
int ox;
/**
 * 中心Y座標
 */
int oy;
/**
 * 黄金率
 */
double phi = (1 + Math.sqrt(5)) / 2;
/**
 * 黄金角
 */
double theta = 360 / (phi * phi);
/**
 * ひまわりの種
 */
ArrayList<Point2D> sunflowerSeeds;

/**
 * 描画する種の順番
 */
int num;

/**
 * 描画するかどうか
 */
boolean canRerlesh = true;

@Override
void settings() {
  size(w, h);
}

@Override
void setup() {  
  this.ox = w / 2;
  this.oy = h / 2;
  this.num = 0;
  this.sunflowerSeeds = createInterNodes(ox, oy, 200, 20, Math.toRadians(theta));
  this.clear();
}

@Override
void draw() {
  if (this.canRerlesh) {
    colorMode(RGB, 256);
    stroke(200, 0, 0);
    ellipse((int) ox, (int) oy, 6, 6);

    Point2D seed = sunflowerSeeds.get(num);
    stroke(0, 200, 0);
    int sx = (int) seed.getX();
    int sy = (int) seed.getY();
    ellipse(sx, sy, 3, 3);
    text(num++, sx, (int) sy);

    if (num == sunflowerSeeds.size()) {
      num = 0;
      delay(5000);
      if (this.canRerlesh) {
        this.clear();
      }
    } else {
      delay(100);
    }
  }
}

@Override
void keyPressed() {
  if (key == ' ') {
    this.canRerlesh = !this.canRerlesh;
    String mss = this.canRerlesh ? "start =>" : "stop  ||";
    println(mss);
  } else if (key == 'q') {
    exit();
  }
}

@Override
void clear() {
  background(99);
}

/**
 * 中心点から指定半径分，指定間隔，指定角で打点します
 * @param cx 中心X座標
 * @param cy 中心Y座標
 * @param radius 取得半径
 * @param step 打点間隔
 * @param theta 打点間隔 [rad]
 */
ArrayList<Point2D> createInterNodes(double cx, double cy, double radius, double step, double theta) {

  ArrayList<Point2D> result = new ArrayList<Point2D>();
  
  double d = 0;
  int n = 0;
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
    
    Point2D pos = new Point2D.Double(x, y);
    result.add(pos);
    n++;
  }
  
  return result;
}
