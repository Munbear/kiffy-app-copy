import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignScreen extends StatefulWidget {
  @override
  State createState() => _SignScreenState();
}

class _SignScreenState extends State<SignScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text("Hello"),
        ),
        Center(
            child: ElevatedButton(
                onPressed: () => context.go("/"), child: Text("To Home")))
      ],
    ));
  }
}
