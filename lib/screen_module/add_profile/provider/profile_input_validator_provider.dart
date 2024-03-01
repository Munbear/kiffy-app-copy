import 'package:Kiffy/constant/enum/contact_type.dart';
import 'package:Kiffy/constant/enum/gender_type.dart';
import 'package:Kiffy/screen_module/common/provider/option_profile_tag_provider.dart';
import 'package:Kiffy/screen_module/add_profile/section/add_basic_profile_section.dart';
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

  // 성별
  bool verifyGender(Gender? gender) {
    return gender != null;
  }

  // 이미지
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

  Future<void> jumpPage() async {
    final pageController = ref.read(profilePageController);
    pageController.jumpToPage(4);
  }

  void nextStep(
      {bool isFemale = false, bool isLastPage = false, int currentPage = 0}) {
    final pageController = ref.read(profilePageController);
    int pageValue = currentPage + 1;
    int gaugeValue = (pageValue / 8 * 100).round();

    if (!isFemale) {
      pageController
          .nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      )
          .then(
        (value) {
          if (!isLastPage) {
            ref
                .read(progressGaug2.notifier)
                .update((state) => state = gaugeValue);
            // ref.read(progressGauge.notifier).update((state) => state + 0.16);
          } else {
            ref
                .read(progressGaug2.notifier)
                .update((state) => state = gaugeValue);
            // ref.read(progressGauge.notifier).update((state) => state + 0.04);
          }
        },
      );
    } else {
      jumpPage().then(
        (value) {
          ref
              .read(progressGaug2.notifier)
              .update((state) => state = gaugeValue);
          // ref.read(progressGauge.notifier).update((state) => state + 0.32);
        },
      );
    }
  }
}

// 프로필 생성 페이지 뷰 프로바이더
final profilePageController = StateProvider.autoDispose<PageController>(
    (ref) => PageController(initialPage: 0));
