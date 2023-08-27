part of '../core.dart';

class AndrossyInstance {
  late BuildContext context;
  late Androssy androssy;
  late SharedPreferences preferences;
  late AndrossyController controller;

  AndrossyProvider? _provider;
  int index = 0;

  AndrossyInstance._();

  static AndrossyInstance? _proxy;

  static AndrossyInstance get i => _proxy ??= AndrossyInstance._();

  void init({
    required BuildContext context,
    Androssy? androssy,
    AndrossyProvider? provider,
    SharedPreferences? preferences,
    AndrossyController? controller,
  }) async {
    this.context = context;
    this.controller = controller ?? AndrossyController();
    this.androssy = androssy ?? const Androssy();
    this.preferences = preferences ?? await SharedPreferences.getInstance();
  }

  /// Customization properties
  AndrossyProvider? get provider {
    return _provider ??= context.find();
  }

  I getInstance<I>() {
    if (provider != null) {
      return provider!.getInstance<I>();
    } else {
      throw UnimplementedError("Global instance not found!");
    }
  }

  String translate(String name) => provider?.localize(language, name) ?? name;

  /// User properties
  AndrossyUser get user => androssy.user;

  String? get currentUid => user.uid;

  /// Theme properties
  bool get isDarkTheme => androssy.settings.theme == ThemeMode.dark;

  void setThemeMode(ThemeMode mode) async {
    var raw = androssy.copy(theme: mode);
    var done = await preferences.setString(kAndrossyPath, raw.json);
    if (done && provider != null) provider!.notify(raw);
  }

  /// Locale properties
  bool get isDefaultLanguage => language == "en";

  String get language => androssy.settings.locale?.languageCode ?? "en";

  void setLocale(Locale locale) async {
    var raw = androssy.copy(locale: locale);
    var done = await preferences.setString(kAndrossyPath, raw.json);
    if (done && provider != null) provider!.notify(raw);
  }

  void setLanguage(String language) => setLocale(Locale(language));

  void setCountry(String country) => setLocale(Locale(language, country));

  /// Settings properties
  void setSettings(Androssy androssy) async {
    var done = await preferences.setString(
      kAndrossyPath,
      androssy.json,
    );
    if (done && provider != null) provider!.notify(androssy);
  }
}
