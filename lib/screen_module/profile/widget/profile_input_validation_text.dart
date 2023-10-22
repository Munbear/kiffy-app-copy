import 'package:Kiffy/screen_module/profile/provider/profile_input_provider.dart';
import 'package:flutter/material.dart';

class ProfileInputValidationText extends StatelessWidget {
  final String normalText;
  final AddProfileInputItemValidation validation;

  const ProfileInputValidationText({
    super.key,
    required this.normalText,
    required this.validation,
  });

  @override
  Widget build(BuildContext context) {
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
