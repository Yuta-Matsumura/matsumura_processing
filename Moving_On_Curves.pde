/**
 * Moving On Curves with Randomized Curves.
 * 
 * The circle now moves along a randomized curve.
 * Click the mouse to have it move to a new position with a random curve.
 */

float beginX = 20.0;  // Initial x-coordinate
float beginY = 10.0;  // Initial y-coordinate
float endX = 570.0;   // Final x-coordinate
float endY = 320.0;   // Final y-coordinate
float distX;          // X-axis distance to move
float distY;          // Y-axis distance to move
float exponent;       // Determines the curve
float x = 0.0;        // Current x-coordinate
float y = 0.0;        // Current y-coordinate
float step = 0.01;    // Size of each step along the path
float pct = 0.0;      // Percentage traveled (0.0 to 1.0)

void setup() {
  size(640, 360);
  noStroke();
  randomizeCurve();
  distX = endX - beginX;
  distY = endY - beginY;
}

void draw() {
  fill(0, 2);
  rect(0, 0, width, height);
  pct += step;
  if (pct < 1.0) {
    x = beginX + (pct * distX);
    y = beginY + (pow(pct, exponent) * distY);
  }
  fill(255);
  ellipse(x, y, 20, 20);
}

void mousePressed() {
  pct = 0.0;
  beginX = x;
  beginY = y;
  endX = mouseX;
  endY = mouseY;
  distX = endX - beginX;
  distY = endY - beginY;
  randomizeCurve();
}

void randomizeCurve() {
  // ランダムな曲線のタイプと速度を設定
  exponent = random(2, 6);  // y = x^exponent の形でランダムに選ばれた指数
  step = random(0.005, 0.05);  // ランダムな動きのスピード
}
