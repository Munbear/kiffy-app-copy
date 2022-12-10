import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingNickName extends ConsumerStatefulWidget {
  final String hinText;
  final String labelText;
  // final bool isShowed;

  const SettingNickName({
    super.key,
    required this.hinText,
    required this.labelText,
    // required this.isShowed,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SettingNickNameState();
}

class _SettingNickNameState extends ConsumerState<SettingNickName> {
  TextEditingController nameTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      textAlign: TextAlign.center,
      textInputAction: TextInputAction.done,
      controller: nameTextEditingController,
      style: const TextStyle(
        color: Colors.black87,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 15),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        hintText: widget.hinText,
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
    );
  }
}
