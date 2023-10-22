import 'package:flutter/material.dart';

class AddProfileHeader extends StatelessWidget {
  const AddProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 72, bottom: 30),
      child: const Column(
        children: [
          Text(
            "Identify yourself",
            style: TextStyle(
              fontSize: 32,
              color: Color(0xff0031AA),
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Enter information to be displayed in kiffy",
            style: TextStyle(
              fontSize: 13,
              color: Color(0xff494949),
            ),
          )
        ],
      ),
    );
  }
}
