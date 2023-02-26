enum WithDrawalReason {
  startNew,
  pause,
  notLike,
  gotLover,
  etc;

  static enumToString(reason) {
    switch (reason) {
      case WithDrawalReason.startNew:
        return "I want to start new";
      case WithDrawalReason.pause:
        return "I want to take a break";
      case WithDrawalReason.notLike:
        return "Not to my liking";
      case WithDrawalReason.gotLover:
        return "Got a lover";
      case WithDrawalReason.etc:
        return "etc.";
      default:
        return "";
    }
  }
}
