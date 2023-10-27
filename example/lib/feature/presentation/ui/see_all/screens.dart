enum SeeAllScreens {
  none("see_all", "See All");

  final String name;
  final String title;

  static String get route => none.name;

  const SeeAllScreens(this.name, this.title);
}
