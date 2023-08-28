part of '../widgets.dart';

class TitledView extends YMRView<DescriptionViewController> {
  /// TITLE CONTENTS
  final String? title;
  final Color? titleColor;
  final double? titleSize;
  final String? titleFontFamily;
  final FontWeight? titleFontWeight;
  final double titleSpaceFromDescription;
  final double? titleSpacingExtra;

  /// BODY CONTENTS
  final String? subtitle;
  final Color? subtitleColor;
  final double? subtitleSize;
  final String? subtitleFontFamily;
  final FontWeight? subtitleFontWeight;
  final double? subtitleSpacingExtra;

  const TitledView({
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
    super.activated,
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
    super.enabled,
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
    super.padding,
    super.paddingHorizontal,
    super.paddingVertical,
    super.paddingTop,
    super.paddingBottom,
    super.paddingStart,
    super.paddingEnd,
    super.position,
    super.positionType,
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

    /// TITLE CONTENTS
    this.title,
    this.titleColor,
    this.titleSize,
    this.titleFontFamily,
    this.titleFontWeight,
    this.titleSpaceFromDescription = 0,
    this.titleSpacingExtra,

    /// BODY CONTENTS
    this.subtitle,
    this.subtitleColor,
    this.subtitleSize,
    this.subtitleFontFamily,
    this.subtitleFontWeight,
    this.subtitleSpacingExtra,
  });

  @override
  DescriptionViewController initController() => DescriptionViewController();

  @override
  DescriptionViewController attachController(
    DescriptionViewController controller,
  ) {
    return controller.fromDescriptionView(this);
  }

  @override
  Widget? attach(BuildContext context, DescriptionViewController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TextView(
          visibility: (title ?? "").isNotEmpty,
          text: title,
          textColor: titleColor,
          textSize: titleSize,
          textFontFamily: titleFontFamily,
          textFontWeight: titleFontWeight,
          lineSpacingExtra: titleSpacingExtra,
          marginBottom: titleSpaceFromDescription,
        ),
        TextView(
          visibility: (subtitle ?? "").isNotEmpty,
          text: subtitle,
          textColor: subtitleColor,
          textSize: subtitleSize,
          textFontFamily: subtitleFontFamily,
          textFontWeight: subtitleFontWeight,
          lineSpacingExtra: subtitleSpacingExtra,
        ),
        if (child != null) child!,
      ],
    );
  }
}

class DescriptionViewController extends ViewController {
  /// TITLE CONTENTS
  String? title;
  Color? titleColor;
  double? titleSize;
  String? titleFontFamily;
  FontWeight? titleFontWeight;

  /// BODY CONTENTS
  String? subtitle;
  Color? subtitleColor;
  double? subtitleSize;
  String? subtitleFontFamily;
  FontWeight? subtitleFontWeight;

  DescriptionViewController fromDescriptionView(TitledView view) {
    super.fromView(view);

    /// TITLE CONTENTS
    title = view.title;
    titleColor = view.titleColor;
    titleSize = view.titleSize;
    titleFontFamily = view.titleFontFamily;
    titleFontWeight = view.titleFontWeight;

    /// BODY CONTENTS
    subtitle = view.subtitle;
    subtitleColor = view.subtitleColor;
    subtitleSize = view.subtitleSize;
    subtitleFontFamily = view.subtitleFontFamily;
    subtitleFontWeight = view.subtitleFontWeight;
    return this;
  }
}
