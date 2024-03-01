import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';

enum SNSType {
  LINE("line"),
  WHATSAPP("whatsapp"),
  TELEGRAM("telegram");

  const SNSType(this.text);

  final String text;

  Widget snsImage() {
    switch (this) {
      case SNSType.LINE:
        return Image.asset("assets/images/line_image.png");
      default:
        return Image.asset("assets/images/line_image.png");
    }
  }
}

enum ContactType {
  TIKTOK,
  INSTAGRAM,
  FACEBOOK,
  TELEGRAM,
  WHATSAPP,
  LINE,
  ;

  static ContactType of(String contactType) {
    if (contactType.toLowerCase() == "line") {
      return ContactType.LINE;
    }

    if (contactType.toLowerCase() == "whatsapp") {
      return ContactType.WHATSAPP;
    }

    throw ArgumentError();
  }

  static ContactType fromEnumView(UserProfileContactEnumView enumView) {
    switch (enumView) {
      case UserProfileContactEnumView.WHATSAPP:
        return ContactType.WHATSAPP;
      case UserProfileContactEnumView.LINE:
        return ContactType.LINE;
      case UserProfileContactEnumView.FACEBOOK:
        return ContactType.FACEBOOK;
      case UserProfileContactEnumView.INSTAGRAM:
        return ContactType.INSTAGRAM;
      case UserProfileContactEnumView.TELEGRAM:
        return ContactType.TELEGRAM;
      case UserProfileContactEnumView.TIKTOK:
        return ContactType.TIKTOK;
      default:
        throw Exception();
    }
  }

  static contactAppIcon(contactType) {
    switch (contactType) {
      case ContactType.LINE:
        return Image.asset("assets/icons/line_icon.png", fit: BoxFit.cover);
      case ContactType.WHATSAPP:
        return Image.asset("assets/icons/whatsapp_icon.png", fit: BoxFit.cover);
      case ContactType.TELEGRAM:
        return Image.asset("assets/icons/telegram_icon.png", fit: BoxFit.cover);
      case ContactType.FACEBOOK:
        return Image.asset("assets/icons/facebook_icon.png", fit: BoxFit.cover);
      case ContactType.INSTAGRAM:
        return Image.asset("assets/icons/instagram_icon.png",
            fit: BoxFit.cover);
      case ContactType.TIKTOK:
        return Image.asset("assets/icons/tiktok_icon.png", fit: BoxFit.cover);
      default:
        return "";
    }
  }

  UserProfileContactEnumView toContactEnumView() {
    switch (this) {
      case ContactType.LINE:
        return UserProfileContactEnumView.LINE;
      case ContactType.WHATSAPP:
        return UserProfileContactEnumView.WHATSAPP;
      case ContactType.TELEGRAM:
        return UserProfileContactEnumView.TELEGRAM;
      case ContactType.FACEBOOK:
        return UserProfileContactEnumView.FACEBOOK;
      case ContactType.INSTAGRAM:
        return UserProfileContactEnumView.INSTAGRAM;
      case ContactType.TIKTOK:
        return UserProfileContactEnumView.TIKTOK;
      default:
        throw Exception();
    }
  }
}
