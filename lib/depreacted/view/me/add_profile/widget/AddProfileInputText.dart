import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddProfileInputTextProps {
  bool autoFocus;
  String hintText;
  ValueChanged<String> onChanged;

  AddProfileInputTextProps({
    required this.hintText,
    required this.onChanged,
    required this.autoFocus,
  });
}

class AddProfileInputText extends HookConsumerWidget {
  AddProfileInputTextProps props;

  AddProfileInputText({
    super.key,
    required this.props,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 50,
      child: TextField(
        onChanged: (value) => this.props.onChanged(value),
        autofocus: this.props.autoFocus,
        style: const TextStyle(
          color: Colors.black87,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 15),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          hintText: this.props.hintText,
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          labelStyle: const TextStyle(color: Colors.grey, fontSize: 18, fontWeight: FontWeight.w500),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xff0031AA), width: 1),
          ),
        ),
      ),
    );
  }
}
