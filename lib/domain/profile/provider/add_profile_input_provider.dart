import 'package:Kiffy/domain/core/model/contact_type.dart';
import 'package:Kiffy/domain/core/model/gender_type.dart';
import 'package:Kiffy/model/user_profile_create_and_edit_command_profile_contact/user_profile_create_and_edit_command_profile_contact.dart';
import 'package:Kiffy/model/user_profile_create_and_edit_command_profile_media/user_profile_create_and_edit_command_profile_media.dart';
import 'package:Kiffy/model/user_profile_create_command/user_profile_create_command.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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

// 프로필 생성 상태
final addProfileInputProvider = StateNotifierProvider<AddProfileInputState, UserProfileCreateCommand>((ref) => AddProfileInputState(ref));

// 유저 프로필 상태
class AddProfileInputState extends StateNotifier<UserProfileCreateCommand> {
  final Ref ref;

  AddProfileInputState(this.ref)
      : super(
          UserProfileCreateCommand(
            name: "",
            gender: Gender.MALE,
            birthDate: "",
            intro: "",
            medias: UserProfileCreateAndEditCommandProfileMedia(id: "", orderNum: 0),
            contacts: UserProfileCreateAndEditCommanProfileContact(contactId: "", contactType: ContactType.LINE),
          ),
        );

  // 프로필 이름 유효성 검사
  AddProfileInputItemValidation setName(String name) {
    if (name.isEmpty) {
      return AddProfileInputItemValidation.fail("* 이름을 입력해주세요");
    }

    if (name.length >= 20) {
      return AddProfileInputItemValidation.fail("* 이름은 20자 이내로 입력해주세요");
    }

    // state.name = name;
    state.name;
    print(state.name);

    return AddProfileInputItemValidation.success();
  }

  // 프로필 성벌 유효성 검사
  AddProfileInputItemValidation setGender(Gender? gender) {
    if (gender == null) {
      return AddProfileInputItemValidation.fail("* 성별을 입력해주세요");
    }

    // state.gender = gender;
    state.gender;
    return AddProfileInputItemValidation.success();
  }

  // 프로필 생년월일 유효성 검사
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

    // state.birthDate = birthDate;
    state.birthDate;
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

    // state.contact = UserProfileCreateAndEditCommanProfileContact(contactId: contactId, contactType: contactType);
    state.contacts;
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

    // state.intro = intro;
    state.intro;
    return AddProfileInputItemValidation.success();
  }

  // 프로필 사진 유효성 검사
  AddProfileInputItemValidation setMedias(List<UserProfileCreateAndEditCommandProfileMedia> medias) {
    if (medias.length < 2) {
      return AddProfileInputItemValidation.fail("최소 2장 이상의 사진을 등록해주세요");
    }

    // state.medias = medias;
    state.medias;
    return AddProfileInputItemValidation.success();
  }
}

// // 유저 프로필 정보
// class AddProfileInput {
//   String name;
//   Gender gender;
//   String birthDate;
//   String intro;
//   List<AddProfileMedia> medias;
//   AddProfileContact contact;

//   AddProfileInput({
//     required this.name,
//     required this.gender,
//     required this.birthDate,
//     required this.intro,
//     required this.medias,
//     required this.contact,
//   });
// }

// 프로필 사진
// class AddProfileMedia {
//   String id;
//   int orderNum;

//   AddProfileMedia({
//     required this.id,
//     required this.orderNum,
//   });

//   Map<String, dynamic> toJson() {
//     return {
//       "id": id,
//       "orderNum": orderNum,
//     };
//   }
// }

// // 프로필 연락처
// class AddProfileContact {
//   String contactId;
//   ContactType contactType;

//   AddProfileContact({
//     required this.contactId,
//     required this.contactType,
//   });
// }
