import 'package:flutter/material.dart';

class SelectImageButton extends StatelessWidget {
  final VoidCallback onTap;
  final String? defaultImage;

  const SelectImageButton({
    super.key,
    required this.onTap,
    required this.defaultImage,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap,
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(16),
        bottomRight: Radius.circular(16),
        bottomLeft: Radius.circular(16),
      ),
      child: Container(
        height: 133,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(16),
            bottomRight: Radius.circular(16),
            bottomLeft: Radius.circular(16),
          ),
          border: Border.all(
            color: const Color(0xffCECECE),
          ),
        ),
        child: const Center(
          child: Icon(
            Icons.add,
            color: Color(0xffCECECE),
          ),
        ),
      ),
    );
  }
}
