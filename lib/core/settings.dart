import 'dart:convert';

import 'package:flutter/material.dart';

class AndrossySettings {
  final ThemeMode theme;
  final Locale? locale;

  const AndrossySettings({
    this.theme = ThemeMode.system,
    this.locale,
  });

  factory AndrossySettings.from(Map<String, dynamic> source) {
    var lo = source["locale"];
    var tm = source["theme"];
    return AndrossySettings(
      locale: lo is Map<String, dynamic> ? lo.locale : null,
      theme: tm is String ? tm.themeMode : ThemeMode.system,
    );
  }

  AndrossySettings copy({
    ThemeMode? theme,
    Locale? locale,
  }) {
    return AndrossySettings(
      theme: theme ?? this.theme,
      locale: locale ?? this.locale,
    );
  }

  Map<String, dynamic> get source {
    return {
      "theme": theme.name,
      "locale": {
        "country_code": locale?.countryCode,
        "language_code": locale?.languageCode,
      },
    };
  }

  String get json => jsonEncode(source);

  Map<String, dynamic> getSource(String? json) => jsonDecode(json ?? "{}");

  @override
  String toString() => source.toString();
}

extension _ThemeModeExtension on String {
  ThemeMode get themeMode {
    if (this == ThemeMode.light.name) {
      return ThemeMode.light;
    } else if (this == ThemeMode.dark.name) {
      return ThemeMode.dark;
    } else {
      return ThemeMode.system;
    }
  }
}

extension _ThemeLocaleExtension on Map<String, dynamic> {
  Locale? get locale {
    var lc = this["language_code"];
    var cc = this["country_code"];
    if (lc is String) {
      return Locale(lc, cc is String ? cc : null);
    }
    return null;
  }
}
