
enum ContactType {
  LINE, WHATSAPP;

  static ContactType of(String contactType) {
    if (contactType.toLowerCase() == "line") {
      return ContactType.LINE;
    }

    if (contactType.toLowerCase() == "whatsapp") {
      return ContactType.WHATSAPP;
    }

    throw ArgumentError();
  }
}