import 'package:destiny/destiny.dart';

void main() {
  print('Random Integer from 4 to 8: ${destiny.integer(min: 4, max: 8)}');

  print('Random Boolean: ${destiny.boolean()}');

  print('20 Random Ascii Characters: ' + destiny.string(20));

  print('20 Random Letters: ' + destiny.letters(20));

  print('20 Random Digits: ' + destiny.digits(20));

  print('Random Email Address: ' + destiny.email());

  print('Random Phone #: ' + destiny.phone());

  print('Random Name: ' + destiny.name());

  print('Flip a coin: ' + destiny.coin());

  //Note: d4, d6, d8, d10, d20, d30, and d100 are available for dice-rolling.
  print('Roll a 6-sided dice: ' + destiny.d6().toString());

  print('Random address: ' + destiny.address());

  print('Random DateTime: ' + destiny.datetime().toString());

  print('Random IPv4: ' + destiny.ipv4());

  print('Random IPv6: ' + destiny.ipv6());

  print('Random GUID: ' + destiny.guid());

  // This is only the beginning of destiny's capabilities. For more, check out
  // the API reference: Many methods have features not shown here!
}
