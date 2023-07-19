part of '../widgets.dart';

class ExpendableTextView extends TextView {
  final String? expendedText;
  final double? expendedCharacterSpace;
  final Color? expendedTextColor;
  final double? expendedTextSize;
  final FontStyle? expendedTextStyle;
  final bool expendedTextVisible;
  final FontWeight? expendedTextWeight;

  const ExpendableTextView({
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
    super.clipBehavior,
    super.controller,
    super.dimensionRatio,
    super.elevation,
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
    super.pressedColor,
    super.ripple,
    super.rippleColor,
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
    super.fontFamily,
    super.fontStyle,
    super.fontWeight,
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
    this.expendedCharacterSpace,
    this.expendedText = " ...less ",
    this.expendedTextColor,
    this.expendedTextSize,
    this.expendedTextStyle,
    this.expendedTextWeight,
    this.expendedTextVisible = true,
  });

  @override
  State<ExpendableTextView> createState() => _ExpendableTextViewState();
}

class _ExpendableTextViewState extends State<ExpendableTextView> {
  bool expended = false;

  @override
  Widget build(BuildContext context) {
    return TextView(
      controller: widget.controller,
      gravity: widget.gravity,
      background: widget.background,
      backgroundGradient: widget.backgroundGradient,
      borderColor: widget.borderColor,
      borderRadius: widget.borderRadius,
      borderRadiusTL: widget.borderRadiusTL,
      borderRadiusTR: widget.borderRadiusTR,
      borderRadiusBL: widget.borderRadiusBL,
      borderRadiusBR: widget.borderRadiusBR,
      border: widget.border,
      textDecoration: widget.textDecoration,
      textDecorationColor: widget.textDecorationColor,
      textDecorationStyle: widget.textDecorationStyle,
      textDecorationThickness: widget.textDecorationThickness,
      suffixTextVisible:
          widget.expendedText != null && widget.expendedTextVisible,
      suffixTextLetterSpace: expended
          ? widget.expendedCharacterSpace ?? widget.suffixTextLetterSpace
          : widget.suffixTextLetterSpace,
      suffixText: expended ? widget.expendedText : widget.suffixText,
      suffixTextColor: (expended
              ? widget.expendedTextColor ?? widget.suffixTextColor
              : widget.suffixTextColor) ??
          widget.textColor?.withOpacity(1 / 3),
      suffixTextSize: expended
          ? widget.expendedTextSize ?? widget.suffixTextSize
          : widget.suffixTextSize,
      suffixFontStyle: expended
          ? widget.expendedTextStyle ?? widget.suffixFontStyle
          : widget.suffixFontStyle,
      suffixFontWeight: expended
          ? widget.expendedTextWeight ?? widget.suffixFontWeight
          : widget.suffixFontWeight,
      enabled: widget.enabled,
      flex: widget.flex,
      fontFamily: widget.fontFamily,
      fontStyle: widget.fontStyle,
      fontWeight: widget.fontWeight,
      height: widget.height,
      textLeadingDistribution: widget.textLeadingDistribution,
      letterSpacing: widget.letterSpacing,
      lineSpacingExtra: widget.lineSpacingExtra,
      maxCharacters: expended ? 0 : widget.maxCharacters,
      maxLines: null,
      margin: widget.margin,
      marginStart: widget.marginStart,
      marginEnd: widget.marginEnd,
      marginTop: widget.marginTop,
      marginBottom: widget.marginBottom,
      marginHorizontal: widget.marginHorizontal,
      marginVertical: widget.marginVertical,
      padding: widget.padding,
      paddingStart: widget.paddingStart,
      paddingEnd: widget.paddingEnd,
      paddingTop: widget.paddingTop,
      paddingBottom: widget.paddingBottom,
      paddingHorizontal: widget.paddingHorizontal,
      paddingVertical: widget.paddingVertical,
      text: widget.text,
      textAlign: widget.textAlign,
      textColor: widget.textColor,
      textDirection: widget.textDirection,
      textSize: widget.textSize,
      textSpans: widget.textSpans,
      textStyle: widget.textStyle,
      textOverflow: null,
      visibility: widget.visibility,
      width: widget.width,
      wordSpacing: widget.wordSpacing,
      onClick: (c) {
        setState(() {
          expended = !expended;
        });
      },
    );
  }
}

class ExpendableTextViewController extends TextViewController {}
