import 'package:easy_localization/easy_localization.dart';
import 'package:openapi/openapi.dart';

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

  static genderToString(gender) {
    switch (gender) {
      case Gender.MALE:
        return tr("text.male");
      case Gender.FEMALE:
        return tr("text.female");
    }
  }

  static Gender fromGenderEnumView(GenderEnumView gender) {
    switch (gender) {
      case GenderEnumView.MALE:
        return Gender.MALE;
      case GenderEnumView.FEMALE:
        return Gender.FEMALE;
    }

    throw Exception();
  }

  GenderEnumView toGenderEnumView() {
    if (this == Gender.MALE) {
      return GenderEnumView.MALE;
    }

    return GenderEnumView.FEMALE;
  }
}
