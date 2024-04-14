class ConvertTime {
  static String formatTimeDifference(DateTime dateTime) {
    DateTime now = DateTime.now().toUtc();
    Duration difference = now.difference(dateTime);

    double seconds = difference.inSeconds.toDouble();
    double minutes = seconds / 60;
    double hours = minutes / 60;
    double days = hours / 24;

    if (days >= 2) {
      return "${days.toInt()}일 전";
    } else if (days >= 1) {
      return "1일 전";
    } else if (hours >= 2) {
      return "${hours.toInt()}시간 전";
    } else if (hours >= 1) {
      return "1시간 전";
    } else if (minutes >= 2) {
      return "${minutes.toInt()}분 전";
    } else {
      return "방금 전";
    }
  }
}
