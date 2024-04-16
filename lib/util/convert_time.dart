class ConvertTime {
  static String formatTimeDifference(DateTime dateTime) {
    DateTime now = DateTime.now().toUtc();
    Duration difference = now.difference(dateTime);

    double seconds = difference.inSeconds.toDouble();
    double minutes = seconds / 60;
    double hours = minutes / 60;
    double days = hours / 24;

    if (days >= 2) {
      return "${days.toInt()}d ago";
    } else if (days >= 1) {
      return "1d ago";
    } else if (hours >= 2) {
      return "${hours.toInt()}h ago";
    } else if (hours >= 1) {
      return "1h ago";
    } else if (minutes >= 2) {
      return "${minutes.toInt()}m ago";
    } else {
      return "just now";
    }
  }
}
