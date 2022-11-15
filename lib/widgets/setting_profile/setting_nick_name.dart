import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingNickName extends ConsumerStatefulWidget {
  final String hinText;
  final String labelText;
  final bool isOpacity;

  const SettingNickName({
    super.key,
    required this.hinText,
    required this.labelText,
    required this.isOpacity,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SettingNickNameState();
}

class _SettingNickNameState extends ConsumerState<SettingNickName> {
  TextEditingController nameTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Offstage(
      offstage: !widget.isOpacity,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: widget.isOpacity ? 50 : 0,
        child: TextFormField(
          autofocus: false,
          textAlign: TextAlign.start,
          textInputAction: TextInputAction.done,
          controller: nameTextEditingController,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 15),
            labelText: widget.labelText,
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            hintText: widget.hinText,
            hintStyle: const TextStyle(color: Colors.grey, fontSize: 18, fontWeight: FontWeight.w500),
            labelStyle: const TextStyle(color: Colors.grey, fontSize: 18, fontWeight: FontWeight.w500),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent, width: 1),
            ),
          ),
        ),
      ),
    );
  }
}
