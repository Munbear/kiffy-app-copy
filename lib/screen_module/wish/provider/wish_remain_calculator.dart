import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final wishRemainCalculatorProvider = Provider((ref) => WishRemainCalculator());

class WishRemainCalculator {
  final Duration expiration = const Duration(days: 1);

  WishRemained calculate(DateTime from) {
    var to = DateTime.now().toUtc();

    Duration difference = to.difference(from);
    Duration remained = expiration - difference;

    return WishRemained(
      hour: remained.inHours > 0 ? remained.inHours % 24 : 0,
      minute: remained.inMinutes > 0 ? remained.inMinutes % 60 : 0,
      second: remained.inSeconds > 0 ? remained.inSeconds % 60 : 0,
    );
  }
}

class WishRemained {
  final int hour;
  final int minute;
  final int second;

  WishRemained({
    required this.hour,
    required this.minute,
    required this.second,
  });

  bool isRemained() {
    if (hour > 0 || minute > 0 || second > 0) {
      return true;
    }

    return false;
  }

  String remainedDurationHHmmss() {
    return "${hour > 9 ? hour : "0${hour}"}:${minute > 9 ? minute : "0${minute}"}:${second > 9 ? second : "0${second}"}";
  }
}
