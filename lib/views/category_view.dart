part of '../widgets.dart';

class CategoryView extends YMRView<CategoryViewController> {
  final String? categoryText;
  final String? buttonText;

  final OnViewClickListener? onButtonClick;

  const CategoryView({
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
    super.absorbMode,
    super.activated,
    super.animation,
    super.animationType,
    super.background,
    super.backgroundState,
    super.backgroundBlendMode,
    super.backgroundGradient,
    super.backgroundGradientState,
    super.backgroundImage,
    super.backgroundImageState,
    super.child,
    super.clipBehavior,
    super.dimensionRatio,
    super.elevation,
    super.enabled,
    super.expandable,
    super.foreground,
    super.foregroundBlendMode,
    super.foregroundGradient,
    super.foregroundImage,
    super.flex,
    super.gravity,
    super.height,
    super.heightMax,
    super.heightMin,
    super.hoverColor,
    super.margin,
    super.marginHorizontal,
    super.marginVertical,
    super.marginTop,
    super.marginBottom,
    super.marginStart,
    super.marginEnd,
    super.orientation,
    super.padding,
    super.paddingHorizontal,
    super.paddingVertical,
    super.paddingTop,
    super.paddingBottom,
    super.paddingStart,
    super.paddingEnd,
    super.position,
    super.positionType,
    super.pressedColor,
    super.rippleColor,
    super.scrollable,
    super.scrollController,
    super.scrollingType,
    super.shadow,
    super.shadowBlurRadius,
    super.shadowBlurStyle,
    super.shadowColor,
    super.shadowType,
    super.shadowSpreadRadius,
    super.shadowHorizontal,
    super.shadowVertical,
    super.shadowStart,
    super.shadowEnd,
    super.shadowTop,
    super.shadowBottom,
    super.shape,
    super.transform,
    super.transformGravity,
    super.width,
    super.widthMax,
    super.widthMin,
    super.visibility,
    super.onClick,
    super.onDoubleClick,
    super.onLongClick,
    super.onToggle,
    super.onChange,
    super.onError,
    super.onValid,
    super.onValidator,
    this.buttonText,
    this.categoryText,
    this.onButtonClick,
  });

  @override
  CategoryViewController initController() => CategoryViewController();

  @override
  CategoryViewController attachController(
    CategoryViewController controller,
  ) {
    return controller.fromCategoryTextView(this);
  }

  @override
  Widget? attach(BuildContext context, CategoryViewController controller) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextView(
              flex: 1,
              text: controller.categoryText,
              textColor: Colors.black,
              textSize: 16,
              textFontWeight: FontWeight.w600,
            ),
            if (controller.isButtonVisible)
              TextView(
                paddingHorizontal: 12,
                paddingVertical: 8,
                borderRadius: 8,
                text: controller.buttonText,
                textSize: 16,
                textFontWeight: FontWeight.w600,
                onClick: controller.onButtonClick,
              ),
          ],
        ),
        if (child != null) child!,
      ],
    );
  }
}

class CategoryViewController extends ViewController {
  bool hideButton = false;
  String? categoryText;
  String buttonText = "";
  OnViewClickListener? onButtonClick;

  CategoryViewController fromCategoryTextView(CategoryView view) {
    super.fromView(view);
    buttonText = view.buttonText ?? "";
    categoryText = view.categoryText;
    onButtonClick = view.onButtonClick;
    return this;
  }

  bool get isButtonVisible => !hideButton && buttonText.isNotEmpty;
}
