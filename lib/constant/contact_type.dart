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
  LINE,
  WHATSAPP;
  // TELEGRAM;

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
        // TODO: Handle this case.
        break;
    }

    return ContactType.LINE;
  }

  static contactAppIcon(contactType) {
    switch (contactType) {
      case ContactType.LINE:
        return Image.asset("assets/icons/line_icon.png");
      case ContactType.WHATSAPP:
        return Image.asset("assets/icons/whatsapp_icon.png");
      // case ContactType.TELEGRAM:
      //   return Image.asset("텔리그렘 아이콘");
      default:
        return "";
    }
  }

  UserProfileContactEnumView toContactEnumView() {
    if (this == LINE) {
      return UserProfileContactEnumView.LINE;
    }

    return UserProfileContactEnumView.WHATSAPP;
  }
}
