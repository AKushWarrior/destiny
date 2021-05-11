import 'dart:convert';
import 'dart:math';
import 'package:english_words/english_words.dart' as words;
import 'utilities.dart';

/// This is a static class containing methods for creating randomized/mock data.
///
/// It uses a PCG generator underneath, but exposes practical usages.
class Destiny {
  static final random = Random();

  /// Flip a two-sided coin. Returns 'Tails' or 'Heads'.
  static String coin() {
    var rand = random.nextInt(2);
    if (rand == 1) {
      return 'Heads';
    } else {
      return 'Tails';
    }
  }

  /// Roll a four-sided dice. Returns an integer in 1-4 (inclusive).
  static int d4() => random.nextInt(3) + 1;

  /// Roll a six-sided dice. Returns an integer in 1-6 (inclusive).
  static int d6() => random.nextInt(6) + 1;

  /// Roll a eight-sided dice. Returns an integer in 1-8 (inclusive).
  static int d8() => random.nextInt(8) + 1;

  /// Roll a ten-sided dice. Returns an integer in 1-10 (inclusive).
  static int d10() => random.nextInt(10) + 1;

  /// Roll a twenty-sided dice. Returns an integer in 1-20 (inclusive).
  static int d20() => random.nextInt(20) + 1;

  /// Roll a thirty-sided dice. Returns an integer in 1-30 (inclusive).
  static int d30() => random.nextInt(30) + 1;

  /// Roll a hundred-sided dice. Returns an integer in 1-100 (inclusive).
  static int d100() => random.nextInt(100) + 1;

  /// Get an integer between min and max (inclusive).
  ///
  /// Min and max must be less than `abs(2^31-1)`, and max must be greater than
  /// min.
  static int integer({int min = -2147483647, int max = 2147483647}) {
    return random.nextInt(max + 1 - min) + min;
  }

  /// Get a random boolean.
  static bool boolean() => random.nextBool();

  /// Returns a string of random characters.
  ///
  /// Enter the length parameter to specify the length of the returned string.
  ///
  /// Enter the pool parameter to specify the list of characters that the method
  /// will return. For example, if pool == 'abcde', asciiString will a random String
  /// composed of a, b, c, d, or e.
  static String string(int length, {String? pool}) {
    var poolList = ascii;
    if (pool != null) {
      poolList = utf8.encode(pool);
    }
    var chars = List.generate(length, (int i) {
      return random.nextInt(94);
    });
    var ret = <int>[];
    for (var x in chars) {
      ret.add(poolList[x]);
    }
    return utf8.decode(ret);
  }

  /// Returns a string of random English letters.
  ///
  /// Enter the length parameter to specify the length of the returned string.
  static String letters(int length) {
    var chars = List.generate(length, (int i) {
      return random.nextInt(52);
    });
    var ret = <int>[];
    for (var x in chars) {
      ret.add(utf8Letters[x]);
    }
    return utf8.decode(ret);
  }

  /// Returns a string of digits.
  ///
  /// Enter the length parameter to specify the length of the returned string.
  static String digits(int length) {
    var chars = List.generate(length, (int i) {
      return random.nextInt(10);
    });
    var ret = <int>[];
    for (var x in chars) {
      ret.add(utf8Digits[x]);
    }
    return utf8.decode(ret);
  }

  /// Returns a random, mocked phone number (formatted (XXX) XXX-XXXX).
  static String phone() {
    var chars = List.generate(10, (int i) {
      return random.nextInt(10);
    });
    var ret = <int>[];
    for (var x in chars) {
      ret.add(utf8Digits[x]);
    }
    var sconv = utf8.decode(ret);
    return '(${sconv.substring(0, 3)}) ${sconv.substring(3, 6)}-${sconv.substring(6, 10)}';
  }

  /// Returns a random, mocked street address. The number is wholly random and the
  /// street suffix is randomly selected out of 6 common suffixes.
  ///
  /// The street name is by default selected out of the 100 most used english words.
  /// If you would like, you can pass the name of the street to the street parameter.
  static String address({String? street}) {
    var dignum = integer(min: 3, max: 4);
    var number = '${digits(dignum)} ';
    street ??= capitalize(words.nouns[random.nextInt(nouns)]) + ' ';
    var suffix = addressSuffix[random.nextInt(6)];
    return number + street + suffix;
  }

  /// Returns a random DateTime between min and max. By default, min is the UTC epoch
  /// and max is the current time.
  static DateTime datetime({DateTime? min, DateTime? max}) {
    min ??= epoch;
    max ??= now;
    var sf = integer(min: 376, max: 399);
    var rand = integer(
        min: min.millisecondsSinceEpoch ~/ sf,
        max: max.millisecondsSinceEpoch ~/ sf);
    return DateTime.fromMillisecondsSinceEpoch(rand * sf);
  }

  /// Generate a random IPv4 address. This address is entirely randomized, so
  /// there is no guarantee that it is a valid address.
  static String ipv4() {
    var x = '';
    for (var i = 0; i < 4; x += '.') {
      x += '${random.nextInt(256)}';
      i++;
    }
    return x.substring(0, x.length - 1);
  }

  /// Generate a random IPv6 address. This address is entirely randomized, so
  /// there is no guarantee that it is a valid address.
  static String ipv6() {
    var x = '';
    for (var i = 0; i < 8; x += ':') {
      x += '${random.nextInt(65536).toRadixString(16).padLeft(4, '0')}';
      i++;
    }
    return x.substring(0, x.length - 1);
  }

  /// Generate a random GUID.
  static String guid() {
    var x = <String>[];
    x.add('${random.nextInt(65536).toRadixString(16).padLeft(4, '0')}'
        '${random.nextInt(65536).toRadixString(16).padLeft(4, '0')}');
    x.add('${random.nextInt(65536).toRadixString(16).padLeft(4, '0')}');
    x.add('${random.nextInt(65536).toRadixString(16).padLeft(4, '0')}');
    x.add('${random.nextInt(65536).toRadixString(16).padLeft(4, '0')}');
    x.add('${random.nextInt(65536).toRadixString(16).padLeft(4, '0')}'
        '${random.nextInt(65536).toRadixString(16).padLeft(4, '0')}'
        '${random.nextInt(65536).toRadixString(16).padLeft(4, '0')}');
    return x.join('-');
  }

  /// Generate a random name, pulled from a pool of 1000 possibilities for both
  /// the first and last names. This name can be either male or female.
  static String name() {
    var gender = boolean();
    var index = random.nextInt(1000);
    var index2 = random.nextInt(1000);
    if (gender) {
      return '${girlNames[index]} ${maleNames[index2]}';
    } else {
      return '${maleNames[index]} ${maleNames[index2]}';
    }
  }

  /// Generate a random female name, pulled from a pool of 1000 possibilities for
  /// both the first and last names.
  static String femaleName() {
    var index = random.nextInt(1000);
    var index2 = random.nextInt(1000);
    return '${girlNames[index]} ${maleNames[index2]}';
  }

  /// Generate a random male name, pulled from a pool of 1000 possibilities for
  /// both the first and last names.
  static String maleName() {
    var index = random.nextInt(1000);
    var index2 = random.nextInt(1000);
    return '${maleNames[index]} ${maleNames[index2]}';
  }

  /// Generate a random email. The user section is based off a random name and the
  /// domain is a common adjective of the english language.
  static String email() {
    return name().toLowerCase().replaceFirst(RegExp(r' '), '_') + '@' +
        words.adjectives[random.nextInt(adjectives)] + '.com';
  }
}
