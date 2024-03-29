import 'package:flutter/material.dart';

import '../core/androssy.dart';
import '../core/provider.dart';

extension BuildContextExtension on BuildContext {
  AndrossyProvider? get provider => AndrossyProvider.of(this);

  bool get isDarkTheme {
    return MediaQuery.of(this).platformBrightness == Brightness.dark;
  }

  void changeLocale(Locale locale) => provider?.changeLocale(locale);

  void changeLanguage(String language) => provider?.changeLanguage(language);

  void notify(Androssy data) => provider?.notify(data);
}
