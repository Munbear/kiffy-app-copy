
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserProfileView extends HookConsumerWidget {
  const UserProfileView({super.key});



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PageView(
      children: [
        SizedBox.expand(
          child: Container(
            color: Colors.red,
            child: Center(
              child: Text("Hello 1"),
            ),
          ),
        ),
        SizedBox.expand(
          child: Container(
            color: Colors.blue,
            child: Center(
              child: Text("Hello 2"),
            ),
          ),
        ),
        SizedBox.expand(
          child: Container(
            color: Colors.yellow,
            child: Center(
              child: Text("Hello 3"),
            ),
          ),
        ),
      ],
    );
  }
}