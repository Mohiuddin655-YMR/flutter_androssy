library theme;

import 'package:app_color/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_androssy/core.dart';

import 'index.dart';

AndrossyTheme theme = AndrossyTheme(_light, _dark);

ThemeData _light = ThemeData.from(
  useMaterial3: true,
  colorScheme: AppColors.colorScheme.light,
).copyWith(
  /// BASE PROPERTIES
  scaffoldBackgroundColor: AppColors.background.light,
  splashColor: Colors.black12,

  /// APPBAR PROPERTIES
  appBarTheme: AppBarTheme(
    elevation: 0,
    backgroundColor: AppColors.appbar.light,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(
      color: AppColors.appbarIcon.light,
      size: 24,
    ),
    titleTextStyle: TextStyle(
      color: AppColors.appbarTitle.light,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
    systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
      statusBarColor: AppColors.appbar.light,
      systemNavigationBarColor: Colors.transparent,
    ),
  ),
  bottomAppBarTheme: BottomAppBarTheme(
    elevation: 0.5,
    color: AppColors.appbar.light,
    surfaceTintColor: Colors.transparent,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: AppColors.appbar.light,
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.white.t50,
    selectedLabelStyle: const TextStyle(
      fontSize: 12,
    ),
    unselectedLabelStyle: const TextStyle(
      fontSize: 12,
    ),
  ),

  /// BODY PROPERTIES

  dividerTheme: DividerThemeData(
    color: Colors.grey.t10,
    indent: 24,
    endIndent: 24,
  ),
  iconTheme: IconThemeData(
    color: AppColors.bodyIcon.light,
  ),

  textTheme: TextTheme(
    titleMedium: TextStyle(
      color: AppColors.bodyTitleMedium.light,
      fontSize: 16,
      fontFamily: "",
      fontWeight: FontWeight.normal,
    ),
    titleSmall: TextStyle(
      color: AppColors.bodySubtitle.light,
      fontSize: 14,
      fontFamily: "",
      fontWeight: FontWeight.normal,
    ),
  ),
);

ThemeData _dark = ThemeData.from(
  useMaterial3: true,
  colorScheme: AppColors.colorScheme.dark,
).copyWith(
  /// BASE PROPERTIES
  scaffoldBackgroundColor: AppColors.background.dark,
  splashColor: Colors.white12,

  /// APPBAR PROPERTIES
  appBarTheme: AppBarTheme(
    elevation: 0,
    backgroundColor: AppColors.appbar.dark,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(
      color: AppColors.appbarIcon.dark,
    ),
    titleTextStyle: TextStyle(
      color: AppColors.appbarTitle.dark,
      fontSize: 18,
    ),
    systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
      statusBarColor: AppColors.appbar.dark,
      systemNavigationBarColor: Colors.transparent,
    ),
  ),

  /// BODY PROPERTIES
  iconTheme: IconThemeData(
    color: AppColors.bodyIcon.dark,
  ),

  textTheme: TextTheme(
    titleMedium: TextStyle(
      color: AppColors.bodyTitleMedium.dark,
      fontSize: 16,
      fontFamily: "",
      fontWeight: FontWeight.normal,
    ),
    titleSmall: TextStyle(
      color: AppColors.bodySubtitle.dark,
      fontSize: 14,
      fontFamily: "",
      fontWeight: FontWeight.normal,
    ),
  ),

  /// NONE
  bottomAppBarTheme: BottomAppBarTheme(
    elevation: 0.5,
    color: AppColors.appbar.dark,
    surfaceTintColor: Colors.transparent,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: AppColors.primary,
    unselectedItemColor: Colors.white.t50,
  ),
  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: AppColors.appbar.dark,
    surfaceTintColor: AppColors.appbar.dark,
  ),
);
