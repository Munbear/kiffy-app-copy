import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MbtiChip extends ConsumerWidget {
  final ValueChanged<String> onTap;
  final bool isSelected;
  final String text;

  const MbtiChip({
    super.key,
    required this.onTap,
    required this.isSelected,
    required this.text,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => onTap(text),
      child: Container(
        width: 80,
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
              color: isSelected ? const Color(0xFF0031AA) : Colors.transparent),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: isSelected
                  ? const Color(0xFF0031AA)
                  : const Color(0xFF6C6C6C),
              fontSize: 20,
              fontFamily: 'AppleSDGothicNeoL00',
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          ),
        ),
      ),
    );
    // children: [
    //   GestureDetector(
    //     onTap: () => onSelectFirst(textFirst),
    //     child: Container(
    //       width: 49,
    //       height: 46,
    //       decoration: BoxDecoration(
    //         color: const Color(0xFFF5F5F5),
    //         borderRadius: BorderRadius.circular(20),
    //         border: Border.all(
    //           color:
    //               isSelected ? const Color(0xFF0031AA) : Colors.transparent,
    //         ),
    //       ),
    //       child: Center(
    //         child: Text(
    //           textFirst,
    //           style: TextStyle(
    //             color: isSelected
    //                 ? const Color(0xFF0031AA)
    //                 : const Color(0xFF6C6C6C),
    //             fontSize: 20,
    //             fontFamily: 'AppleSDGothicNeoL00',
    //             fontWeight: FontWeight.w400,
    //             height: 0,
    //           ),
    //         ),
    //       ),
    //     ),
    //   ),
    //   SvgPicture.asset("assets/svg/vertical_icon.svg"),
    //   GestureDetector(
    //     onTap: () => onSelectSecond(textSecond),
    //     child: Container(
    //       width: 49,
    //       height: 46,
    //       decoration: BoxDecoration(
    //         color: const Color(0xFFF5F5F5),
    //         borderRadius: BorderRadius.circular(20),
    //         border: Border.all(
    //           color:
    //               isSelected ? const Color(0xFF0031AA) : Colors.transparent,
    //         ),
    //       ),
    //       child: Center(
    //         child: Text(
    //           textSecond,
    //           style: TextStyle(
    //             color: isSelected
    //                 ? const Color(0xFF0031AA)
    //                 : const Color(0xFF6C6C6C),
    //             fontSize: 20,
    //             fontFamily: 'AppleSDGothicNeoL00',
    //             fontWeight: FontWeight.w400,
    //             height: 0,
    //           ),
    //         ),
    //       ),
    //     ),
    //   ),
    // ],
    // );
  }
}
