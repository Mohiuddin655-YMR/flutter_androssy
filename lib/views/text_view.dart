part of '../widgets.dart';

class TextView<T extends TextViewController> extends YMRView<T> {
  final int? maxCharacters;
  final int? maxLines;

  final double? letterSpacing;
  final double? lineSpacingExtra;
  final double? wordSpacing;

  final String? extraText;
  final TextDecoration? extraTextDecoration;
  final Color? extraTextDecorationColor;
  final TextDecorationStyle? extraTextDecorationStyle;
  final double? extraTextDecorationThickness;
  final Color? extraTextColor;
  final double? extraTextLetterSpace;
  final double? extraTextSize;
  final FontStyle? extraTextStyle;
  final bool? extraTextVisible;
  final FontWeight? extraTextWeight;

  final String? fontFamily;
  final FontStyle? fontStyle;
  final FontWeight? fontWeight;

  final String? text;
  final ValueState<String>? textState;
  final TextAlign? textAlign;
  final bool? textAllCaps;
  final Color? textColor;
  final ValueState<Color>? textColorState;
  final TextDecoration? textDecoration;
  final Color? textDecorationColor;
  final TextDecorationStyle? textDecorationStyle;
  final double? textDecorationThickness;
  final TextDirection? textDirection;
  final TextLeadingDistribution? textLeadingDistribution;
  final TextOverflow? textOverflow;
  final double? textSize;
  final List<TextSpan>? textSpans;
  final TextStyle? textStyle;

  const TextView({
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
    super.scrollable,
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
    this.maxCharacters,
    this.maxLines,
    this.letterSpacing,
    this.lineSpacingExtra,
    this.wordSpacing,
    this.extraText,
    this.extraTextColor,
    this.extraTextDecoration,
    this.extraTextDecorationColor,
    this.extraTextDecorationStyle,
    this.extraTextDecorationThickness,
    this.extraTextLetterSpace,
    this.extraTextSize,
    this.extraTextStyle,
    this.extraTextVisible,
    this.extraTextWeight,
    this.fontFamily,
    this.fontStyle,
    this.fontWeight,
    required this.text,
    this.textState,
    this.textAlign,
    this.textAllCaps,
    this.textColor,
    this.textColorState,
    this.textDecoration,
    this.textDecorationColor,
    this.textDecorationStyle,
    this.textDecorationThickness,
    this.textDirection,
    this.textLeadingDistribution,
    this.textOverflow,
    this.textSize,
    this.textSpans,
    this.textStyle,
  });

  @override
  T initController() {
    return TextViewController() as T;
  }

  @override
  ViewRoots initRootProperties() {
    return const ViewRoots(
      scrollable: false,
    );
  }

  @override
  T attachController(T controller) {
    return controller.fromTextView(this) as T;
  }

  @override
  Widget? attach(BuildContext context, T controller) {
    return RawTextView(
      extraText: controller.extraText,
      extraTextColor: controller.extraTextColor,
      extraTextDecoration: controller.extraTextDecoration,
      extraTextDecorationColor: controller.extraTextDecorationColor,
      extraTextDecorationStyle: controller.extraTextDecorationStyle,
      extraTextDecorationThickness: controller.extraTextDecorationThickness,
      extraTextLetterSpace: controller.extraTextLetterSpace,
      extraTextSize: controller.extraTextSize,
      extraTextStyle: controller.extraTextStyle,
      extraTextVisible: controller.extraTextVisible,
      extraTextWeight: controller.extraTextWeight,
      text: controller.text,
      textSpans: controller.textSpans,
      maxLines: controller.maxLines,
      textOverflow: controller.textOverflow,
      textStyle: controller.textStyle,
      textColor: controller.textColor,
      textSize: controller.textSize,
      fontWeight: controller.fontWeight,
      textDecoration: controller.textDecoration,
      textDecorationColor: controller.textDecorationColor,
      textDecorationStyle: controller.textDecorationStyle,
      textDecorationThickness: controller.textDecorationThickness,
      fontFamily: controller.fontFamily,
      fontStyle: controller.fontStyle,
      textLeadingDistribution: controller.textLeadingDistribution,
      lineHeight: controller.spacingFactor,
      letterSpacing: controller.letterSpacing,
      wordSpacing: controller.wordSpacing,
      textAlign: controller.textAlign,
      textDirection: controller.textDirection,
    );
  }
}

class RawTextView extends StatelessWidget {
  final String? extraText;
  final Color? extraTextColor;
  final TextDecoration? extraTextDecoration;
  final Color? extraTextDecorationColor;
  final TextDecorationStyle? extraTextDecorationStyle;
  final double? extraTextDecorationThickness;
  final double? extraTextLetterSpace;
  final double? extraTextSize;
  final FontStyle? extraTextStyle;
  final bool? extraTextVisible;
  final FontWeight? extraTextWeight;

  final int? maxCharacters;
  final int? maxLines;

  final double? letterSpacing;
  final double? lineHeight;
  final double? wordSpacing;

  final String? fontFamily;
  final FontStyle? fontStyle;
  final FontWeight? fontWeight;

  final String? text;
  final TextAlign? textAlign;
  final Color? textColor;
  final TextDecoration? textDecoration;
  final Color? textDecorationColor;
  final TextDecorationStyle? textDecorationStyle;
  final double? textDecorationThickness;
  final TextDirection? textDirection;
  final TextLeadingDistribution? textLeadingDistribution;
  final TextOverflow? textOverflow;
  final double textSize;
  final List<TextSpan>? textSpans;
  final TextStyle textStyle;

  const RawTextView({
    super.key,
    this.extraText,
    this.extraTextColor,
    this.extraTextDecoration,
    this.extraTextDecorationColor,
    this.extraTextDecorationStyle,
    this.extraTextDecorationThickness,
    this.extraTextLetterSpace,
    this.extraTextSize,
    this.extraTextStyle,
    this.extraTextVisible,
    this.extraTextWeight,
    this.maxCharacters,
    this.maxLines,
    this.letterSpacing,
    this.lineHeight,
    this.wordSpacing,
    this.fontFamily,
    this.fontStyle,
    this.fontWeight,
    required this.text,
    this.textAlign,
    this.textColor,
    this.textDecoration,
    this.textDecorationColor,
    this.textDecorationStyle,
    this.textDecorationThickness,
    this.textDirection,
    this.textLeadingDistribution,
    this.textOverflow,
    this.textSize = 14,
    this.textSpans,
    this.textStyle = const TextStyle(),
  });

  @override
  Widget build(BuildContext context) {
    final spans = textSpans ??
        [
          if ((extraText ?? "").isNotEmpty)
            TextSpan(
              text: extraText,
              style: TextStyle(
                color: extraTextColor,
                fontSize: extraTextSize,
                fontStyle: extraTextStyle,
                letterSpacing: extraTextLetterSpace,
                fontWeight: extraTextWeight,
                decoration: extraTextDecoration,
                decorationColor: extraTextDecorationColor,
                decorationStyle: extraTextDecorationStyle,
                decorationThickness: extraTextDecorationThickness,
              ),
            ),
        ];
    return spans.isNotEmpty
        ? Text.rich(
            TextSpan(
              text: text,
              children: spans,
            ),
            maxLines: maxLines,
            overflow: maxCharacters == 0 ? textOverflow : null,
            style: textStyle.copyWith(
              color: textColor,
              fontSize: textSize,
              fontWeight: fontWeight,
              decoration: textDecoration,
              decorationColor: textDecorationColor,
              decorationStyle: textDecorationStyle,
              decorationThickness: textDecorationThickness,
              fontFamily: fontFamily,
              fontStyle: fontStyle,
              height: lineHeight,
              leadingDistribution: textLeadingDistribution,
              letterSpacing: letterSpacing,
              wordSpacing: wordSpacing,
            ),
            textAlign: textAlign,
            textDirection: textDirection,
          )
        : Text(
            text ?? "",
            maxLines: maxLines,
            overflow: maxCharacters == 0 ? textOverflow : null,
            style: textStyle.copyWith(
              color: textColor,
              fontSize: textSize,
              fontWeight: fontWeight,
              decoration: textDecoration,
              decorationColor: textDecorationColor,
              decorationStyle: textDecorationStyle,
              decorationThickness: textDecorationThickness,
              fontFamily: fontFamily,
              fontStyle: fontStyle,
              height: lineHeight,
              leadingDistribution: textLeadingDistribution,
              letterSpacing: letterSpacing,
              wordSpacing: wordSpacing,
            ),
            textAlign: textAlign,
            textDirection: textDirection,
          );
  }
}

class TextViewController extends ViewController {
  int maxCharacters = 0;
  int? maxLines;

  double? letterSpacing;
  double lineSpacingExtra = 0;
  double? wordSpacing;

  String? extraText;
  TextDecoration? extraTextDecoration;
  Color? extraTextDecorationColor;
  TextDecorationStyle? extraTextDecorationStyle;
  double? extraTextDecorationThickness;
  Color? extraTextColor;
  double? extraTextLetterSpace;
  double? extraTextSize;
  FontStyle? extraTextStyle;
  bool extraTextVisible = true;
  FontWeight? extraTextWeight;

  String? fontFamily;
  FontStyle? fontStyle;
  FontWeight? fontWeight;

  String? _text;
  ValueState<String>? textState;
  TextAlign? textAlign;
  bool textAllCaps = false;
  Color? _textColor;
  ValueState<Color>? textColorState;
  TextDecoration? textDecoration;
  Color? textDecorationColor;
  TextDecorationStyle? textDecorationStyle;
  double? textDecorationThickness;
  TextDirection? textDirection;
  TextLeadingDistribution? textLeadingDistribution;
  TextOverflow? textOverflow;
  double textSize = 14;
  List<TextSpan>? textSpans;
  TextStyle textStyle = const TextStyle();

  TextViewController fromTextView(TextView view) {
    super.fromView(view);

    maxCharacters = view.maxCharacters ?? 0;
    maxLines = view.maxLines;

    letterSpacing = view.letterSpacing;
    lineSpacingExtra = view.lineSpacingExtra ?? 0;
    wordSpacing = view.wordSpacing;

    extraTextLetterSpace = view.extraTextLetterSpace;
    extraText = view.extraText;
    extraTextColor = view.extraTextColor;
    extraTextDecoration = view.extraTextDecoration;
    extraTextDecorationColor = view.extraTextDecorationColor;
    extraTextDecorationStyle = view.extraTextDecorationStyle;
    extraTextDecorationThickness = view.extraTextDecorationThickness;
    extraTextSize = view.extraTextSize;
    extraTextStyle = view.extraTextStyle;
    extraTextVisible = view.extraTextVisible ?? true;
    extraTextWeight = view.extraTextWeight;

    fontFamily = view.fontFamily;
    fontStyle = view.fontStyle;
    fontWeight = view.fontWeight;

    text = view.text;
    textState = view.textState;
    textAlign = view.textAlign;
    textAllCaps = view.textAllCaps ?? false;
    textColor = view.textColor;
    textColorState = view.textColorState;
    textDecoration = view.textDecoration;
    textDecorationColor = view.textDecorationColor;
    textDecorationStyle = view.textDecorationStyle;
    textDecorationThickness = view.textDecorationThickness;
    textDirection = view.textDirection;
    textLeadingDistribution = view.textLeadingDistribution;
    textOverflow = view.textOverflow;
    textSize = view.textSize ?? 14;
    textSpans = view.textSpans;
    textStyle = view.textStyle ?? const TextStyle();

    return this;
  }

  set text(String? value) => _text = value;

  String get text {
    final value = textState?.activated(activated, enabled) ?? _text ?? "";
    if (maxCharacters > 0) {
      return value.substring(
        0,
        value.length > maxCharacters ? maxCharacters : value.length,
      );
    }
    return textAllCaps ? value.toUpperCase() : value;
  }

  set textColor(Color? value) => _textColor = value;

  Color? get textColor {
    return textColorState?.activated(activated, enabled) ?? _textColor;
  }

  double? get spacingFactor {
    final x = textSize + lineSpacingExtra;
    final y = x * 0.068;
    return lineSpacingExtra > 0 ? y : null;
  }

  bool get isAutoExtraText {
    final a = maxCharacters > 0;
    final b = text.length > maxCharacters;
    return (a && b) || extraTextVisible;
  }

  void setEllipsizeLetterSpace(double? value) {
    extraTextLetterSpace = value;
    _notify;
  }

  void setEllipsizeText(String? value) {
    extraText = value;
    _notify;
  }

  void setEllipsizeTextColor(Color? value) {
    extraTextColor = value;
    _notify;
  }

  void setEllipsizeTextSize(double? value) {
    extraTextSize = value;
    _notify;
  }

  void setEllipsizeTextStyle(FontStyle? value) {
    extraTextStyle = value;
    _notify;
  }

  void setEllipsizeTextWeight(FontWeight value) {
    extraTextWeight = value;
    _notify;
  }

  void setEllipsizeVisibility(bool value) {
    extraTextVisible = value;
    _notify;
  }

  void setFontWeight(FontWeight value) {
    fontWeight = value;
    _notify;
  }

  void setLetterSpacing(double value) {
    letterSpacing = value;
    _notify;
  }

  void setLineSpacingExtra(double value) {
    lineSpacingExtra = value;
    _notify;
  }

  void setMaxLines(int? value) {
    maxLines = value;
    _notify;
  }

  void setText(String value) {
    text = value;
    _notify;
  }

  void setTextState(ValueState<String> value) {
    textState = value;
    _notify;
  }

  void setTextAlign(TextAlign value) {
    textAlign = value;
    _notify;
  }

  void setTextColor(Color value) {
    textColor = value;
    _notify;
  }

  void setTextColorState(ValueState<Color> value) {
    textColorState = value;
    _notify;
  }

  void setTextDirection(TextDirection value) {
    textDirection = value;
    _notify;
  }

  void setTextLength(int value) {
    maxCharacters = value;
    _notify;
  }

  void setTextOverflow(TextOverflow value) {
    textOverflow = value;
    _notify;
  }

  void setTextSize(double value) {
    textSize = value;
    _notify;
  }

  void setTextSpans(List<TextSpan> value) {
    textSpans = value;
    _notify;
  }

  void setTextWeight(FontWeight value) {
    fontWeight = value;
    _notify;
  }

  void setWordSpacing(double value) {
    wordSpacing = value;
    _notify;
  }
}
