import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddBirthTextForm extends HookConsumerWidget {
  final String hinText;
  final String labelText;
  final bool isShowed;

  AddBirthTextForm({
    super.key,
    required this.hinText,
    required this.labelText,
    required this.isShowed,
  });

  TextEditingController nameTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AnimatedOpacity(
      opacity: isShowed ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 500),
      child: Offstage(
        offstage: !isShowed,
        child: AnimatedContainer(
          margin: const EdgeInsets.only(bottom: 25),
          duration: const Duration(milliseconds: 200),
          height: isShowed ? 50 : 0,
          child: TextFormField(
            autofocus: isShowed ? true : false,
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
              hintText: hinText,
              hintStyle: const TextStyle(color: Colors.grey, fontSize: 18, fontWeight: FontWeight.w500),
              labelStyle: const TextStyle(color: Colors.grey, fontSize: 18, fontWeight: FontWeight.w500),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xff0031AA), width: 1),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
