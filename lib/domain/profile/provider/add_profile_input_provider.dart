import 'package:Kiffy/domain/core/model/Gender.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

var addProfileInputProvider = StateNotifierProvider((ref) => AddProfileInputState(ref));

class AddProfileInputState extends StateNotifier<AddProfileInput> {
  final Ref ref;

  AddProfileInputState(this.ref)
      : super(
    AddProfileInput(
      name: "",
      gender: Gender.MALE,
      birthDate: "",
      intro: "",
      medias: List.empty(),
    ),
  );

  AddProfileInputItemValidation setName(String name) {
    if (name.isEmpty) {
      return AddProfileInputItemValidation.fail("* 이름을 입력해주세요");
    }

    if (name.length >= 20) {
      return AddProfileInputItemValidation.fail("* 이름은 20자 이내로 입력해주세요");
    }

    state.name = name;
    return AddProfileInputItemValidation.success();
  }

  AddProfileInputItemValidation setGender(Gender? gender) {
    if (gender == null) {
      return AddProfileInputItemValidation.fail("* 성별을 입력해주세요");
    }

    state.gender = gender;
    return AddProfileInputItemValidation.success();
  }

  AddProfileInputItemValidation setBirthDate(String birthDate) {
    if (birthDate.isEmpty) {
      return AddProfileInputItemValidation.fail("* 생년월일을 입력해주세요");
    }

    try {
      var parsedBirthDate = DateTime.tryParse(birthDate);

      if (parsedBirthDate == null) {
        return AddProfileInputItemValidation.fail("* 예시와 맞게 입력해주세요");
      }

      if (parsedBirthDate.isBefore(DateTime(1950)) || parsedBirthDate.isAfter(DateTime(2013))) {
        return AddProfileInputItemValidation.fail("* 가입할 수 없는 나이입니다");
      }
    } catch (e) {
      return AddProfileInputItemValidation.fail("* 예시와 맞게 입력해주세요");
    }

    return AddProfileInputItemValidation.success();
  }
}

class AddProfileInput {
  String name;
  Gender gender;
  String birthDate;
  String intro;
  List<AddProfileMedia> medias;

  AddProfileInput({
    required this.name,
    required this.gender,
    required this.birthDate,
    required this.intro,
    required this.medias,
  });
}

class AddProfileMedia {
  String id;
  int orderNum;

  AddProfileMedia({
    required this.id,
    required this.orderNum,
  });
}

class AddProfileInputItemValidation {
  bool isValid;
  String validationMessage;

  AddProfileInputItemValidation({
    required this.isValid,
    required this.validationMessage,
  });

  static AddProfileInputItemValidation fail(String message) =>
      AddProfileInputItemValidation(isValid: false, validationMessage: message);

  static AddProfileInputItemValidation success() =>
      AddProfileInputItemValidation(isValid: true, validationMessage: "");
}
