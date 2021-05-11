import 'package:destiny/destiny.dart';

void main() {
  print('Random Integer from 4 to 8: ${Destiny.integer(min: 4, max: 8)}');

  print('Random Boolean: ${Destiny.boolean()}');

  print('20 Random Ascii Characters: ' + Destiny.string(20));

  print('20 Random Letters: ' + Destiny.letters(20));

  print('20 Random Digits: ' + Destiny.digits(20));

  print('Random Email Address: ' + Destiny.email());

  print('Random Phone #: ' + Destiny.phone());

  print('Random Name: ' + Destiny.name());

  print('Flip a coin: ' + Destiny.coin());

  //Note: d4, d6, d8, d10, d20, d30, and d100 are available for dice-rolling.
  print('Roll a 6-sided dice: ' + Destiny.d6().toString());

  print('Random address: ' + Destiny.address());

  print('Random DateTime: ' + Destiny.datetime().toString());

  print('Random IPv4: ' + Destiny.ipv4());

  print('Random IPv6: ' + Destiny.ipv6());

  print('Random GUID: ' + Destiny.guid());

  // This is only the beginning of destiny's capabilities. For more, check out
  // the API reference: Many methods have features not shown here!
}
