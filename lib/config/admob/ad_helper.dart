import 'dart:io';

class AdHelper {
  // 베너 광고
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-3940256099942544/6300978111";
    } else if (Platform.isIOS) {
      return "MY_IOS_BANNER_AD_UNIT_ID";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }

  static String get bannerAdUnitTestId {
    if (Platform.isAndroid) {
      return "test";
    } else if (Platform.isIOS) {
      return "MY_IOS_BANNER_AD_UNIT_ID";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }

  // 전면 광고
  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-3940256099942544/1033173712";
    } else if (Platform.isIOS) {
      return "MY_IOS_BANNER_AD_UNIT_ID";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }
}
