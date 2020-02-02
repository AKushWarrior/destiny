import 'dart:math';

class PCGRandom implements Random {
  int state;
  static final pow232 = pow(2,32);
  static final pow231 = pow232/2;
  static final pow2n32 = 1/pow232;
  static final min1 = pow232 -1;
  var rand = Random();

  PCGRandom([int seed]) {
    seed ??= rand.nextInt(pow232-1);
    if (seed.isEven) {
      if (seed == 0) {
        seed+=2;
      }
      seed--;
    }
    state = seed;
  }

  double _updateState () {
    state = state*6364136223846793005;
    var x = state;
    x ^= x >> 54;
    return ((x >> (54 + x >> 61) & min1) * pow2n32);
  }

  @override
  bool nextBool() {
    _updateState();
    return _updateState() > 0.5;
  }

  @override
  double nextDouble() {
    return (_updateState());
  }

  @override
  int nextInt(int max) {
    if (max >= pow232) throw ArgumentError('Max must be < 2^32-1');
    return (_updateState() * max).floor();
  }
}