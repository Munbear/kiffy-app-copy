enum GenderType { male, female }

extension SelectedGender on GenderType {
  String get gender {
    switch (this) {
      case GenderType.male:
        return "laki";
      case GenderType.female:
        return "cewek";
      default:
        return "";
    }
  }
}
