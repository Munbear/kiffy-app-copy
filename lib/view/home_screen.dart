import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreeState();
}

class _HomeScreeState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Center(
          child: Text("Hello"),
        )
      ],
    ));
  }
}
