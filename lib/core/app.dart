import 'package:flutter/material.dart';
import 'package:flutter_network_status/network_status.dart';

import 'androssy.dart';
import 'builder.dart';
import 'config.dart';
import 'localization.dart';
import 'notifier.dart';
import 'provider.dart';

class AndrossyApp extends MaterialApp {
  final Androssy androssy;
  final AndrossyConfigure configure;
  final AndrossyLocalizer localizer;
  final AndrossyNotifier<Androssy> notifier;
  final bool userNetworkStatus;

  AndrossyApp({
    super.key,
    super.navigatorKey,
    super.scaffoldMessengerKey,
    super.home,
    super.routes,
    super.initialRoute,
    super.onGenerateRoute,
    super.onGenerateInitialRoutes,
    super.onUnknownRoute,
    super.onNavigationNotification,
    super.navigatorObservers,
    super.builder,
    super.title = '',
    super.onGenerateTitle,
    super.color,
    super.theme,
    super.darkTheme,
    super.highContrastTheme,
    super.highContrastDarkTheme,
    super.themeAnimationDuration = kThemeAnimationDuration,
    super.themeAnimationCurve = Curves.linear,
    super.locale,
    super.localizationsDelegates,
    super.localeListResolutionCallback,
    super.localeResolutionCallback,
    super.supportedLocales = const <Locale>[Locale('en', 'US')],
    super.debugShowMaterialGrid = false,
    super.showPerformanceOverlay = false,
    super.checkerboardRasterCacheImages = false,
    super.checkerboardOffscreenLayers = false,
    super.showSemanticsDebugger = false,
    super.debugShowCheckedModeBanner = false,
    super.shortcuts,
    super.actions,
    super.restorationScopeId,
    super.scrollBehavior,
    this.configure = const AndrossyConfigure.none(),
    this.localizer = const AndrossyLocalizer.none(),
    this.androssy = const Androssy(),
    this.userNetworkStatus = false,
  }) : notifier = AndrossyNotifier(androssy);

  AndrossyApp.router({
    super.key,
    super.scaffoldMessengerKey,
    super.routeInformationProvider,
    super.routeInformationParser,
    super.routerDelegate,
    super.routerConfig,
    super.backButtonDispatcher,
    super.builder,
    super.title = '',
    super.onGenerateTitle,
    super.onNavigationNotification,
    super.color,
    super.theme,
    super.darkTheme,
    super.highContrastTheme,
    super.highContrastDarkTheme,
    super.themeAnimationDuration = kThemeAnimationDuration,
    super.themeAnimationCurve = Curves.linear,
    super.locale,
    super.localizationsDelegates,
    super.localeListResolutionCallback,
    super.localeResolutionCallback,
    super.supportedLocales = const <Locale>[Locale('en', 'US')],
    super.debugShowMaterialGrid = false,
    super.showPerformanceOverlay = false,
    super.checkerboardRasterCacheImages = false,
    super.checkerboardOffscreenLayers = false,
    super.showSemanticsDebugger = false,
    super.debugShowCheckedModeBanner = false,
    super.shortcuts,
    super.actions,
    super.restorationScopeId,
    super.scrollBehavior,
    this.configure = const AndrossyConfigure.none(),
    this.localizer = const AndrossyLocalizer.none(),
    this.androssy = const Androssy(),
    this.userNetworkStatus = false,
  })  : assert(routerDelegate != null || routerConfig != null),
        notifier = AndrossyNotifier(androssy),
        super.router();

  @override
  State<AndrossyApp> createState() => _AndrossyAppState();
}

class _AndrossyAppState extends State<AndrossyApp> {
  bool get _usesRouter {
    return widget.routerDelegate != null || widget.routerConfig != null;
  }

  Widget _appBuilder(BuildContext context, Androssy value) {
    if (_usesRouter) {
      return MaterialApp.router(
        actions: widget.actions,
        backButtonDispatcher: widget.backButtonDispatcher,
        builder: widget.builder,
        checkerboardOffscreenLayers: widget.checkerboardOffscreenLayers,
        checkerboardRasterCacheImages: widget.checkerboardRasterCacheImages,
        color: widget.color,
        darkTheme: widget.darkTheme,
        debugShowCheckedModeBanner: widget.debugShowCheckedModeBanner,
        debugShowMaterialGrid: widget.debugShowMaterialGrid,
        highContrastDarkTheme: widget.highContrastDarkTheme,
        highContrastTheme: widget.highContrastTheme,
        locale: value.settings.locale ?? widget.locale,
        localizationsDelegates: widget.localizationsDelegates,
        localeListResolutionCallback: widget.localeListResolutionCallback,
        localeResolutionCallback: widget.localeResolutionCallback,
        onGenerateTitle: widget.onGenerateTitle,
        onNavigationNotification: widget.onNavigationNotification,
        restorationScopeId: widget.restorationScopeId,
        routerConfig: widget.routerConfig,
        routerDelegate: widget.routerDelegate,
        routeInformationParser: widget.routeInformationParser,
        routeInformationProvider: widget.routeInformationProvider,
        scaffoldMessengerKey: widget.scaffoldMessengerKey,
        scrollBehavior: widget.scrollBehavior,
        shortcuts: widget.shortcuts,
        showPerformanceOverlay: widget.showPerformanceOverlay,
        showSemanticsDebugger: widget.showSemanticsDebugger,
        supportedLocales: widget.supportedLocales,
        theme: widget.theme,
        themeAnimationCurve: widget.themeAnimationCurve,
        themeAnimationDuration: widget.themeAnimationDuration,
        themeMode: value.settings.theme,
        title: widget.title,
      );
    }
    return MaterialApp(
      actions: widget.actions,
      builder: widget.builder,
      checkerboardOffscreenLayers: widget.checkerboardOffscreenLayers,
      checkerboardRasterCacheImages: widget.checkerboardRasterCacheImages,
      color: widget.color,
      darkTheme: widget.darkTheme,
      debugShowCheckedModeBanner: widget.debugShowCheckedModeBanner,
      debugShowMaterialGrid: widget.debugShowMaterialGrid,
      home: widget.home,
      highContrastDarkTheme: widget.highContrastDarkTheme,
      highContrastTheme: widget.highContrastTheme,
      initialRoute: widget.initialRoute,
      locale: value.settings.locale ?? widget.locale,
      localizationsDelegates: widget.localizationsDelegates,
      localeListResolutionCallback: widget.localeListResolutionCallback,
      localeResolutionCallback: widget.localeResolutionCallback,
      navigatorKey: widget.navigatorKey,
      navigatorObservers: widget.navigatorObservers ?? [],
      onGenerateInitialRoutes: widget.onGenerateInitialRoutes,
      onGenerateRoute: widget.onGenerateRoute,
      onGenerateTitle: widget.onGenerateTitle,
      onNavigationNotification: widget.onNavigationNotification,
      onUnknownRoute: widget.onUnknownRoute,
      restorationScopeId: widget.restorationScopeId,
      routes: widget.routes ?? {},
      scaffoldMessengerKey: widget.scaffoldMessengerKey,
      scrollBehavior: widget.scrollBehavior,
      shortcuts: widget.shortcuts,
      showPerformanceOverlay: widget.showPerformanceOverlay,
      showSemanticsDebugger: widget.showSemanticsDebugger,
      supportedLocales: widget.supportedLocales,
      theme: widget.theme,
      themeAnimationCurve: widget.themeAnimationCurve,
      themeAnimationDuration: widget.themeAnimationDuration,
      themeMode: value.settings.theme,
      title: widget.title,
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget child = AndrossyProvider(
      androssy: widget.androssy,
      configure: widget.configure,
      localizer: widget.localizer,
      child: AndrossyBuilder(
        builder: _appBuilder,
      ),
    );

    if (widget.userNetworkStatus) {
      child = NetworkProvider(child: child);
    }

    return child;
  }
}
