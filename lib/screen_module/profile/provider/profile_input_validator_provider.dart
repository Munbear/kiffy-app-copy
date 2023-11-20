import 'package:Kiffy/constant/contact_type.dart';
import 'package:Kiffy/constant/gender_type.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openapi/openapi.dart';

final profileInputValidatorProvider =
    Provider((ref) => ProfileInputValidator());

class ProfileInputValidator {
  bool verifyNickname(String? nickname) {
    return nickname != null && nickname.isNotEmpty && nickname.length <= 20;
  }

  bool verifyGender(Gender? gender) {
    return gender != null;
  }

  bool verifyMedias(List<MediaView> medias) {
    if (medias.length < 2) {
      return false;
    }

    return true;
  }

  bool verifyPhoneNumber(String phoneNumber) {
    var regex = RegExp("^\\+[^ ]+ [\\d ]+\$");

    return regex.hasMatch(phoneNumber);
  }

  bool verifyContactType(ContactType? contactType) {
    return contactType != null;
  }

  bool verifyContactId(String? contactId) {
    return contactId != null && contactId.isNotEmpty;
  }

  bool verifyBirthday(DateTime? birthday) {
    return birthday != null;
  }
}
