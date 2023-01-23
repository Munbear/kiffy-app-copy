import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChatScreen extends HookConsumerWidget {
  const ChatScreen({super.key});

  static String get routeName => 'chat';
  static String get routeLocation => '/chat';


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        children: [Text("Hello, Chat Screen")],
      ),
    );
  }
}
