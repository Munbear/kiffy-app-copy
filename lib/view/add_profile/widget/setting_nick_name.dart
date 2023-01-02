import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final textFieldProvider = StateProvider<String>((ref) => "");

class SettingNickName extends HookConsumerWidget {
  final String hinText;
  final String labelText;
  final bool isShowed;

  SettingNickName({
    super.key,
    required this.hinText,
    required this.labelText,
    required this.isShowed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 50,
      child: TextFormField(
        autofocus: isShowed ? false : true,
        textAlign: TextAlign.center,
        textInputAction: TextInputAction.done,
        style: const TextStyle(
          color: Colors.black87,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 15),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          hintText: hinText,
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
