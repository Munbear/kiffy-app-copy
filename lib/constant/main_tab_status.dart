enum MainTabStatus {
  explore(tabIcon: "assets/icons/explore_icon.png"),
  matching(tabIcon: "assets/icons/match_icon.png"),
  my(tabIcon: "assets/icons/mypage_icon.png");

  const MainTabStatus({required this.tabIcon});

  final String tabIcon;
}
