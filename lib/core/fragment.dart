import 'package:flutter/material.dart';

import 'builder.dart';
import 'controller.dart';
import 'instance.dart';

abstract class AndrossyFragment<T extends AndrossyController>
    extends StatefulWidget {
  final bool globalInstance;
  final String? identifier;

  const AndrossyFragment({
    super.key,
    this.globalInstance = false,
    this.identifier,
  });

  AndrossyInstance<T> get instance {
    return AndrossyInstance.init<T>(
      globalInstance,
      identifier,
    );
  }

  BuildContext get context => instance.context;

  T get controller => instance.controller;

  T init(BuildContext context);

  @protected
  @override
  State<AndrossyFragment<T>> createState() => _AndrossyFragmentState<T>();

  @protected
  Widget onCreate(BuildContext context);

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

class _AndrossyFragmentState<T extends AndrossyController>
    extends State<AndrossyFragment<T>> with WidgetsBindingObserver {
  late T controller = widget.init(context);

  @override
  void initState() {
    controller.setNotifier(setState);
    widget.instance.create(context, controller);
    widget.onInit(context);
    widget.onListener(context);
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.instance.create(context, controller);
      widget.onReady(context);
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    controller.setNotifier(setState);
    widget.instance.create(context, controller);
    super.didChangeDependencies();
  }

  @override
  void reassemble() {
    controller.setNotifier(setState);
    widget.instance.create(context, controller);
    super.reassemble();
  }

  @override
  void didUpdateWidget(covariant AndrossyFragment<T> oldWidget) {
    controller.setNotifier(setState);
    widget.instance.create(context, controller);
    widget.onRestart(context);
    super.didUpdateWidget(oldWidget);
  }

  @override
  void activate() {
    controller.setNotifier(setState);
    widget.instance.create(context, controller);
    widget.onStart(context);
    super.activate();
  }

  @override
  void deactivate() {
    widget.onStop(context);
    widget.instance.close(widget.identifier);
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
    return AndrossyBuilder(
      builder: (context, value) {
        widget.instance.androssy = value;
        return widget.onCreate(context);
      },
    );
  }
}
