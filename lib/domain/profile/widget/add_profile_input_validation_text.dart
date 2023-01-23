import 'package:Kiffy/domain/profile/provider/add_profile_input_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddProfileInputValidationText extends HookConsumerWidget {
  String normalText;
  AddProfileInputItemValidation validation;

  AddProfileInputValidationText({
    required this.normalText,
    required this.validation,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return validation.isValid
        ? Text(
            normalText,
            style: TextStyle(
              fontSize: 13,
              color: Color(0xFF0031AA),
            ),
          )
        : Text(
            validation.validationMessage,
            style: TextStyle(
              fontSize: 13,
              color: Colors.redAccent,
            ),
          );
  }
}
