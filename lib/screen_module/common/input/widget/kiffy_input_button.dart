import 'package:flutter/material.dart';

class KiffyInputButton<T> extends StatelessWidget {
  final bool isSelected;
  final String iconAsset;
  final String text;
  final VoidCallback onPressed;

  const KiffyInputButton({
    super.key,
    required this.isSelected,
    required this.iconAsset,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () => onPressed(),
      label: Text(
        text,
        style: TextStyle(
          color: isSelected ? const Color(0xFF0031AA) : const Color(0xff494949),
        ),
      ),
      icon: Image.asset(
        iconAsset,
        width: 18,
        color: isSelected ? const Color(0xFF0031AA) : const Color(0xff494949),
      ),
      style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        shadowColor: const Color(0x00000000),
        padding: const EdgeInsets.only(top: 16, bottom: 16),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xff494949),
        textStyle: const TextStyle(fontSize: 18),
        side: BorderSide(
          color: isSelected ? const Color(0xFF0031AA) : const Color(0xffDCDCDC),
          width: 2.0,
        ),
      ),
    );
  }
}
