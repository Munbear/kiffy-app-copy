import 'package:Kiffy/screen_module/common/input/style/kiffy_input_style.dart';
import 'package:flutter/material.dart';

class KiffyTextField extends StatelessWidget {
  final String? value;
  final String hintText;
  final ValueChanged<String> onChanged;

  KiffyTextField({
    super.key,
    this.value,
    required this.hintText,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: value,
      onChanged: (t) => onChanged(t),
      style: const TextStyle(fontSize: 20, color: Color(0xFF6C6C6C)),
      decoration: KiffyInputStyle.inputDecoration(hintText),
    );
  }
}
