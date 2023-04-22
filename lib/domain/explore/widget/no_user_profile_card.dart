import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NoUserProfileCard extends HookConsumerWidget {
  const NoUserProfileCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Text("매칭할 유저가 없습니다"),
    );
  }
}
