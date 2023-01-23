enum Gender {
  MALE,
  FEMALE;

  static Gender of(String gender) {
    if (gender.toLowerCase() == "male") {
      return Gender.MALE;
    }

    if (gender.toLowerCase() == "female") {
      return Gender.FEMALE;
    }

    throw ArgumentError();
  }
}
