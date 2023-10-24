import 'package:flutter/material.dart';

class MatchingListLoadingWidget extends StatelessWidget {
  const MatchingListLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Center(
        child: CircularProgressIndicator(color: Colors.purple),
      ),
    );
  }
}
