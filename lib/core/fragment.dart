part of '../core.dart';

abstract class AndrossyFragment<T extends AndrossyController>
    extends StatefulWidget {

  const AndrossyFragment({
    super.key,
  });

  AndrossyInstance get instance => AndrossyInstance.i;

  T get controller => instance.getController() ?? init(instance.context);

  T init(BuildContext context);

  String translate(String name) => instance.translate(name);

  @protected
  @override
  State<AndrossyFragment<T>> createState() => _AndrossyFragmentState<T>();

  @protected
  Widget onCreate(BuildContext context, T controller);

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

class _AndrossyFragmentState<T extends AndrossyController>
    extends State<AndrossyFragment<T>> with WidgetsBindingObserver {
  late T controller;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    controller = widget.init(context);
    controller.setNotifier(setState);
    widget.instance.modify(
      context: context,
      controller: controller,
    );
    widget.onListener(context);
    widget.controller.onInit(context);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant AndrossyFragment<T> oldWidget) {
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
    return WillPopScope(
      onWillPop: widget.onBackPressed,
      child: widget.onCreate(context, controller),
    );
  }
}
