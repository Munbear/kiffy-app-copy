import 'dart:io';

class AdHelper {
  // 베너 광고
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-7635870133849157/8174661034";
    } else if (Platform.isIOS) {
      return "MY_IOS_BANNER_AD_UNIT_ID";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }

  // 테스트 베너
  static String get bannerAdUnitTestId {
    if (Platform.isAndroid) {
      return "ca-app-pub-3940256099942544/6300978111";
    } else if (Platform.isIOS) {
      return "MY_IOS_BANNER_AD_UNIT_ID";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }
}
