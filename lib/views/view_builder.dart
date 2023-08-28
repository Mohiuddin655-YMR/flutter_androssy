part of '../widgets.dart';

class ViewBuilder extends YMRView<ViewBuilderController> {
  final int currentIndex;
  final OnViewIndexBuilder builder;

  const ViewBuilder({
    /// BASE PROPERTIES
    super.key,
    super.controller,

    /// BORDER PROPERTIES
    super.borderColor,
    super.borderColorState,
    super.borderSize,
    super.borderSizeState,
    super.borderHorizontal,
    super.borderHorizontalState,
    super.borderVertical,
    super.borderVerticalState,
    super.borderTop,
    super.borderTopState,
    super.borderBottom,
    super.borderBottomState,
    super.borderStart,
    super.borderStartState,
    super.borderEnd,
    super.borderEndState,

    /// BORDER RADIUS PROPERTIES
    super.borderRadius,
    super.borderRadiusState,
    super.borderRadiusBL,
    super.borderRadiusBLState,
    super.borderRadiusBR,
    super.borderRadiusBRState,
    super.borderRadiusTL,
    super.borderRadiusTLState,
    super.borderRadiusTR,
    super.borderRadiusTRState,

    ///
    ///
    ///
    ///
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
