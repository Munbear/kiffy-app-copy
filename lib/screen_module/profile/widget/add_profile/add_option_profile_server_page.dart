import 'package:flutter/material.dart';

class AddOptionProfileServerPage extends StatelessWidget {
  const AddOptionProfileServerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        /// header text
        const Text(
          "Appeal yourself!",
          style: TextStyle(
            color: Color(0xff0031AA),
            fontSize: 32,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
        RichText(
          textAlign: TextAlign.center,
          text: const TextSpan(
            children: [
              TextSpan(
                text: "\nLet me introduce myself in more detail",
                style: TextStyle(
                  color: Color(0xff494949),
                  fontSize: 14,
                ),
              ),
              TextSpan(
                text: "\n(Option)",
                style: TextStyle(
                  color: Color(0xff0031AA),
                  fontSize: 14,
                ),
              )
            ],
          ),
        ),

        /// 찾는 관계 section
        ///
        /// 사용하는 언어 section
        ///
        /// 좋아 하는 커피 section
      ],
    );
  }
}
