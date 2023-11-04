import 'package:flutter/material.dart';

class UserProfileCardPageItemIntro extends StatelessWidget {
  final String intro;

  const UserProfileCardPageItemIntro({super.key, required this.intro});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        padding: EdgeInsets.only(left: 20, bottom: 20, right: 120),
        width: MediaQuery.of(context).size.width,
        child: Text(
          intro,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
