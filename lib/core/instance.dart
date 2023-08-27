part of '../core.dart';

class AndrossyInstance {
  late BuildContext context;
  late Androssy androssy;
  late AndrossyController controller;
  SharedPreferences? _pref;

  AndrossyProvider? _provider;

  AndrossyInstance._();

  static AndrossyInstance? _proxy;

  static AndrossyInstance get i => _proxy ??= AndrossyInstance._();

  void init({
    required BuildContext context,
    Androssy? androssy,
    AndrossyController? controller,
  }) async {
    this.context = context;
    this.controller = controller ?? AndrossyController();
    this.androssy = androssy ?? const Androssy();
  }

  void modify({
    required BuildContext context,
    Androssy? androssy,
    AndrossyController? controller,
  }) async {
    this.context = context;
    this.controller = controller ?? this.controller;
    this.androssy = androssy ?? this.androssy;
  }

  /// Customization properties
  AndrossyProvider? get provider {
    return _provider ??= context.find();
  }

  SharedPreferences get preferences => _pref!;

  Future<SharedPreferences> getPreferences([
    SharedPreferences? preferences,
  ]) async {
    return _pref ??= preferences ?? await SharedPreferences.getInstance();
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
    if (_pref != null) {
      var raw = androssy.copy(theme: mode);
      var done = await preferences.setString(kAndrossyPath, raw.json);
      if (done && provider != null) provider!.notify(raw);
    }
  }

  /// Locale properties
  bool get isDefaultLanguage => language == "en";

  String get language => androssy.settings.locale?.languageCode ?? "en";

  void setLocale(Locale locale) async {
    if (_pref != null) {
      var raw = androssy.copy(locale: locale);
      var done = await preferences.setString(kAndrossyPath, raw.json);
      if (done && provider != null) provider!.notify(raw);
    }
  }

  void setLanguage(String language) => setLocale(Locale(language));

  void setCountry(String country) => setLocale(Locale(language, country));

  /// Settings properties
  void setSettings(Androssy androssy) async {
    if (_pref != null) {
      var done = await preferences.setString(
        kAndrossyPath,
        androssy.json,
      );
      if (done && provider != null) provider!.notify(androssy);
    }
  }
}
