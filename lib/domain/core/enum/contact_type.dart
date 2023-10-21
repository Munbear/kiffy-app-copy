import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';

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
