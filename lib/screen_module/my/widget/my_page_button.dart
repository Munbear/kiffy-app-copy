import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyButton extends ConsumerWidget {
  final String text;
  final String iconPath;
  final VoidCallback onTap;

  const MyButton({
    super.key,
    required this.text,
    required this.iconPath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: () => onTap(),
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 17),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0x99cecece)),
                color: Colors.transparent),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image(
                      width: 33,
                      height: 33,
                      image: AssetImage(iconPath),
                    ),
                  ],
                ),
                const SizedBox(height: 42),
                Text(
                  text,
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
