enum MediaType {
  IMAGE,
  VIDEO;

  static MediaType fromString(String media) {
    switch (media) {
      case "IMAGE":
        return MediaType.IMAGE;
      case "VIDEO":
        return MediaType.VIDEO;
      default:
        return MediaType.IMAGE;
    }
  }
}
