part of '../widgets.dart';

class ViewBuilder extends YMRView<ViewBuilderController> {
  final int currentIndex;
  final OnViewIndexBuilder builder;

  const ViewBuilder({
    super.key,
    super.controller,
    super.flex,
    super.scrollable,
    this.currentIndex = 0,
    required this.builder,
  });

  @override
  ViewBuilderController initController() => ViewBuilderController();

  @override
  ViewBuilderController attachController(ViewBuilderController controller) {
    return controller.fromViewBuilder(this);
  }

  @override
  Widget? attach(BuildContext context, ViewBuilderController controller) {
    return builder(context, controller.currentIndex);
  }
}

class ViewBuilderController extends ViewController {
  int currentIndex = 0;

  void setCurrentIndex(int index) {
    onNotifyWithCallback(() => currentIndex = index);
  }

  ViewBuilderController fromViewBuilder(ViewBuilder view) {
    super.fromView(view);
    currentIndex = view.currentIndex;
    return this;
  }
}
