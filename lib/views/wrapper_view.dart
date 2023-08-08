part of '../widgets.dart';

class WrapperView extends YMRView<WrapperViewController> {
  @override
  Widget get child => super.child ?? const SizedBox();

  const WrapperView({
    super.key,
    bool wrapper = true,
    required Widget child,
  }) : super(child: child, wrapper: wrapper);

  @override
  WrapperViewController initController() => WrapperViewController();

  @override
  WrapperViewController attachController(WrapperViewController controller) {
    return controller.fromWrapperView(this);
  }

  @override
  Widget root(
    BuildContext context,
    WrapperViewController controller,
    Widget parent,
  ) {
    return controller.wrapper ? parent : child;
  }

  @override
  Widget? attach(BuildContext context, WrapperViewController controller) {
    return WidgetWrapper(
      wrapper: controller.onNotify,
      child: child,
    );
  }
}

class WrapperViewController extends ViewController {
  WrapperViewController fromWrapperView(WrapperView view) {
    super.fromView(view);
    return this;
  }

  @override
  void onNotify([Size? size]) {
    super.onNotifyWithCallback(() {
      width = size?.width ?? width;
      height = size?.height ?? height;
    });
  }
}
