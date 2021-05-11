import 'dart:math';

const _mult1 = 5916780299;
const _mult2 = 1075608000;

class PCGRandom implements Random {
  late int _state;
  late int _inc;

  static final _max = (pow(2, 32) as int) - 1;
  static final _halfMax32 = _max / 2;

  static final _rand = Random();

  PCGRandom([int? initialState, int? initialSequence]) {
    initialState ??= _rand.nextInt(_max) + _rand.nextInt(_max) >> 32;
    initialSequence ??= _rand.nextInt(_max) + _rand.nextInt(_max) >> 32;
    if (initialSequence.isEven) {
      initialSequence = initialSequence ^ 1;
    }
    _seed(initialState, initialSequence);
  }

  void _seed(int seed, int seq) {
    _state = 0;
    _inc = seq * 2 + 1;
    _updateState();
    _state += seed;
    _updateState();
  }

  int _updateState () {
    var old = _state;
    _state = old * _mult1 * _mult2 + _inc;
    var xorShift = (old >> 18 ^ old) >> 27;
    var rot = old >> 59;
    if (rot < 0) {
      rot = -rot;
    }
    return xorShift >> rot;
  }

  @override
  bool nextBool() {
    _updateState();
    return _updateState() > _halfMax32;
  }
  
  @override
  double nextDouble() {
    return _updateState() / _max;
  }

  /// Generates an integer between 0 (inclusive) and max (exclusive).
  /// 
  /// Note that this produces an absolute max of 2^31-1 bits, to maintain
  /// cross-platform consistency. You can pass maxes that are higher, but they
  /// won't work.
  @override
  int nextInt(int max) {
    int bits, val;
    bits = _updateState();
    val = bits % max;
    return val;
  }
}