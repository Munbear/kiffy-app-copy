

class BirthDateUtil {
  static DateTime parseBirthDate(String birthDateString) {
    final birthDate = DateTime.tryParse(birthDateString);

    if (birthDate == null) {
      throw Exception("OMG, It is not birthdate");
    }

    return birthDate;
  }

  static int getAge(DateTime birthDate) {
    return DateTime.now().difference(birthDate).inDays ~/ 365;
  }
}