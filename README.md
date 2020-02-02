# Destiny

Destiny is a new, mock-data generator for Dart/Flutter. It uses a PCG randomness machine
underneath, and static methods couched in a `destiny` namespace are the API. All data is
guaranteed to be pseudo-random; across a million trials, no significant patterns were
detected. 

This package takes inspiration from Chance.js and Faker for Python; it aims to be the most
complete and versatile generator of mock data.

## Usage

Simple usage is illustrated here. For more, see the API Reference:

```dart
import 'package:destiny/destiny.dart';

void main() {
  print('Random Integer from 4 to 8: ${destiny.integer(min: 4, max: 8)}');

  print('Random Boolean: ${destiny.boolean()}');

  //Note: you can also specify a pool of characters.
  print('20 Random Ascii Characters: ' + destiny.string(20));

  print('20 Random Letters: ' + destiny.letters(20));

  print('20 Random Digits: ' + destiny.digits(20));

  print('Random Email Address: ' + destiny.email());

  print('Random Phone #: ' + destiny.phone());

  //Note: female and male names are also available.
  print('Random Name: ' + destiny.name());

  print('Flip a coin: ' + destiny.coin());

  //Note: d4, d6, d8, d10, d20, d30, and d100 are available for dice-rolling.
  print('Roll a 6-sided dice: ' + destiny.d6().toString());

  print('Random address: ' + destiny.address());

  //Note: you can specify a start and end DateTime using the min and max params.
  print('Random DateTime: ' + destiny.datetime().toString());

  print('Random IPv4: ' + destiny.ipv4());

  print('Random IPv6: ' + destiny.ipv6());

  print('Random GUID: ' + destiny.guid());

  // This is the beginning of destiny's capabilities. For more, check out
  // the API reference: It explains the methods in more detail.
}
```

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: http://example.com/issues/replaceme

---

###### This library and its contents are subject to the terms of the Mozilla Public License, v. 2.0. 
###### © 2020 Aditya Kishore
