enum MainTabStatus {
  explore(tabIcon: "assets/icons/explore_icon.png", value: "explore"),
  matching(tabIcon: "assets/icons/match_icon.png", value: "matching"),
  my(tabIcon: "assets/icons/mypage_icon.png", value: "my");

  const MainTabStatus({
    required this.tabIcon,
    required this.value,
  });

  final String tabIcon;
  final String value;
}
