import 'package:flutter/material.dart';

enum GenderType { male, female }

extension SelectedGender on GenderType {
  Widget get gender {
    switch (this) {
      case GenderType.male:
        return Icon(Icons.male_outlined);
      case GenderType.female:
        return Icon(Icons.female_outlined);
      default:
        return Icon(Icons.person);
    }
  }
}
