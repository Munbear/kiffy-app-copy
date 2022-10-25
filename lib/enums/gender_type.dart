enum GenderType { male, female }

extension SelectedGender on GenderType {
  String get gender {
    switch (this) {
      case GenderType.male:
        return "MALE";
      case GenderType.female:
        return "FEMALE";
      default:
        return "";
    }
  }
}
