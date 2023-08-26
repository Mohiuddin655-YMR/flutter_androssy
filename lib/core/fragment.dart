part of 'core.dart';

abstract class AndrossyFragment extends StatefulWidget {
  final AndrossyInstance instance;

  const AndrossyFragment({
    super.key,
    required this.instance,
  });

  String translate(String name) => instance.translate(name);

  @protected
  @override
  State<AndrossyFragment> createState() => _AndrossyFragmentState();

  @protected
  Widget onCreate(BuildContext context, AndrossyInstance instance);

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
  Future<bool> onBackPressed() async => true;

  @protected
  void onDetached() {}

  @protected
  void onDestroy() {}
}

class _AndrossyFragmentState extends State<AndrossyFragment>
    with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: widget.onBackPressed,
      child: AndrossyBuilder(
          message: _providerError,
          builder: (context, value) {
            widget.instance.androssy = value;
            return widget.onCreate(context, widget.instance);
          }),
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
  void didUpdateWidget(covariant AndrossyFragment oldWidget) {
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
