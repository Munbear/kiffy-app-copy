import 'package:Kiffy/constant/style/gab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserInfoTileSection extends ConsumerWidget {
  const UserInfoTileSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyle = Theme.of(context).textTheme;
    return Row(
      children: [
        SizedBox(
          width: 32,
          height: 32,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(
              "assets/images/test_image.png",
              fit: BoxFit.cover,
            ),
          ),
        ),
        Gab.width12,
        Text(
          "kiffy",
          style: textStyle.titleSmall,
        )
      ],
    );
  }
}
