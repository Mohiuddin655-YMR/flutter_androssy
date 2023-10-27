enum MainScreens {
  home("home", "Home"),
  tv("tv", "TV"),
  movies("movies", "Movies"),
  drama("drama", "Drama"),
  comingSoon("coming_soon", "Coming Soon"),
  none("/", "Home");

  final String name;
  final String title;

  static String get route => none.name;

  const MainScreens(this.name, this.title);
}
