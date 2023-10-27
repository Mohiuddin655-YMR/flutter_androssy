enum PlayerScreens {
  none("player", "Player");

  final String name;
  final String title;

  static String get route => none.name;

  const PlayerScreens(this.name, this.title);
}
