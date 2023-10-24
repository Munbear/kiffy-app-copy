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
      hour: max(remained.inHours % 24, 0),
      minute: max(remained.inMinutes % 60, 0),
      second: max(remained.inSeconds % 60, 0),
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
}
