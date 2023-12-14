import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'settings.dart';
import 'user.dart';

String kAndrossyPath = "__androssy__";
String kAndrossySettingsPath = "settings";
String kAndrossyUserPath = "user";

class Androssy {
  final AndrossySettings settings;
  final AndrossyUser user;

  const Androssy({
    this.settings = const AndrossySettings(),
    this.user = const AndrossyUser(),
  });

  factory Androssy.from(SharedPreferences preferences) {
    var raw = preferences.getString(kAndrossyPath) ?? "{}";
    var source = jsonDecode(raw);
    return Androssy._from(source is Map<String, dynamic> ? source : {});
  }

  factory Androssy._from(Map<String, dynamic> source) {
    var mS = source[kAndrossySettingsPath];
    var mU = source[kAndrossyUserPath];
    return Androssy(
      settings: AndrossySettings.from(mS is Map<String, dynamic> ? mS : {}),
      user: AndrossyUser.from(mU is Map<String, dynamic> ? mU : {}),
    );
  }

  Androssy copy({
    ThemeMode? theme,
    Locale? locale,
    AndrossyUser? user,
  }) {
    return Androssy(
      settings: settings.copy(locale: locale, theme: theme),
      user: user ?? this.user,
    );
  }

  Androssy reset() {
    source.clear();
    return this;
  }

  Map<String, dynamic> get source {
    return {
      kAndrossySettingsPath: settings.source,
      kAndrossyUserPath: user.source,
    };
  }

  String get json => jsonEncode(source);

  Map<String, dynamic> getSource(String? json) => jsonDecode(json ?? "{}");

  @override
  String toString() => source.toString();
}
