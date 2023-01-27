import 'package:Kiffy/domain/core/model/ContactType.dart';
import 'package:Kiffy/domain/core/model/Gender.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

var addProfileInputProvider = StateNotifierProvider<AddProfileInputState, AddProfileInput>((ref) => AddProfileInputState(ref));

// 유저 프로필 상태
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
              contact: AddProfileContact(
                contactId: "",
                contactType: ContactType.LINE,
              )),
        );

  // 프로필 이름 유효성 검사
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

  // 프로필 성벌 유효성 검사
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

    state.birthDate = birthDate;
    return AddProfileInputItemValidation.success();
  }

  // 프로필 연락처 유효성 검사
  AddProfileInputItemValidation setContact(String contactId, ContactType? contactType) {
    if (contactId.isEmpty) {
      return AddProfileInputItemValidation.fail("* 연락처를 입력해주세요");
    }

    if (contactType == null) {
      return AddProfileInputItemValidation.fail("* 연락처를 선택해주세요");
    }

    state.contact = AddProfileContact(contactId: contactId, contactType: contactType);
    return AddProfileInputItemValidation.success();
  }

  // 프로필 자기소개 유효성 검사
  AddProfileInputItemValidation setIntro(String intro) {
    if (intro.isEmpty) {
      return AddProfileInputItemValidation.fail("* 자기소개를 입력해주세요");
    }
    if (intro.length >= 500) {
      return AddProfileInputItemValidation.fail("* 500자 이내로 작성해주세요");
    }

    state.intro = intro;
    return AddProfileInputItemValidation.success();
  }

  // 프로필 사진 유효성 검사
  AddProfileInputItemValidation setMedias(List<AddProfileMedia> medias) {
    if (medias.length < 2) {
      return AddProfileInputItemValidation.fail("최소 2장 이상의 사진을 등록해주세요");
    }

    state.medias = medias;
    return AddProfileInputItemValidation.success();
  }
}

// 유저 프로필 정보
class AddProfileInput {
  String name;
  Gender gender;
  String birthDate;
  String intro;
  List<AddProfileMedia> medias;
  AddProfileContact contact;

  AddProfileInput({
    required this.name,
    required this.gender,
    required this.birthDate,
    required this.intro,
    required this.medias,
    required this.contact,
  });
}

// 프로필 사진
class AddProfileMedia {
  String id;
  int orderNum;

  AddProfileMedia({
    required this.id,
    required this.orderNum,
  });

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "orderNum": this.orderNum,
    };
  }
}

// 프로필 연락처
class AddProfileContact {
  String contactId;
  ContactType contactType;

  AddProfileContact({
    required this.contactId,
    required this.contactType,
  });
}

// 프로필 유효성 검사
class AddProfileInputItemValidation {
  bool isValid;
  String validationMessage;

  AddProfileInputItemValidation({
    required this.isValid,
    required this.validationMessage,
  });

  static AddProfileInputItemValidation fail(String message) => AddProfileInputItemValidation(isValid: false, validationMessage: message);

  static AddProfileInputItemValidation success() => AddProfileInputItemValidation(isValid: true, validationMessage: "");
}
