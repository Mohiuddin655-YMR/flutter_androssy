part of '../widgets.dart';

abstract class Fragment extends StatefulWidget {
  final Color? background;
  final DragStartBehavior drawerDragStartBehavior;
  final double? drawerEdgeDragWidth;
  final bool drawerEnableOpenDragGesture;
  final Color? drawerScrimColor;
  final DrawerType drawerType;
  final FloatingActionButtonAnimator? floatingActionButtonAnimator;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final AlignmentDirectional persistentFooterAlignment;
  final bool primary;
  final bool? resizeToAvoidBottomInset;
  final String? restorationId;

  const Fragment({
    super.key,
    this.background,
    this.drawerDragStartBehavior = DragStartBehavior.start,
    this.drawerEdgeDragWidth,
    this.drawerEnableOpenDragGesture = true,
    this.drawerScrimColor,
    this.drawerType = DrawerType.start,
    this.floatingActionButtonAnimator,
    this.floatingActionButtonLocation,
    this.persistentFooterAlignment = AlignmentDirectional.centerEnd,
    this.primary = true,
    this.resizeToAvoidBottomInset,
    this.restorationId,
  });

  @protected
  @override
  State<StatefulWidget> createState() {
    return _FragmentState();
  }

  @protected
  Widget onCreate(BuildContext context);

  @protected
  AppBar? onCreateAppbar(BuildContext context) {
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

  Widget? onCreateDrawer(BuildContext context) {
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
  void onInit() {}

  @protected
  void onListener() {}

  @protected
  void onPause() {}

  @protected
  void onRestart() {}

  @protected
  void onResume() {}

  @protected
  void onStart() {}

  @protected
  void onStop() {}

  @protected
  void onDetached() {}

  @protected
  void onDestroy() {}
}

class _FragmentState extends State<Fragment> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    var drawerType = widget.drawerType;
    return Scaffold(
      key: widget.key,
      backgroundColor: widget.background ?? Colors.white,
      body: widget.onCreate(context),
      bottomSheet: widget.onCreateBottomSheet(context),
      bottomNavigationBar: widget.onCreateBottomNavigationBar(context),
      drawer: drawerType.isStart ? widget.onCreateDrawer(context) : null,
      drawerDragStartBehavior: widget.drawerDragStartBehavior,
      drawerEdgeDragWidth: widget.drawerEdgeDragWidth,
      drawerEnableOpenDragGesture: widget.drawerEnableOpenDragGesture,
      drawerScrimColor: widget.drawerScrimColor,
      endDrawer: drawerType.isEnd ? widget.onCreateDrawer(context) : null,
      endDrawerEnableOpenDragGesture: widget.drawerEnableOpenDragGesture,
      floatingActionButton: widget.onCreateFloatingButton(context),
      floatingActionButtonAnimator: widget.floatingActionButtonAnimator,
      floatingActionButtonLocation: widget.floatingActionButtonLocation,
      onDrawerChanged: widget.onDrawerChanged,
      onEndDrawerChanged: widget.onDrawerChanged,
      persistentFooterAlignment: widget.persistentFooterAlignment,
      persistentFooterButtons: widget.onCreatePersistentFooterButtons(context),
      primary: widget.primary,
      resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
      restorationId: widget.restorationId,
    );
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    widget.onInit();
    widget.onListener();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant Fragment oldWidget) {
    widget.onRestart();
    super.didUpdateWidget(oldWidget);
  }

  @override
  void activate() {
    widget.onStart();
    super.activate();
  }

  @override
  void deactivate() {
    widget.onStop();
    super.deactivate();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    widget.onDestroy();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        widget.onResume();
        break;
      case AppLifecycleState.inactive:
        widget.onStop();
        break;
      case AppLifecycleState.paused:
        widget.onPause();
        break;
      case AppLifecycleState.detached:
        widget.onDetached();
        break;
    }
    super.didChangeAppLifecycleState(state);
  }
}
