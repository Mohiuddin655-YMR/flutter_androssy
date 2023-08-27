part of '../core.dart';

abstract class AndrossyActivity<T extends AndrossyController>
    extends StatefulWidget {
  final bool statusBar;
  final Androssy? androssy;
  final SharedPreferences? preferences;

  const AndrossyActivity({
    super.key,
    this.androssy,
    this.preferences,
    this.statusBar = true,
  });

  AndrossyInstance get instance => AndrossyInstance.i;

  T get controller => instance.controller as T;

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
  void onListener(BuildContext context) {}

  @protected
  void onPause(BuildContext context) {}

  @protected
  void onRestart(BuildContext context) {}

  @protected
  void onResume(BuildContext context) {}

  @protected
  void onStart(BuildContext context) {}

  @protected
  void onStop(BuildContext context) {}

  @protected
  Future<bool> onBackPressed() async {
    return true;
  }

  @protected
  void onDetached(BuildContext context) {}

  @protected
  void onDestroy(BuildContext context) {}
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
      preferences: widget.preferences,
      androssy: widget.androssy,
      controller: controller,
    );
    widget.onListener(context);
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
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return WillPopScope(
      onWillPop: widget.onBackPressed,
      child: AndrossyBuilder(
        message: _providerError,
        builder: (context, value) {
          var config = widget.config(context);
          widget.instance.androssy = value;
          return Scaffold(
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
            endDrawerEnableOpenDragGesture:
                config.endDrawerEnableOpenDragGesture,
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
          );
        },
      ),
    );
  }
}

class AndrossyController {
  OnViewNotifier? _notifier;

  void setNotifier(OnViewNotifier? notifier) => _notifier = notifier;

  void onNotify(VoidCallback callback) {
    if (_notifier != null) {
      _notifier?.call(callback);
    }
  }
}
