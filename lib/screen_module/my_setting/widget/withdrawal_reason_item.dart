import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WithdrawalReasonItem extends StatelessWidget {
  final String reason;
  final Function(String) onTap;
  final bool isSelected;

  const WithdrawalReasonItem({
    required this.reason,
    required this.onTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        onTap(reason);
        },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding:
        const EdgeInsets.symmetric(vertical: 14, horizontal: 21),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: isSelected
                ? const Color(0xff0031AA)
                : const Color(0xffcecece),
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          reason,
          style: TextStyle(
            fontSize: 20,
            color: isSelected
                ? const Color(0xff0031AA)
                : const Color(0xff6c6c6c),
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
