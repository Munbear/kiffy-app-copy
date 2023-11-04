

import 'package:Kiffy/domain/common/border._style.dart';
import 'package:Kiffy/screen_module/common/space/widget/space.dart';
import 'package:flutter/material.dart';

class ProfileInputCompleteWelcomeBox extends StatelessWidget {
  final String boxImageUrl;

  const ProfileInputCompleteWelcomeBox({super.key, required this.boxImageUrl});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // profile preview circle
        Center(
          child: Container(
            width: 172,
            height: 172,
            decoration: BorderGradientCircleShape.outlineGradientBoxDecoration,
            child: Container(
              padding: const EdgeInsets.all(7),
              decoration: BorderGradientCircleShape.innerDecoration,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(boxImageUrl, fit: BoxFit.cover),
              ),
            ),
          ),
        ),
        Space(height: 20),
        const Text(
          "Enjoy Kiffy!",
          style: TextStyle(
            fontSize: 30,
            color: Color(0xFF0031AA),
            fontWeight: FontWeight.bold,
          ),
        ),
        Space(height: 8),
        const Text(
          "Meet various people through the kiffy!",
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFF494949),
          ),
        ),
      ],
    );
  }
}
