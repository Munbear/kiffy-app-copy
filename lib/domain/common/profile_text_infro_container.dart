import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../util/BirthDateUtil.dart';

class ProfileTextInfoContainer extends ConsumerWidget {
  final String userName;
  final String userAge;

  const ProfileTextInfoContainer({
    super.key,
    required this.userName,
    required this.userAge,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Positioned(
      left: 0,
      bottom: 0,
      child: Container(
        padding: const EdgeInsets.only(left: 25, bottom: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              userName,
              style: const TextStyle(color: Colors.white, fontSize: 28),
            ),
            Text(
              BirthDateUtil.getAge(BirthDateUtil.parseBirthDate(userAge)).toString(),
              style: const TextStyle(color: Colors.white, fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
