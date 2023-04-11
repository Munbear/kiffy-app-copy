enum UserStatus {
  JOINER,
  APPROVED,
  PENDING,
  REJECTED;

  static UserStatus fromString(String status) {
    switch (status) {
      case "JOINER":
        return UserStatus.JOINER;
      case "APPROVED":
        return UserStatus.APPROVED;
      case "PENDING":
        return UserStatus.PENDING;
      case "REJECTED":
        return UserStatus.REJECTED;
      default:
        return UserStatus.JOINER;
    }
  }
}
