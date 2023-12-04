import 'package:Kiffy/constant/contact_type.dart';
import 'package:Kiffy/constant/gender_type.dart';
import 'package:Kiffy/screen_module/profile/provider/profile_input_validator_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openapi/openapi.dart';

final profileInputValueProvider =
    NotifierProvider<ProfileInputValueNotifier, ProfileInputValue>(
  () => ProfileInputValueNotifier(),
);

class ProfileInputValueNotifier extends Notifier<ProfileInputValue> {
  @override
  ProfileInputValue build() {
    return ProfileInputValue.empty();
  }

  void setNickName(String nickName) {
    state.nickName = nickName;
    state = state;
  }

  bool isNicknameValidated() {
    return ref
        .read(profileInputValidatorProvider)
        .verifyNickname(state.nickName);
  }

  void setGender(Gender gender) {
    state.gender = gender;
    state = state;
  }

  bool isGenderValidated() {
    return ref.read(profileInputValidatorProvider).verifyGender(state.gender);
  }

  void setContactType(ContactType contactType) {
    state.contactType = contactType;
    state = state;
  }

  bool isContactTypeValidated() {
    return ref
        .read(profileInputValidatorProvider)
        .verifyContactType(state.contactType);
  }

  void setContactId(String contactId) {
    state.contactId = contactId;
    state = state;
  }

  bool isContactIdValidated() {
    return ref
        .read(profileInputValidatorProvider)
        .verifyContactId(state.contactId);
  }

  void setIntro(String intro) {
    state.intro = intro;
    state = state;
  }

  bool isIntroValidated() {
    return true;
  }

  void setMedias(List<MediaView> medias) {
    state.medias = medias;
    state = state;
  }

  bool isMediasValidated() {
    return ref.read(profileInputValidatorProvider).verifyMedias(state.medias);
  }

  void setPhoneNumber(String countryDialCode, String phoneNumber) {
    state.phoneNumber = CountryDialCodeAndPhoneNumber(
      countryDialCode: countryDialCode,
      phoneNumber: phoneNumber,
    );
    state = state;
  }

  bool isPhoneNumberValidated() {
    if (state.phoneNumber?.countryDialCode == null ||
        state.phoneNumber?.phoneNumber == null) {
      return false;
    }

    return ref.read(profileInputValidatorProvider).verifyPhoneNumber(
          state.phoneNumber!.countryDialCode,
          state.phoneNumber!.phoneNumber,
        );
  }
}

class CountryDialCodeAndPhoneNumber {
  final String countryDialCode;
  final String phoneNumber;

  const CountryDialCodeAndPhoneNumber({
    required this.countryDialCode,
    required this.phoneNumber,
  });
}

class ProfileInputValue {
  String nickName;
  Gender? gender;
  ContactType? contactType;
  String contactId;
  String intro;
  List<MediaView> medias;
  CountryDialCodeAndPhoneNumber? phoneNumber;

  ProfileInputValue({
    required this.nickName,
    required this.contactId,
    required this.intro,
    required this.medias,
  });

  factory ProfileInputValue.empty() {
    return ProfileInputValue(
      nickName: "",
      contactId: "",
      intro: "",
      medias: List.empty(growable: true),
    );
  }
}
