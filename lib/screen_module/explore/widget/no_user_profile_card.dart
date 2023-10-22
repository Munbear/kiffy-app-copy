import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NoUserProfileCard extends ConsumerWidget {
  const NoUserProfileCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Expanded(
      child: Center(
        child: Text("매칭할 유저가 없습니다", textAlign: TextAlign.center),
      ),
    );
  }
}
