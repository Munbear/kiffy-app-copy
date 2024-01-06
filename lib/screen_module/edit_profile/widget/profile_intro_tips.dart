import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ProfileIntroTipsIcon extends StatelessWidget {
  final VoidCallback onTap;

  const ProfileIntroTipsIcon({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 18,
      height: 18,
      child: GestureDetector(
        onTap: onTap,
        child: Image.asset(
          "assets/icons/alert_icon.png",
          color: const Color(0xffcecece),
        ),
      ),
    );
  }
}

class ProfileIntroTips extends StatelessWidget {
  ProfileIntroTips({super.key});

  List<String> example = [
    tr("text.profile.intro.hint1"),
    tr("text.profile.intro.hint2"),
    tr("text.profile.intro.hint3"),
    tr("text.profile.intro.hint4"),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 39, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Container(
              height: 5,
              width: 84,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xffcecece),
              ),
            ),
          ),
          const SizedBox(height: 30),

          // 자기소개 팁 리스트
          Column(
            children: example
                .map(
                  (item) => Container(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      color: const Color(0xfff5f5f5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(child: Text(item)),
                  ),
                )
                .toList(),
          ),
          const Spacer(),

          // 확인 버튼
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(color: Color(0xff0031AA))),
              backgroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 15),
            ),
            child: Text(
              tr("text.okay"),
              style: TextStyle(
                fontSize: 20,
                color: Color(0xff0031AA),
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        ],
      ),
    );
  }
}
