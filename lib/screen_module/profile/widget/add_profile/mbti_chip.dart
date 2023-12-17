import 'package:Kiffy/constant/mbti_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MbtiChip extends StatelessWidget {
  final VoidCallback onSelectFirst;
  final VoidCallback onSelectSecond;
  final String textFirst;
  final String textSecond;

  const MbtiChip({
    super.key,
    required this.onSelectFirst,
    required this.onSelectSecond,
    required this.textFirst,
    required this.textSecond,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => onSelectFirst(),
          child: Chip(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            labelPadding: EdgeInsets.zero,
            backgroundColor: const Color(0xFFF5F5F5),
            side: const BorderSide(color: Colors.transparent),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            label: Text(
              textFirst,
              style: const TextStyle(
                color: Color(0xFF6C6C6C),
                fontSize: 20,
                fontFamily: 'AppleSDGothicNeoL00',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
          ),
        ),
        SvgPicture.asset("assets/svg/vertical_icon.svg"),
        GestureDetector(
          onTap: () => onSelectSecond(),
          child: Chip(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            labelPadding: EdgeInsets.zero,
            backgroundColor: const Color(0xFFF5F5F5),
            side: const BorderSide(color: Colors.transparent),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            label: Text(
              textSecond,
              style: const TextStyle(
                color: Color(0xFF6C6C6C),
                fontSize: 20,
                fontFamily: 'AppleSDGothicNeoL00',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
