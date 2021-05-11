import 'dart:math';

void main () {
  var divisor = 4500 * 14939 * 16;
  var base = 6364136223846793005 ~/ divisor;

  print(base);
  print(divisor);

  int x = 2;
  int y = 2;
  int d = 1;
  while (d == 1) {
    x = g(x, base);
    y = g(g(y, base), base);
    d = gcd((x-y).abs(), base);
  }

  print(d);
}

int g (int x, int n) {
  return ((pow(x, 2) as int) + 1) % n;
}

int gcd(int a, int b)
{
  int remainder;
  while (b != 0) {
    remainder = a % b;
    a = b;
    b = remainder;
  }
  return a;
}