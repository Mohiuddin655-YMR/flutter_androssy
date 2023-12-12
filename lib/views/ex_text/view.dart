import 'package:flutter/material.dart';

import '../text/view.dart';

part 'controller.dart';

class ExTextView<T extends ExTextViewController> extends TextView<T> {
  final String? expendedText;
  final double? expendedCharacterSpace;
  final Color? expendedTextColor;
  final double? expendedTextSize;
  final FontStyle? expendedTextStyle;
  final bool expendedTextVisible;
  final FontWeight? expendedTextWeight;

  const ExTextView({
    /// ROOT PROPERTIES
    super.key,
    super.controller,

    ///BASE PROPERTIES
    super.absorbMode,
    super.activated,
    super.background,
    super.backgroundState,
    super.backgroundBlendMode,
    super.backgroundGradient,
    super.backgroundGradientState,
    super.backgroundImage,
    super.backgroundImageState,
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
    super.heightState,
    super.heightMax,
    super.heightMin,
    super.hoverColor,
    super.orientation,
    super.position,
    super.positionType,
    super.pressedColor,
    super.rippleColor,
    super.scrollable,
    super.scrollController,
    super.scrollingType,
    super.shape,
    super.transform,
    super.transformGravity,
    super.width,
    super.widthState,
    super.widthMax,
    super.widthMin,
    super.visibility,

    /// ANIMATION PROPERTIES
    super.animation,
    super.animationType,

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
    super.borderStrokeAlign,

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

    /// MARGIN PROPERTIES
    super.margin,
    super.marginHorizontal,
    super.marginVertical,
    super.marginTop,
    super.marginBottom,
    super.marginStart,
    super.marginEnd,

    /// PADDING PROPERTIES
    super.padding,
    super.paddingHorizontal,
    super.paddingVertical,
    super.paddingTop,
    super.paddingBottom,
    super.paddingStart,
    super.paddingEnd,

    /// SHADOW PROPERTIES
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

    /// LISTENER PROPERTIES
    super.onDoubleClick,
    super.onLongClick,
    super.onHover,

    /// SUPER TEXT PROPERTIES
    super.maxCharacters,
    super.maxLines,
    super.letterSpacing,
    super.lineSpacingExtra,
    super.wordSpacing,
    super.suffixText = " ...more ",
    super.suffixTextVisible,
    super.suffixTextLetterSpace,
    super.suffixTextColor,
    super.suffixTextSize,
    super.suffixFontStyle,
    super.suffixFontWeight = FontWeight.bold,
    super.textFontFamily,
    super.textFontStyle,
    super.textFontWeight,
    super.text,
    super.textAlign,
    super.textColor,
    super.textDecoration,
    super.textDecorationColor,
    super.textDecorationStyle,
    super.textDecorationThickness,
    super.textDirection,
    super.textLeadingDistribution,
    super.textOverflow,
    super.textSize,
    super.textSpans,
    super.textStyle,

    /// CHILD PROPERTIES
    this.expendedText = " ...less ",
    this.expendedCharacterSpace,
    this.expendedTextColor,
    this.expendedTextSize,
    this.expendedTextStyle,
    this.expendedTextVisible = true,
    this.expendedTextWeight,
  });

  @override
  T initController() => ExTextViewController() as T;

  @override
  T attachController(T controller) => controller.fromExTextView(this) as T;

  @override
  void onReady(BuildContext context, T controller) {
    super.onReady(context, controller);
    return controller._config();
  }
}
