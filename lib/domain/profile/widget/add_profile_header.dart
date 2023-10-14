import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddProfileHeader extends ConsumerWidget {
  const AddProfileHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.only(top: 72, bottom: 30),
      child: Column(
        children: const [
          Text(
            "Identify yourself",
            style: TextStyle(
              fontSize: 32,
              color: Color(0xff0031AA),
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Enter information to be displayed in kiffy",
            style: TextStyle(
              fontSize: 13,
              color: Color(0xff494949),
            ),
          )
        ],
      ),
    );
  }
}
