import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddProfileHeader extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.only(top: 72, bottom: 30),
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
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              "Enter information to be displayed in kiffy",
              style: TextStyle(
                fontSize: 13,
                color: Color(0xff494949),
              ),
            ),
          )
        ],
      ),
    );
  }
}
