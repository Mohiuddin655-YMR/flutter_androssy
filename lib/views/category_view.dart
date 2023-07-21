part of '../widgets.dart';

class CategoryView extends YMRView<CategoryViewController> {
  final String? categoryText;
  final String? buttonText;

  final OnViewClickListener? onButtonClick;

  const CategoryView({
    super.key,
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
    super.border,
    super.borderHorizontal,
    super.borderVertical,
    super.borderTop,
    super.borderBottom,
    super.borderStart,
    super.borderEnd,
    super.borderColor,
    super.borderGradient,
    super.borderRadius,
    super.borderRadiusBL,
    super.borderRadiusBR,
    super.borderRadiusTL,
    super.borderRadiusTR,
    super.child,
    super.clipBehavior,
    super.controller,
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
    super.ripple,
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
                ripple: 10,
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
