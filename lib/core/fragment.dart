import 'dart:developer' as developer;

import 'package:flutter/material.dart';

import 'androssy.dart';
import 'builder.dart';
import 'controller.dart';
import 'instance.dart';
import 'settings.dart';
import 'user.dart';

abstract class AndrossyFragment<T extends AndrossyController>
    extends StatefulWidget {
  final String? identifier;
  final bool showLifecycleLog;

  const AndrossyFragment({
    super.key,
    this.identifier,
    this.showLifecycleLog = false,
  });

  AndrossyInstance<T> get instance => AndrossyInstance.init<T>(identifier);

  BuildContext get context => instance.context;

  T get controller => instance.controller;

  Androssy get androssy => instance.androssy;

  AndrossyUser get user => instance.user;

  AndrossySettings get settings => instance.androssy.settings;

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

  void _log(String value) {
    if (widget.showLifecycleLog) developer.log(value);
  }

  @override
  void initState() {
    _log("initState (FRAGMENT)");
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
    _log("didChangeDependencies (FRAGMENT)");
    controller.setNotifier(setState);
    widget.instance.attach(context, controller);
    super.didChangeDependencies();
  }

  @override
  void reassemble() {
    _log("reassemble (FRAGMENT)");
    controller.setNotifier(setState);
    widget.instance.attach(context, controller);
    super.reassemble();
  }

  @override
  void didUpdateWidget(covariant AndrossyFragment<T> oldWidget) {
    _log("didUpdateWidget (FRAGMENT)");
    controller.setNotifier(setState);
    widget.instance.attach(context, controller);
    widget.onRestart(context);
    super.didUpdateWidget(oldWidget);
  }

  @override
  void activate() {
    _log("activate (FRAGMENT)");
    controller.setNotifier(setState);
    widget.instance.attach(context, controller);
    widget.onStart(context);
    super.activate();
  }

  @override
  void deactivate() {
    _log("deactivate (FRAGMENT)");
    super.deactivate();
    widget.onStop(context);
  }

  @override
  void dispose() {
    _log("dispose (FRAGMENT)");
    WidgetsBinding.instance.removeObserver(this);
    widget.onDestroy(context);
    widget.instance.close(widget.identifier);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    _log("didChangeAppLifecycleState => $state (FRAGMENT)");
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
    _log("build (FRAGMENT)");
    return AndrossyBuilder(
      builder: (context, value) {
        widget.instance.androssy = value;
        return widget.onCreate(context);
      },
    );
  }
}
