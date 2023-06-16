import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
            Row(
              children: [
                SvgPicture.asset("assets/svg/online_state_circle.svg"),
                const SizedBox(width: 10),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: userName,
                        style: const TextStyle(color: Colors.white, fontSize: 28),
                      ),
                      const TextSpan(text: "    "),
                      TextSpan(
                        text: BirthDateUtil.getAge(BirthDateUtil.parseBirthDate(userAge)).toString(),
                        style: const TextStyle(color: Colors.grey, fontSize: 20),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
