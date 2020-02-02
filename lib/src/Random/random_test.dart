import 'random.dart';
import 'dart:math';

// If you run the tests below, you'll see that the PCG implementation destiny uses
// blows Dart's out of the water at high generation loads, coming in at ~20%
// faster.

void main() {
  var randPCG = PCGRandom();
  var rand = Random();
  var one = 0, two = 0, three = 0, four = 0, zero = 0;
  var watch = Stopwatch();
  watch.start();
  for (var i = 0; i < 1000000; i++) {
    switch (randPCG.nextInt(5)) {
      case 0: {
        zero++;
      } break;
      case 1: {
        one++;
      } break;
      case 2: {
        two++;
      } break;
      case 3: {
        three++;
      } break;
      case 4: {
        four++;
      } break;
    }
  }
  watch.stop();
  print('PCGRandom:');
  print('Zero: $zero times');
  print('One: $one times');
  print('Two: $two times');
  print('Three: $three times');
  print('Four: $four times');
  print('Time: ${watch.elapsedMicroseconds} microsecs');
  print('');

  watch.reset();
  one = two = three = four = zero = 0;
  watch.start();
  for (var i = 0; i < 1000000; i++) {
    switch (rand.nextInt(5)) {
      case 0: {
        zero++;
      } break;
      case 1: {
        one++;
      } break;
      case 2: {
        two++;
      } break;
      case 3: {
        three++;
      } break;
      case 4: {
        four++;
      } break;
    }
  }
  watch.stop();
  print('Dart Random:');
  print('Zero: $zero times');
  print('Two: $two times');
  print('Three: $three times');
  print('Four: $four times');
  print('Time: ${watch.elapsedMicroseconds} microsecs');
}