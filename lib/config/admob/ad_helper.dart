import 'dart:io';

class AdHelper {
  // 베너 광고
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return KeyBox.adAndroidUnitIdProd;
    } else if (Platform.isIOS) {
      return KeyBox.adiOSUnitIdProd
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }

  // 테스트 베너
  static String get bannerAdUnitTestId {
    if (Platform.isAndroid) {
      return KeyBox.adAndroidUnitIdDev
    } else if (Platform.isIOS) {
      return KeyBox.adiOSUnitIdDev
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }
}
