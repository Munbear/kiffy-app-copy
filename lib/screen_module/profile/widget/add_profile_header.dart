import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AddProfileHeader extends StatelessWidget {
  const AddProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            tr("text.profile.input_profile.intro_title"),
            style: TextStyle(
              fontSize: 28,
              color: Color(0xff0031AA),
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            tr("text.profile.input_profile.sub_title"),
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
