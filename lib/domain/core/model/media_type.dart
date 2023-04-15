enum MediaType {
  image,
  video;

  static MediaType fromString(String media) {
    switch (media) {
      case "IMAGE":
        return MediaType.image;
      case "VIDEO":
        return MediaType.video;
      default:
        return MediaType.image;
    }
  }
}
