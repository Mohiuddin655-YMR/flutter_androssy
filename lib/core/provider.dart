import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'androssy.dart';
import 'config.dart';
import 'localization.dart';
import 'notifier.dart';
import 'settings.dart';
import 'user.dart';

class AndrossyProvider extends InheritedWidget {
  final AndrossyConfigure configure;
  final AndrossyLocalizer localizer;
  final AndrossyNotifier<Androssy> notifier;

  AndrossyProvider({
    super.key,
    this.configure = const AndrossyConfigure.none(),
    this.localizer = const AndrossyLocalizer.none(),
    required super.child,
    Androssy? androssy,
  }) : notifier = AndrossyNotifier(androssy ?? const Androssy());

  static AndrossyProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AndrossyProvider>();
  }

  @override
  bool updateShouldNotify(covariant AndrossyProvider oldWidget) {
    return notifier.value != oldWidget.notifier.value;
  }

  I getInstance<I>() => configure.getInstance<I>();

  Androssy get androssy => notifier.value;

  AndrossySettings get settings => androssy.settings;

  bool get isDarkTheme => settings.theme == ThemeMode.dark;

  bool get isDefaultLanguage => language == "en";

  Locale get locale => settings.locale ?? const Locale('en', 'US');

  String get language => locale.languageCode;

  SharedPreferences get pref => getInstance();

  bool isActiveLanguage(String language) => this.language == language;

  String localize(String name) => localizer.localize(language, name);

  void notify(Androssy data) => notifier.update(data);

  void changeLocale(Locale locale) async {
    var raw = androssy.copy(locale: locale);
    var done = await pref.setString(kAndrossyPath, raw.json);
    if (done) notify(raw);
  }

  void changeLanguage(String language) => changeLocale(Locale(language, "US"));

  void changeTheme(ThemeMode value) async {
    var raw = androssy.copy(theme: value);
    var done = await pref.setString(kAndrossyPath, raw.json);
    if (done) notify(raw);
  }

  void resetSettings() async {
    var raw = androssy.copy(
      theme: ThemeMode.system,
      locale: const Locale("en"),
    );
    var done = await pref.setString(kAndrossyPath, raw.json);
    if (done) notify(raw);
  }

  void resetUser() async {
    var raw = androssy.copy(user: const AndrossyUser());
    var done = await pref.setString(kAndrossyPath, raw.json);
    if (done) notify(raw);
  }

  void reset() async {
    var raw = androssy.reset();
    var done = await pref.setString(kAndrossyPath, raw.json);
    if (done) notify(raw);
  }
}
