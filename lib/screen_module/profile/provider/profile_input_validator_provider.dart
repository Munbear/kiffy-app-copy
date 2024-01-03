import 'package:Kiffy/constant/contact_type.dart';
import 'package:Kiffy/constant/gender_type.dart';
import 'package:Kiffy/screen_module/profile/provider/option_tag/option_profile_tag_provider.dart';
import 'package:Kiffy/screen_module/profile/section/add_profile/add_basic_profile_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openapi/openapi.dart';

// 프로필 생성 유효성 검사 프로바이더
final profileInputValidatorProvider =
    Provider<ProfileInputValidator>((ref) => ProfileInputValidator(ref));

class ProfileInputValidator {
  final Ref ref;

  ProfileInputValidator(this.ref);

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

  bool verifyPhoneNumber(String countryDialCode, String phoneNumber) {
    var countryNumberRegex = RegExp("^\\+\\d+\$");
    var phoneNumberRegex = RegExp("^\\d+\$");

    return countryNumberRegex.hasMatch(countryDialCode) &&
        phoneNumberRegex.hasMatch(phoneNumber);
  }

  bool verifyContactType(ContactType? contactType) {
    return contactType != null;
  }

  bool verifyContactId(String? contactId) {
    return contactId != null && contactId.isNotEmpty;
  }

  bool verifyBirthday(DateTime? birthday) {
    final now = DateTime.now();
    if ( // 80세 이상이라면
        birthday?.isBefore(DateTime(now.year - 80, now.month, now.day)) ??
            false) {
      return false;
    }

    if ( // 18세 미만이라면
        birthday?.isAfter(DateTime(now.year - 17, now.month, now.day)) ??
            false) {
      return false;
    }

    return birthday != null;
  }

  // tags id 값 받아오기
  void optionProfileMultiSelector(List<int> selectedItems, int id) {
    if (selectedItems.contains(id)) {
      selectedItems.remove(id);
    } else {
      selectedItems.add(id);
    }
    ref.read(multiSelecteState.notifier).update((state) => [...selectedItems]);
  }

  void nextStep({bool isFemale = false}) {
    final pageController = ref.read(profilePageController);

    if (!isFemale) {
      pageController
          .nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      )
          .then(
        (value) {
          ref.read(progressGauge.notifier).update((state) => state + 0.16);
        },
      );
    } else {
      pageController
          .animateToPage(
        4,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      )
          .then(
        (value) {
          ref.read(progressGauge.notifier).update((state) => state + 0.32);
        },
      );
    }
  }
}

// 프로필 생성 페이지 뷰 프로바이더
final profilePageController = StateProvider.autoDispose<PageController>(
    (ref) => PageController(initialPage: 0));
