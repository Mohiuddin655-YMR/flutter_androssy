import 'dart:convert';

import 'package:flutter/material.dart';

class AndrossyLocalizer {
  final Map<String, Map<String, String>> localizations;

  const AndrossyLocalizer.none() : localizations = const {};

  /// ### Example
  /// ```dart
  /// Localizer localizer = Localizer(
  ///   localizations: [
  ///     const Localization(
  ///       name: "Home",
  ///       values: [
  ///         SubLocalization(language: "bn", value: "হোম"),
  ///       ],
  ///     ),
  ///     const Localization(
  ///       name: "Notification",
  ///       values: [
  ///         SubLocalization(language: "bn", value: "বার্তা"),
  ///       ],
  ///     ),
  ///     const Localization(
  ///       name: "Profile",
  ///       values: [
  ///         SubLocalization(language: "bn", value: "প্রোফাইল"),
  ///       ],
  ///     ),
  ///   ],
  /// );
  /// ```
  AndrossyLocalizer({
    List<Localization> localizations = const [],
  }) : localizations = _localizations(localizations);

  /// ### Example JSON
  /// ```dart
  /// {
  ///   "Home": {
  ///     "bn": "হোম"
  ///   },
  ///   "Notification": {
  ///     "bn": "বার্তা"
  ///   },
  ///   "Profile": {
  ///     "bn": "প্রোফাইল"
  ///   }
  /// }
  ///
  ///```
  /// ### Example
  ///```dart
  ///  var json = await rootBundle.loadString("assets/contents/localizations.json");
  ///  Localizer localizer = Localizer.fromJson(json);
  ///```
  AndrossyLocalizer.fromJson(String json)
      : localizations = _json(jsonDecode(json));

  /// ### Example
  /// ```dart
  /// Localizer localizer = Localizer.fromMap(
  ///   {
  ///     "Home": {
  ///       "bn": "হোম",
  ///     },
  ///     "Notification": {
  ///       "bn": "বার্তা",
  ///     },
  ///     "Profile": {
  ///       "bn": "প্রোফাইল",
  ///     }
  ///   },
  /// )
  ///```
  AndrossyLocalizer.fromMap(Map<String, Map<String, String>> map)
      : localizations = map;

  /// ### Example
  /// ```dart
  /// Localizer localizer = Localizer.fromLocalizedMap(
  ///   {
  ///     "Home": {
  ///       const Locale("bn"): "হোম",
  ///     },
  ///     "Notification": {
  ///       const Locale("bn"): "বার্তা",
  ///     },
  ///     "Profile": {
  ///       const Locale("bn"): "প্রোফাইল",
  ///     }
  ///   },
  /// );
  ///```
  AndrossyLocalizer.fromLocalizedMap(Map<String, Map<Locale, String>> map)
      : localizations = _locales(map);

  /// localizer.localize("bn", "Home", false);
  String localize(String language, String name) {
    return localizations[name]?[language] ?? name;
  }

  static Map<String, Map<String, String>> _localizations(
    List<Localization> data,
  ) {
    final Map<String, Map<String, String>> outer = {};
    for (var parent in data) {
      final Map<String, String> inner = {};
      for (var child in parent.values) {
        inner.putIfAbsent(child.language, () => child.value);
      }
      outer.putIfAbsent(parent.name, () => inner);
    }
    return outer;
  }

  static Map<String, Map<String, String>> _json(Map<String, dynamic> data) {
    final Map<String, Map<String, String>> outer = {};
    for (var a in data.entries) {
      final Map<String, String> inner = {};
      for (var b in a.value.entries) {
        if (b is MapEntry<String, dynamic>) {
          if (b.value is String) {
            inner.putIfAbsent(b.key, () => b.value);
          }
        }
      }
      outer.putIfAbsent(a.key, () => inner);
    }
    return outer;
  }

  static Map<String, Map<String, String>> _locales(
    Map<String, Map<Locale, String>> data,
  ) {
    final Map<String, Map<String, String>> outer = {};
    for (var a in data.entries) {
      final Map<String, String> inner = {};
      for (var b in a.value.entries) {
        inner.putIfAbsent(b.key.languageCode, () => b.value);
      }
      outer.putIfAbsent(a.key, () => inner);
    }
    return outer;
  }
}

class Localization {
  final String name;

  final List<SubLocalization> values;

  const Localization({
    required this.name,
    this.values = const [],
  });
}

class SubLocalization {
  final String language;
  final String value;

  const SubLocalization({
    required this.language,
    required this.value,
  });
}
