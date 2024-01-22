import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class SettingButton extends ConsumerWidget {
  final VoidCallback onTap;
  final Widget icon;
  final String text;

  const SettingButton({
    super.key,
    required this.onTap,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                icon,
                // Image(
                //   width: 22,
                //   height: 22,
                //   image: AssetImage(IconPath),
                // ),
                const SizedBox(width: 14),
                Text(text),
              ],
            ),
            SvgPicture.asset(
              "assets/svg/arrow_more_grey.svg",
              width: 14,
              height: 14,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
