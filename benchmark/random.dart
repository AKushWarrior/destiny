import 'dart:math';

import 'package:benchmark_harness/benchmark_harness.dart';
import 'package:destiny/pcg.dart';

class RandomBenchmark extends BenchmarkBase {
  RandomBenchmark(this.base, label) : super(label);

  late Random base;

  static void entry(Random random, String label) {
    RandomBenchmark(random, label + ' | ').report();
  }

  // The benchmark code.
  @override
  void run() {
    base.nextInt(100000);
    base.nextInt(100000);
    base.nextInt(100000);
    base.nextInt(100000);
    base.nextInt(100000);
  }

  // Not measured setup code executed prior to the benchmark runs.
  @override
  void setup() {
    base = PCGRandom();
  }

  // Not measured teardown code executed after the benchmark runs.
  @override
  void teardown() { }
}

void main () {
  RandomBenchmark.entry(PCGRandom(), 'PCGRandom');
  RandomBenchmark.entry(Random(), 'dart:math Random');
}