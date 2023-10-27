enum DrawerSelectionType {
  shows("Shows", 0),
  boom("Boom", 0),
  kids("Kids", 0),
  music("Music", 0),
  clips("Clips", 0),
  discover("Discover", 1),
  myAccount('My Account', 1),
  myWatchlist("My Watchlist", 1),
  buyPremium("Buy Premium", 1),
  downloads("Downloads", 1),
  appSettings("App Settings", 2),
  language("Language", 2),
  helpAndSupport("Help & Support", 2),
  rateUs("Rate Us", 2);

  final String title;
  final int category;

  const DrawerSelectionType(this.title, this.category);

  bool get isShows => this == DrawerSelectionType.shows;

  bool get isBoom => this == DrawerSelectionType.boom;

  bool get isKids => this == DrawerSelectionType.kids;

  bool get isMusic => this == DrawerSelectionType.music;

  bool get isClips => this == DrawerSelectionType.clips;

  bool get isDiscover => this == DrawerSelectionType.discover;

  bool get isMyAccount => this == DrawerSelectionType.myAccount;

  bool get isMyWatchlist => this == DrawerSelectionType.myWatchlist;

  bool get isBuyPremium => this == DrawerSelectionType.buyPremium;

  bool get isDownloads => this == DrawerSelectionType.downloads;

  bool get isAppSettings => this == DrawerSelectionType.appSettings;

  bool get isLanguage => this == DrawerSelectionType.language;

  bool get isHelpAndSupport => this == DrawerSelectionType.helpAndSupport;

  bool get isRateUs => this == DrawerSelectionType.rateUs;
}
