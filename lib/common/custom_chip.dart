import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CustomChip extends StatelessWidget {
  final String text;
  const CustomChip({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      side: const BorderSide(color: Colors.transparent),
      backgroundColor: Colors.grey[200],
      label: Text(
        text,
        softWrap: true,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
