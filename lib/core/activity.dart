import 'dart:developer' as developer;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'androssy.dart';
import 'builder.dart';
import 'controller.dart';
import 'instance.dart';
import 'settings.dart';
import 'user.dart';

class ScaffoldProperties {
  final Color? backgroundColor;
  final double? drawerEdgeDragWidth;
  final bool drawerEnableOpenDragGesture;
  final DragStartBehavior drawerDragStartBehavior;
  final Color? drawerScrimColor;
  final bool endDrawerEnableOpenDragGesture;
  final bool extendBody;
  final bool extendBodyBehindAppBar;
  final FloatingActionButtonAnimator? floatingActionButtonAnimator;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final bool primary;
  final AlignmentDirectional persistentFooterAlignment;
  final String? restorationId;
  final bool? resizeToAvoidBottomInset;

  const ScaffoldProperties({
    this.backgroundColor,
    this.drawerEdgeDragWidth,
    this.drawerEnableOpenDragGesture = true,
    this.drawerDragStartBehavior = DragStartBehavior.start,
    this.drawerScrimColor,
    this.endDrawerEnableOpenDragGesture = true,
    this.extendBody = false,
    this.extendBodyBehindAppBar = false,
    this.floatingActionButtonAnimator,
    this.floatingActionButtonLocation,
    this.primary = true,
    this.persistentFooterAlignment = AlignmentDirectional.centerEnd,
    this.restorationId,
    this.resizeToAvoidBottomInset,
  });

  factory ScaffoldProperties.fromContext(
    BuildContext context, {
    bool transparencyAppBar = false,
    bool transparencyNavigationBar = false,
  }) {
    final t = Theme.of(context);
    return ScaffoldProperties(
      backgroundColor: t.scaffoldBackgroundColor,
      drawerScrimColor: t.drawerTheme.scrimColor,
      extendBodyBehindAppBar: transparencyAppBar,
      extendBody: transparencyNavigationBar,
    );
  }

  ScaffoldProperties modify({
    Color? backgroundColor,
    double? drawerEdgeDragWidth,
    bool? drawerEnableOpenDragGesture,
    DragStartBehavior? drawerDragStartBehavior,
    Color? drawerScrimColor,
    bool? endDrawerEnableOpenDragGesture,
    bool? extendBody,
    bool? extendBodyBehindAppBar,
    FloatingActionButtonAnimator? floatingActionButtonAnimator,
    FloatingActionButtonLocation? floatingActionButtonLocation,
    bool? primary,
    AlignmentDirectional? persistentFooterAlignment,
    String? restorationId,
    bool? resizeToAvoidBottomInset,
  }) {
    return ScaffoldProperties(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      drawerEdgeDragWidth: drawerEdgeDragWidth ?? this.drawerEdgeDragWidth,
      drawerEnableOpenDragGesture:
          drawerEnableOpenDragGesture ?? this.drawerEnableOpenDragGesture,
      drawerDragStartBehavior:
          drawerDragStartBehavior ?? this.drawerDragStartBehavior,
      drawerScrimColor: drawerScrimColor ?? this.drawerScrimColor,
      endDrawerEnableOpenDragGesture:
          endDrawerEnableOpenDragGesture ?? this.endDrawerEnableOpenDragGesture,
      extendBody: extendBody ?? this.extendBody,
      extendBodyBehindAppBar:
          extendBodyBehindAppBar ?? this.extendBodyBehindAppBar,
      floatingActionButtonAnimator:
          floatingActionButtonAnimator ?? this.floatingActionButtonAnimator,
      floatingActionButtonLocation:
          floatingActionButtonLocation ?? this.floatingActionButtonLocation,
      primary: primary ?? this.primary,
      persistentFooterAlignment:
          persistentFooterAlignment ?? this.persistentFooterAlignment,
      restorationId: restorationId ?? this.restorationId,
      resizeToAvoidBottomInset:
          resizeToAvoidBottomInset ?? this.resizeToAvoidBottomInset,
    );
  }
}

class AppbarProperties {
  final Key? appbarKey;
  final IconThemeData? actionsIconTheme;
  final bool automaticallyImplyLeading;
  final Color? backgroundColor;
  final double bottomOpacity;
  final Clip? clipBehavior;
  final double? elevation;
  final bool excludeHeaderSemantics;
  final Color? foregroundColor;
  final bool forceMaterialTransparency;
  final IconThemeData? iconTheme;
  final double? leadingWidth;
  final bool primary;
  final double? scrolledUnderElevation;
  final Color? shadowColor;
  final ShapeBorder? shape;
  final Color? surfaceTintColor;
  final String? title;
  final bool? titleCenter;
  final double? titleSpacing;
  final TextStyle? titleTextStyle;
  final double? toolbarHeight;
  final double toolbarOpacity;
  final TextStyle? toolbarTextStyle;

  const AppbarProperties({
    this.appbarKey,
    this.automaticallyImplyLeading = true,
    this.backgroundColor,
    this.bottomOpacity = 1,
    this.clipBehavior,
    this.elevation,
    this.excludeHeaderSemantics = false,
    this.foregroundColor,
    this.forceMaterialTransparency = false,
    this.leadingWidth,
    this.primary = true,
    this.scrolledUnderElevation,
    this.shadowColor,
    this.shape,
    this.surfaceTintColor,
    this.title,
    this.titleCenter,
    this.titleSpacing,
    this.titleTextStyle,
    this.toolbarHeight,
    this.toolbarOpacity = 1,
    this.toolbarTextStyle,
    this.actionsIconTheme,
    this.iconTheme,
  });

  factory AppbarProperties.fromContext(
    BuildContext context, {
    bool transparency = false,
  }) {
    final t = Theme.of(context).appBarTheme;
    return AppbarProperties(
      actionsIconTheme: t.actionsIconTheme ?? t.iconTheme,
      backgroundColor: transparency ? Colors.transparent : t.backgroundColor,
      elevation: t.elevation,
      foregroundColor: t.foregroundColor,
      iconTheme: t.iconTheme,
      scrolledUnderElevation: t.scrolledUnderElevation,
      shadowColor: t.shadowColor,
      shape: t.shape,
      surfaceTintColor: t.surfaceTintColor,
      titleCenter: t.centerTitle,
      titleSpacing: t.titleSpacing,
      titleTextStyle: t.titleTextStyle,
      toolbarHeight: t.toolbarHeight,
      toolbarTextStyle: t.toolbarTextStyle,
    );
  }

  AppbarProperties modify({
    Key? appbarKey,
    IconThemeData? actionsIconTheme,
    bool? automaticallyImplyLeading,
    Color? backgroundColor,
    double? bottomOpacity,
    Clip? clipBehavior,
    double? elevation,
    bool? excludeHeaderSemantics,
    Color? foregroundColor,
    bool? forceMaterialTransparency,
    IconThemeData? iconTheme,
    double? leadingWidth,
    bool? primary,
    double? scrolledUnderElevation,
    Color? shadowColor,
    ShapeBorder? shape,
    Color? surfaceTintColor,
    String? title,
    bool? titleCenter,
    double? titleSpacing,
    TextStyle? titleTextStyle,
    double? toolbarHeight,
    double? toolbarOpacity,
    TextStyle? toolbarTextStyle,
  }) {
    return AppbarProperties(
      appbarKey: appbarKey ?? this.appbarKey,
      actionsIconTheme: actionsIconTheme ?? this.actionsIconTheme,
      automaticallyImplyLeading:
          automaticallyImplyLeading ?? this.automaticallyImplyLeading,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      bottomOpacity: bottomOpacity ?? this.bottomOpacity,
      clipBehavior: clipBehavior ?? this.clipBehavior,
      elevation: elevation ?? this.elevation,
      excludeHeaderSemantics:
          excludeHeaderSemantics ?? this.excludeHeaderSemantics,
      foregroundColor: foregroundColor ?? this.foregroundColor,
      forceMaterialTransparency:
          forceMaterialTransparency ?? this.forceMaterialTransparency,
      iconTheme: iconTheme ?? this.iconTheme,
      leadingWidth: leadingWidth ?? this.leadingWidth,
      primary: primary ?? this.primary,
      scrolledUnderElevation:
          scrolledUnderElevation ?? this.scrolledUnderElevation,
      shadowColor: shadowColor ?? this.shadowColor,
      shape: shape ?? this.shape,
      surfaceTintColor: surfaceTintColor ?? this.surfaceTintColor,
      title: title ?? this.title,
      titleCenter: titleCenter ?? this.titleCenter,
      titleSpacing: titleSpacing ?? this.titleSpacing,
      titleTextStyle: titleTextStyle ?? this.titleTextStyle,
      toolbarHeight: toolbarHeight ?? this.toolbarHeight,
      toolbarOpacity: toolbarOpacity ?? this.toolbarOpacity,
      toolbarTextStyle: toolbarTextStyle ?? this.toolbarTextStyle,
    );
  }
}

class StatusBarProperties {
  final bool? transparency;
  final bool? contrastEnforced;
  final Color? color;
  final Brightness? brightness;
  final Brightness? iconBrightness;

  const StatusBarProperties({
    this.transparency,
    this.contrastEnforced,
    this.color,
    this.brightness,
    Brightness? iconBrightness,
  }) : iconBrightness = iconBrightness ?? brightness;

  factory StatusBarProperties.light({
    Color color = Colors.transparent,
    bool? contrastEnforced,
    Brightness brightness = Brightness.light,
    Brightness? iconBrightness,
    bool? transparency,
  }) {
    return StatusBarProperties(
      color: color,
      contrastEnforced: contrastEnforced,
      brightness: brightness,
      iconBrightness: iconBrightness ?? brightness,
      transparency: transparency,
    );
  }

  factory StatusBarProperties.dark({
    Color color = Colors.transparent,
    bool? contrastEnforced,
    Brightness brightness = Brightness.dark,
    Brightness? iconBrightness,
    bool? transparency,
  }) {
    return StatusBarProperties(
      color: color,
      contrastEnforced: contrastEnforced,
      brightness: brightness,
      iconBrightness: iconBrightness ?? brightness,
      transparency: transparency,
    );
  }

  factory StatusBarProperties.fromContext(
    BuildContext context, {
    bool transparency = false,
  }) {
    final t = Theme.of(context).appBarTheme.systemOverlayStyle;
    return StatusBarProperties(
      brightness: t?.statusBarBrightness,
      color: transparency ? Colors.transparent : t?.statusBarColor,
      contrastEnforced: t?.systemStatusBarContrastEnforced,
      iconBrightness: t?.statusBarIconBrightness,
    );
  }

  StatusBarProperties modify({
    bool? contrastEnforced,
    Color? color,
    Brightness? brightness,
    Brightness? iconBrightness,
    bool? transparency,
  }) {
    return StatusBarProperties(
      contrastEnforced: contrastEnforced ?? this.contrastEnforced,
      color: color ?? this.color,
      brightness: brightness ?? this.brightness,
      iconBrightness: iconBrightness ?? this.iconBrightness,
      transparency: transparency ?? this.transparency,
    );
  }
}

class NavigationBarProperties {
  final Brightness? brightness;
  final Color? color;
  final bool? contrastEnforced;
  final Color? dividerColor;
  final bool? transparency;

  const NavigationBarProperties({
    this.contrastEnforced,
    this.color,
    Color? dividerColor,
    this.brightness,
    this.transparency,
  }) : dividerColor = dividerColor ?? color;

  factory NavigationBarProperties.light({
    Brightness brightness = Brightness.light,
    Color color = Colors.transparent,
    bool? contrastEnforced,
    Color? dividerColor,
    bool? transparency,
  }) {
    return NavigationBarProperties(
      color: color,
      contrastEnforced: contrastEnforced,
      brightness: brightness,
      dividerColor: dividerColor,
      transparency: transparency,
    );
  }

  factory NavigationBarProperties.dark({
    Brightness brightness = Brightness.dark,
    Color color = Colors.black,
    bool? contrastEnforced,
    Color? dividerColor,
    bool? transparency,
  }) {
    return NavigationBarProperties(
      color: color,
      contrastEnforced: contrastEnforced,
      brightness: brightness,
      dividerColor: dividerColor,
      transparency: transparency,
    );
  }

  factory NavigationBarProperties.fromContext(
    BuildContext context, {
    bool transparency = false,
  }) {
    final t = Theme.of(context).appBarTheme.systemOverlayStyle;
    return NavigationBarProperties(
      brightness: t?.systemNavigationBarIconBrightness,
      color: transparency ? Colors.transparent : t?.systemNavigationBarColor,
      contrastEnforced: t?.systemNavigationBarContrastEnforced,
      dividerColor: t?.systemNavigationBarDividerColor,
    );
  }

  NavigationBarProperties modify({
    bool? contrastEnforced,
    Color? color,
    Color? dividerColor,
    Brightness? brightness,
    bool? transparency,
  }) {
    return NavigationBarProperties(
      contrastEnforced: contrastEnforced ?? this.contrastEnforced,
      color: color ?? this.color,
      dividerColor: dividerColor ?? this.dividerColor,
      brightness: brightness ?? this.brightness,
      transparency: transparency ?? this.transparency,
    );
  }
}

abstract class AndrossyActivity<T extends AndrossyController>
    extends StatefulWidget {
  final String? identifier;
  final bool showLifecycleLog;
  final bool statusBar;
  final bool transparentAppBar;
  final bool transparentNavigationBar;

  const AndrossyActivity({
    super.key,
    this.identifier,
    this.showLifecycleLog = false,
    this.statusBar = true,
    this.transparentAppBar = false,
    this.transparentNavigationBar = false,
  });

  AndrossyInstance<T> get instance => AndrossyInstance.init<T>(identifier);

  BuildContext get context => instance.context;

  T get controller => instance.controller;

  Androssy get androssy => instance.androssy;

  AndrossyUser get user => instance.user;

  AndrossySettings get settings => instance.androssy.settings;

  T init(BuildContext context);

  @mustCallSuper
  @protected
  ScaffoldProperties properties(BuildContext context) {
    return ScaffoldProperties.fromContext(
      context,
      transparencyAppBar: transparentAppBar,
      transparencyNavigationBar: transparentNavigationBar,
    );
  }

  @mustCallSuper
  @protected
  AppbarProperties appbarProperties(BuildContext context) {
    return AppbarProperties.fromContext(
      context,
      transparency: transparentAppBar,
    );
  }

  @mustCallSuper
  @protected
  StatusBarProperties statusBarProperties(BuildContext context) {
    return StatusBarProperties.fromContext(
      context,
      transparency: transparentAppBar,
    );
  }

  @mustCallSuper
  @protected
  NavigationBarProperties navigationBarProperties(BuildContext context) {
    return NavigationBarProperties.fromContext(
      context,
      transparency: transparentNavigationBar,
    );
  }

  @protected
  @override
  State<AndrossyActivity<T>> createState() => AndrossyActivityState<T>();

  @protected
  Widget build(BuildContext context, Widget child) => child;

  @protected
  Widget onCreate(BuildContext context);

  @protected
  AppBar? onCreateAppbar(BuildContext context) {
    final t = Theme.of(context).appBarTheme;
    final s = appbarProperties(context);
    final it = s.iconTheme ?? t.iconTheme;
    final ait = s.actionsIconTheme ?? t.actionsIconTheme;

    final mSC = statusBarProperties(context);
    final mNC = navigationBarProperties(context);

    final mTitle = onCreateTitle(context, s);
    final mActions = onCreateActions(context);
    final mBottom = onCreateToolbarBottom(context);
    final mFlexibleSpace = onCreateToolbarFlexibleSpace(context);
    final mLeading = onCreateLeading(context);
    final mTH = mTitle == null ? 0.0 : s.toolbarHeight ?? t.toolbarHeight;

    return AppBar(
      key: s.appbarKey,
      actions: mActions,
      actionsIconTheme: ait ?? it,
      automaticallyImplyLeading: s.automaticallyImplyLeading,
      backgroundColor: s.backgroundColor ?? t.backgroundColor,
      bottom: mBottom,
      bottomOpacity: s.bottomOpacity,
      centerTitle: s.titleCenter ?? t.centerTitle,
      clipBehavior: s.clipBehavior,
      elevation: s.elevation ?? t.elevation,
      excludeHeaderSemantics: s.excludeHeaderSemantics,
      flexibleSpace: mFlexibleSpace,
      foregroundColor: s.foregroundColor ?? t.foregroundColor,
      forceMaterialTransparency: s.forceMaterialTransparency,
      iconTheme: it,
      leading: mLeading,
      leadingWidth: s.leadingWidth,
      notificationPredicate: onCreateNotificationPredicate,
      primary: s.primary,
      scrolledUnderElevation:
          s.scrolledUnderElevation ?? t.scrolledUnderElevation,
      shadowColor: s.shadowColor ?? t.shadowColor,
      shape: s.shape ?? t.shape,
      surfaceTintColor: s.surfaceTintColor ?? t.surfaceTintColor,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: mSC.color,
        statusBarBrightness: mSC.brightness,
        statusBarIconBrightness: mSC.iconBrightness,
        systemStatusBarContrastEnforced: mSC.contrastEnforced,
        systemNavigationBarColor: mNC.color,
        systemNavigationBarDividerColor: mNC.dividerColor,
        systemNavigationBarIconBrightness: mNC.brightness,
        systemNavigationBarContrastEnforced: mNC.contrastEnforced,
      ),
      title: mTitle,
      titleSpacing: s.titleSpacing ?? t.titleSpacing,
      titleTextStyle: s.titleTextStyle ?? t.titleTextStyle,
      toolbarHeight: mTH,
      toolbarOpacity: s.toolbarOpacity,
      toolbarTextStyle: s.toolbarTextStyle ?? t.toolbarTextStyle,
    );
  }

  @protected
  Widget? onCreateTitle(BuildContext context, AppbarProperties properties) {
    final title = properties.title;
    if (title != null && title.isNotEmpty) {
      return Text(
        title,
        style: properties.titleTextStyle,
      );
    }
    return null;
  }

  @protected
  bool onCreateNotificationPredicate(ScrollNotification notification) {
    return defaultScrollNotificationPredicate(notification);
  }

  @protected
  Widget? onCreateLeading(BuildContext context) => null;

  @protected
  List<Widget>? onCreateActions(BuildContext context) => null;

  @protected
  PreferredSizeWidget? onCreateToolbarBottom(BuildContext context) => null;

  Widget? onCreateToolbarFlexibleSpace(BuildContext context) => null;

  @protected
  Widget? onCreateBottomSheet(BuildContext context) => null;

  @protected
  Widget? onCreateBottomNavigationBar(BuildContext context) => null;

  @protected
  Widget? onCreateDrawer(BuildContext context) => null;

  @protected
  Widget? onCreateEndDrawer(BuildContext context) => null;

  @protected
  Widget? onCreateFloatingButton(BuildContext context) => null;

  @protected
  List<Widget>? onCreatePersistentFooterButtons(BuildContext context) => null;

  @protected
  void onDrawerChanged(bool isOpened) => controller.onNotify();

  @protected
  void onEndDrawerChanged(bool isOpened) => controller.onNotify();

  @protected
  @mustCallSuper
  void onInit(BuildContext context) => controller.onInit(context);

  @protected
  @mustCallSuper
  void onReady(BuildContext context) => controller.onReady(context);

  @protected
  @mustCallSuper
  void onListener(BuildContext context) => controller.onListener(context);

  @protected
  @mustCallSuper
  void onPaused(BuildContext context) => controller.onPaused(context);

  @protected
  @mustCallSuper
  void onRestart(BuildContext context) => controller.onRestart(context);

  @protected
  @mustCallSuper
  void onResumed(BuildContext context) => controller.onResumed(context);

  @protected
  @mustCallSuper
  void onStart(BuildContext context) => controller.onStart(context);

  @protected
  @mustCallSuper
  void onStop(BuildContext context) => controller.onStop(context);

  @protected
  @mustCallSuper
  void onDetached(BuildContext context) => controller.onDetached(context);

  @protected
  @mustCallSuper
  void onHidden(BuildContext context) => controller.onHidden(context);

  @protected
  @mustCallSuper
  void onDestroy(BuildContext context) => controller.onDestroy(context);
}

class AndrossyActivityState<T extends AndrossyController>
    extends State<AndrossyActivity<T>> with WidgetsBindingObserver {
  late T controller = widget.init(context);

  void _log(String value) {
    if (widget.showLifecycleLog) developer.log(value);
  }

  @override
  void initState() {
    _log("initState (ACTIVITY)");
    controller.setNotifier(setState);
    widget.instance.attach(context, controller);
    widget.onInit(context);
    widget.onListener(context);
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.instance.attach(context, controller);
      widget.onReady(context);
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _log("didChangeDependencies (ACTIVITY)");
    controller.setNotifier(setState);
    widget.instance.attach(context, controller);
    super.didChangeDependencies();
  }

  @override
  void reassemble() {
    _log("reassemble (ACTIVITY)");
    controller.setNotifier(setState);
    widget.instance.attach(context, controller);
    super.reassemble();
  }

  @override
  void didUpdateWidget(covariant AndrossyActivity<T> oldWidget) {
    _log("didUpdateWidget (ACTIVITY)");
    controller.setNotifier(setState);
    widget.instance.attach(context, controller);
    widget.onRestart(context);
    super.didUpdateWidget(oldWidget);
  }

  @override
  void activate() {
    _log("activate (ACTIVITY)");
    controller.setNotifier(setState);
    widget.instance.attach(context, controller);
    widget.onStart(context);
    super.activate();
  }

  @override
  void deactivate() {
    _log("deactivate (ACTIVITY)");
    super.deactivate();
    widget.onStop(context);
  }

  @override
  void dispose() {
    _log("dispose (ACTIVITY)");
    WidgetsBinding.instance.removeObserver(this);
    widget.onDestroy(context);
    widget.instance.close(widget.identifier);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    _log("didChangeAppLifecycleState (ACTIVITY)");
    switch (state) {
      case AppLifecycleState.inactive:
        widget.onStart(context);
        break;
      case AppLifecycleState.detached:
        widget.onDetached(context);
        break;
      case AppLifecycleState.hidden:
        widget.onHidden(context);
        break;
      case AppLifecycleState.paused:
        widget.onPaused(context);
        break;
      case AppLifecycleState.resumed:
        widget.onResumed(context);
        break;
      default:
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    _log("build (ACTIVITY)");
    var theme = Theme.of(context);
    var s = widget.properties(context);
    return AndrossyBuilder(
      builder: (context, value) {
        widget.instance.androssy = value;
        return widget.build(
          context,
          Scaffold(
            appBar: widget.onCreateAppbar(context),
            backgroundColor: s.backgroundColor ?? theme.scaffoldBackgroundColor,
            body: widget.onCreate(context),
            bottomNavigationBar: widget.onCreateBottomNavigationBar(context),
            bottomSheet: widget.onCreateBottomSheet(context),
            drawer: widget.onCreateDrawer(context),
            drawerEdgeDragWidth: s.drawerEdgeDragWidth,
            drawerEnableOpenDragGesture: s.drawerEnableOpenDragGesture,
            drawerDragStartBehavior: s.drawerDragStartBehavior,
            drawerScrimColor:
                s.drawerScrimColor ?? theme.drawerTheme.scrimColor,
            endDrawer: widget.onCreateEndDrawer(context),
            endDrawerEnableOpenDragGesture: s.endDrawerEnableOpenDragGesture,
            extendBody: s.extendBody,
            extendBodyBehindAppBar: s.extendBodyBehindAppBar,
            floatingActionButton: widget.onCreateFloatingButton(context),
            floatingActionButtonAnimator: s.floatingActionButtonAnimator,
            floatingActionButtonLocation: s.floatingActionButtonLocation,
            key: widget.key,
            primary: s.primary,
            persistentFooterAlignment: s.persistentFooterAlignment,
            persistentFooterButtons:
                widget.onCreatePersistentFooterButtons(context),
            restorationId: s.restorationId,
            resizeToAvoidBottomInset: s.resizeToAvoidBottomInset,
            onDrawerChanged: widget.onDrawerChanged,
            onEndDrawerChanged: widget.onEndDrawerChanged,
          ),
        );
      },
    );
  }
}
