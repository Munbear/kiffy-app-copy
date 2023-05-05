import 'package:Kiffy/domain/profile/provider/add_profile_input_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddProfileInputValidationText extends ConsumerWidget {
  String normalText;
  AddProfileInputItemValidation validation;

  AddProfileInputValidationText({
    super.key,
    required this.normalText,
    required this.validation,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return validation.isValid
        ? Text(
            normalText,
            style: const TextStyle(
              fontSize: 13,
              color: Color(0xFF0031AA),
            ),
          )
        : Text(
            validation.validationMessage,
            style: const TextStyle(
              fontSize: 13,
              color: Colors.redAccent,
            ),
          );
  }
}
