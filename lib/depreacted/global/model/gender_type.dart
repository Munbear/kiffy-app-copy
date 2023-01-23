enum Gender { male, female }

extension SelectedGender on Gender {
  String get gender {
    switch (this) {
      case Gender.male:
        return "laki";
      case Gender.female:
        return "cewek";
      default:
        return "";
    }
  }
}
