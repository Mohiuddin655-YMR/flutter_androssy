part of '../core.dart';

abstract class AndrossyActivity<T extends AndrossyController>
    extends StatefulWidget {
  final bool statusBar;
  final Androssy? androssy;

  const AndrossyActivity({
    super.key,
    this.androssy,
    this.statusBar = true,
  });

  AndrossyInstance get instance => AndrossyInstance.i;

  T get controller => instance.getController() ?? init(instance.context);

  T init(BuildContext context);

  String translate(String name) => instance.translate(name);

  @protected
  AndrossyScreenConfig config(BuildContext context) =>
      const AndrossyScreenConfig();

  @protected
  AndrossyAppbarConfig appbarConfig(BuildContext context) =>
      const AndrossyAppbarConfig();

  StatusBarConfig statusBarConfig(
    BuildContext context,
    StatusBarConfig config,
  ) {
    return config;
  }

  NavigationBarConfig navigationBarConfig(
    BuildContext context,
    NavigationBarConfig config,
  ) {
    return config;
  }

  @protected
  @override
  State<AndrossyActivity<T>> createState() => AndrossyActivityState<T>();

  @protected
  Widget build(
    BuildContext context,
    AndrossyInstance instance,
    Widget child,
  ) {
    return child;
  }

  @protected
  Widget onCreate(BuildContext context, AndrossyInstance instance);

  @protected
  AppBar? onCreateAppbar(BuildContext context) {
    var t = Theme.of(context).appBarTheme;
    var s = appbarConfig(context);
    var it = s.iconTheme ?? t.iconTheme;
    var ait = s.actionsIconTheme ?? t.actionsIconTheme;
    var sos = s.systemOverlayStyle ?? t.systemOverlayStyle;
    var mSC = statusBarConfig(
      context,
      StatusBarConfig(
        contrastEnforced: sos?.systemStatusBarContrastEnforced,
        color: sos?.statusBarColor,
        brightness: sos?.statusBarBrightness,
        iconBrightness: sos?.statusBarIconBrightness,
      ),
    );
    var mNC = navigationBarConfig(
      context,
      NavigationBarConfig(
        contrastEnforced: sos?.systemNavigationBarContrastEnforced,
        color: sos?.systemNavigationBarColor,
        dividerColor: sos?.systemNavigationBarDividerColor,
        brightness: sos?.systemNavigationBarIconBrightness,
      ),
    );
    return AppBar(
      key: s.appbarKey,
      actions: onCreateActions(context),
      actionsIconTheme: ait ?? it,
      automaticallyImplyLeading: s.automaticallyImplyLeading,
      backgroundColor: mSC.color ?? s.backgroundColor ?? t.backgroundColor,
      bottom: onCreateToolbarBottom(context),
      bottomOpacity: s.bottomOpacity,
      centerTitle: s.titleCenter ?? t.centerTitle,
      clipBehavior: s.clipBehavior,
      elevation: s.elevation ?? t.elevation,
      excludeHeaderSemantics: s.excludeHeaderSemantics,
      flexibleSpace: onCreateToolbarFlexibleSpace(context),
      foregroundColor: s.foregroundColor ?? t.foregroundColor,
      forceMaterialTransparency: s.forceMaterialTransparency,
      iconTheme: it,
      leading: onCreateLeading(context),
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
      title: onCreateTitle(context),
      titleSpacing: s.titleSpacing ?? t.titleSpacing,
      titleTextStyle: s.titleTextStyle ?? t.titleTextStyle,
      toolbarHeight: s.toolbarHeight ?? t.toolbarHeight,
      toolbarOpacity: s.toolbarOpacity,
      toolbarTextStyle: s.toolbarTextStyle ?? t.toolbarTextStyle,
    );
  }

  @protected
  Widget? onCreateTitle(BuildContext context) {
    return null;
  }

  @protected
  bool onCreateNotificationPredicate(ScrollNotification notification) {
    return defaultScrollNotificationPredicate(notification);
  }

  @protected
  Widget? onCreateLeading(BuildContext context) {
    return null;
  }

  @protected
  List<Widget>? onCreateActions(BuildContext context) {
    return null;
  }

  @protected
  PreferredSizeWidget? onCreateToolbarBottom(BuildContext context) {
    return null;
  }

  Widget? onCreateToolbarFlexibleSpace(BuildContext context) {
    return null;
  }

  @protected
  Widget? onCreateBottomSheet(BuildContext context) {
    return null;
  }

  @protected
  Widget? onCreateBottomNavigationBar(BuildContext context) {
    return null;
  }

  @protected
  Widget? onCreateDrawer(BuildContext context) {
    return null;
  }

  @protected
  Widget? onCreateEndDrawer(BuildContext context) {
    return null;
  }

  @protected
  Widget? onCreateFloatingButton(BuildContext context) {
    return null;
  }

  @protected
  List<Widget>? onCreatePersistentFooterButtons(BuildContext context) {
    return null;
  }

  @protected
  void onDrawerChanged(bool changed) {}

  @protected
  void onEndDrawerChanged(bool isOpened) {}

  @protected
  @mustCallSuper
  void onListener(BuildContext context) => controller.onListener(context);

  @protected
  @mustCallSuper
  void onPause(BuildContext context) => controller.onPause(context);

  @protected
  @mustCallSuper
  void onRestart(BuildContext context) => controller.onRestart(context);

  @protected
  @mustCallSuper
  void onResume(BuildContext context) => controller.onResume(context);

  @protected
  @mustCallSuper
  void onStart(BuildContext context) => controller.onStart(context);

  @protected
  @mustCallSuper
  void onStop(BuildContext context) => controller.onStop(context);

  @protected
  @mustCallSuper
  Future<bool> onBackPressed() => controller.onBackPressed();

  @protected
  @mustCallSuper
  void onDetached(BuildContext context) => controller.onDetached(context);

  @protected
  @mustCallSuper
  void onDestroy(BuildContext context) => controller.onDestroy(context);
}

class AndrossyActivityState<T extends AndrossyController>
    extends State<AndrossyActivity<T>> with WidgetsBindingObserver {
  late T controller;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    controller = widget.init(context);
    controller.setNotifier(setState);
    widget.instance.init(
      context: context,
      androssy: widget.androssy,
      controller: controller,
    );
    widget.onListener(context);
    widget.controller.onInit(context);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant AndrossyActivity<T> oldWidget) {
    widget.onRestart(context);
    super.didUpdateWidget(oldWidget);
  }

  @override
  void activate() {
    widget.onStart(context);
    super.activate();
  }

  @override
  void deactivate() {
    widget.onStop(context);
    super.deactivate();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    widget.onDestroy(context);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        widget.onResume(context);
        break;
      case AppLifecycleState.inactive:
        widget.onStop(context);
        break;
      case AppLifecycleState.paused:
        widget.onPause(context);
        break;
      case AppLifecycleState.detached:
        widget.onDetached(context);
        break;
      default:
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var config = widget.config(context);
    return WillPopScope(
      onWillPop: widget.onBackPressed,
      child: widget.build(
        context,
        widget.instance,
        Scaffold(
          appBar: widget.onCreateAppbar(context),
          backgroundColor:
              config.backgroundColor ?? theme.scaffoldBackgroundColor,
          body: widget.onCreate(context, widget.instance),
          bottomNavigationBar: widget.onCreateBottomNavigationBar(context),
          bottomSheet: widget.onCreateBottomSheet(context),
          drawer: widget.onCreateDrawer(context),
          drawerEdgeDragWidth: config.drawerEdgeDragWidth,
          drawerEnableOpenDragGesture: config.drawerEnableOpenDragGesture,
          drawerDragStartBehavior: config.drawerDragStartBehavior,
          drawerScrimColor:
              config.drawerScrimColor ?? theme.drawerTheme.scrimColor,
          endDrawer: widget.onCreateEndDrawer(context),
          endDrawerEnableOpenDragGesture: config.endDrawerEnableOpenDragGesture,
          extendBody: config.extendBody,
          extendBodyBehindAppBar: config.extendBodyBehindAppBar,
          floatingActionButton: widget.onCreateFloatingButton(context),
          floatingActionButtonAnimator: config.floatingActionButtonAnimator,
          floatingActionButtonLocation: config.floatingActionButtonLocation,
          key: widget.key,
          primary: config.primary,
          persistentFooterAlignment: config.persistentFooterAlignment,
          persistentFooterButtons:
              widget.onCreatePersistentFooterButtons(context),
          restorationId: config.restorationId,
          resizeToAvoidBottomInset: config.resizeToAvoidBottomInset,
          onDrawerChanged: widget.onDrawerChanged,
          onEndDrawerChanged: widget.onEndDrawerChanged,
        ),
      ),
    );
  }
}

class NavigationBarConfig {
  final bool? contrastEnforced;
  final Color? color;
  final Color? dividerColor;
  final Brightness? brightness;

  const NavigationBarConfig({
    this.contrastEnforced,
    this.color,
    Color? dividerColor,
    this.brightness,
  }) : dividerColor = dividerColor ?? color;

  factory NavigationBarConfig.light([Color color = Colors.transparent]) {
    return NavigationBarConfig(
      color: color,
      brightness: Brightness.dark,
    );
  }

  factory NavigationBarConfig.dark([Color color = Colors.black]) {
    return NavigationBarConfig(
      color: color,
      brightness: Brightness.light,
    );
  }

  NavigationBarConfig copyWith({
    bool? contrastEnforced,
    Color? color,
    Color? dividerColor,
    Brightness? brightness,
  }) {
    return NavigationBarConfig(
      contrastEnforced: contrastEnforced ?? this.contrastEnforced,
      color: color ?? this.color,
      dividerColor: dividerColor ?? this.dividerColor,
      brightness: brightness ?? this.brightness,
    );
  }
}

class AndrossyScreenConfig {
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

  const AndrossyScreenConfig({
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

  AndrossyScreenConfig copyWith({
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
    return AndrossyScreenConfig(
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

class AndrossyAppbarConfig {
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
  final SystemUiOverlayStyle? systemOverlayStyle;
  final bool? titleCenter;
  final double? titleSpacing;
  final TextStyle? titleTextStyle;
  final double? toolbarHeight;
  final double toolbarOpacity;
  final TextStyle? toolbarTextStyle;

  const AndrossyAppbarConfig({
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
    this.titleCenter,
    this.titleSpacing,
    this.titleTextStyle,
    this.toolbarHeight,
    this.toolbarOpacity = 1,
    this.toolbarTextStyle,
    this.actionsIconTheme,
    this.iconTheme,
    this.systemOverlayStyle,
  });

  AndrossyAppbarConfig copyWith({
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
    SystemUiOverlayStyle? systemOverlayStyle,
    bool? titleCenter,
    double? titleSpacing,
    TextStyle? titleTextStyle,
    double? toolbarHeight,
    double? toolbarOpacity,
    TextStyle? toolbarTextStyle,
  }) {
    return AndrossyAppbarConfig(
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
      systemOverlayStyle: systemOverlayStyle ?? this.systemOverlayStyle,
      titleCenter: titleCenter ?? this.titleCenter,
      titleSpacing: titleSpacing ?? this.titleSpacing,
      titleTextStyle: titleTextStyle ?? this.titleTextStyle,
      toolbarHeight: toolbarHeight ?? this.toolbarHeight,
      toolbarOpacity: toolbarOpacity ?? this.toolbarOpacity,
      toolbarTextStyle: toolbarTextStyle ?? this.toolbarTextStyle,
    );
  }
}

class StatusBarConfig {
  final bool? contrastEnforced;
  final Color? color;
  final Brightness? brightness;
  final Brightness? iconBrightness;

  const StatusBarConfig({
    this.contrastEnforced,
    this.color,
    this.brightness,
    Brightness? iconBrightness,
  }) : iconBrightness = iconBrightness ?? brightness;

  factory StatusBarConfig.light([Color color = Colors.transparent]) {
    return StatusBarConfig(
      color: color,
      brightness: Brightness.dark,
    );
  }

  factory StatusBarConfig.dark([Color color = Colors.transparent]) {
    return StatusBarConfig(
      color: color,
      brightness: Brightness.light,
    );
  }

  StatusBarConfig copyWith({
    bool? contrastEnforced,
    Color? color,
    Brightness? brightness,
    Brightness? iconBrightness,
  }) {
    return StatusBarConfig(
      contrastEnforced: contrastEnforced ?? this.contrastEnforced,
      color: color ?? this.color,
      brightness: brightness ?? this.brightness,
      iconBrightness: iconBrightness ?? this.iconBrightness,
    );
  }
}
