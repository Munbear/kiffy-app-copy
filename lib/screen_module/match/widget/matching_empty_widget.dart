import 'package:flutter/material.dart';

class MatchingEmptyWidget extends StatelessWidget {
  const MatchingEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Center(
        child: Text("Empty"),
      ),
    );
  }
}
