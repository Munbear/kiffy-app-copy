
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
          child: Stack(
            children: [
              SizedBox.expand(
                child: Image.network(
                  "http://storage-dev.kiffy.club/public/01GM38YDFF6FGHP7EN04F2HNYM/640x.png",
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                alignment: Alignment.bottomLeft,
                padding: EdgeInsets.all(20),
                child: Text(
                    "NaMa - 24",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Colors.white
                  ),
                ),
              )
            ],
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