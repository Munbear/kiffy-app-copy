import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ExampleIntroTipsBottomSheet extends ConsumerWidget {
  ExampleIntroTipsBottomSheet({super.key});

  List<String> example = [
    "My MBTI is..",
    "My MBTI is..",
    "My MBTI is..",
    "My MBTI is..",
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10), side: const BorderSide(color: Color(0xff0031AA))),
              backgroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 15),
            ),
            child: const Text(
              "Okay",
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
