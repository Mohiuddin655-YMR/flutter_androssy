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
    super.clipBehavior,
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
      /// BASE PROPERTIES
      key: widget.key,
      controller: widget.controller,

      /// BORDER PROPERTIES
      borderColor: widget.borderColor,
      borderColorState: widget.borderColorState,
      borderSize: widget.borderSize,
      borderSizeState: widget.borderSizeState,
      borderHorizontal: widget.borderHorizontal,
      borderHorizontalState: widget.borderHorizontalState,
      borderVertical: widget.borderVertical,
      borderVerticalState: widget.borderVerticalState,
      borderTop: widget.borderTop,
      borderTopState: widget.borderTopState,
      borderBottom: widget.borderBottom,
      borderBottomState: widget.borderBottomState,
      borderStart: widget.borderStart,
      borderStartState: widget.borderStartState,
      borderEnd: widget.borderEnd,
      borderEndState: widget.borderEndState,

      /// BORDER RADIUS PROPERTIES
      borderRadius: widget.borderRadius,
      borderRadiusState: widget.borderRadiusState,
      borderRadiusBL: widget.borderRadiusBL,
      borderRadiusBLState: widget.borderRadiusBLState,
      borderRadiusBR: widget.borderRadiusBR,
      borderRadiusBRState: widget.borderRadiusBRState,
      borderRadiusTL: widget.borderRadiusTL,
      borderRadiusTLState: widget.borderRadiusTLState,
      borderRadiusTR: widget.borderRadiusTR,
      borderRadiusTRState: widget.borderRadiusTRState,

      ///
      ///
      ///
      gravity: widget.gravity,
      background: widget.background,
      backgroundGradient: widget.backgroundGradient,
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
      textFontFamily: widget.textFontFamily,
      textFontStyle: widget.textFontStyle,
      textFontWeight: widget.textFontWeight,
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
