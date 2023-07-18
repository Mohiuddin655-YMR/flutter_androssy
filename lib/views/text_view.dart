part of '../widgets.dart';

class TextView<T extends TextViewController> extends YMRView<T> {
  final int? maxCharacters;
  final int? maxLines;

  final double? letterSpacing;
  final double? lineSpacingExtra;
  final double? wordSpacing;

  final FontStyle? ellipsizeFontStyle;
  final FontWeight? ellipsizeFontWeight;
  final String? ellipsizeText;
  final ValueState<String>? ellipsizeTextState;
  final bool? ellipsizeTextAllCaps;
  final Color? ellipsizeTextColor;
  final ValueState<Color>? ellipsizeTextColorState;
  final TextDecoration? ellipsizeTextDecoration;
  final Color? ellipsizeTextDecorationColor;
  final TextDecorationStyle? ellipsizeTextDecorationStyle;
  final double? ellipsizeTextDecorationThickness;
  final double? ellipsizeTextLetterSpace;
  final double? ellipsizeTextSize;
  final TextStyle? ellipsizeTextStyle;
  final bool? ellipsizeTextVisible;
  final OnViewClickListener? onEllipsizeClick;

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
    this.maxCharacters,
    this.maxLines,
    this.letterSpacing,
    this.lineSpacingExtra,
    this.wordSpacing,
    this.ellipsizeText,
    this.ellipsizeTextState,
    this.ellipsizeTextAllCaps,
    this.ellipsizeTextColor,
    this.ellipsizeTextColorState,
    this.ellipsizeTextDecoration,
    this.ellipsizeTextDecorationColor,
    this.ellipsizeTextDecorationStyle,
    this.ellipsizeTextDecorationThickness,
    this.ellipsizeTextLetterSpace,
    this.ellipsizeTextSize,
    this.ellipsizeFontStyle,
    this.ellipsizeTextVisible,
    this.ellipsizeFontWeight,
    this.ellipsizeTextStyle,
    this.onEllipsizeClick,
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
  T attachController(T controller) {
    return controller.fromTextView(this) as T;
  }

  @override
  Widget? attach(BuildContext context, T controller) {
    return RawTextView(
      ellipsizeText: controller.ellipsizeText,
      ellipsizeTextColor: controller.ellipsizeTextColor,
      ellipsizeTextDecoration: controller.ellipsizeTextDecoration,
      ellipsizeTextDecorationColor: controller.ellipsizeTextDecorationColor,
      ellipsizeTextDecorationStyle: controller.ellipsizeTextDecorationStyle,
      ellipsizeTextDecorationThickness:
          controller.ellipsizeTextDecorationThickness,
      ellipsizeTextLetterSpace: controller.ellipsizeTextLetterSpace,
      ellipsizeTextSize: controller.ellipsizeTextSize,
      ellipsizeTextStyle: controller.ellipsizeTextStyle,
      ellipsizeTextVisible: controller.ellipsizeTextVisible,
      ellipsizeFontStyle: controller.ellipsizeFontStyle,
      ellipsizeFontWeight: controller.ellipsizeFontWeight,
      onEllipsizeClick: controller.onEllipsizeClick,
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
  final FontStyle? ellipsizeFontStyle;
  final FontWeight? ellipsizeFontWeight;
  final String? ellipsizeText;
  final Color? ellipsizeTextColor;
  final TextDecoration? ellipsizeTextDecoration;
  final Color? ellipsizeTextDecorationColor;
  final TextDecorationStyle? ellipsizeTextDecorationStyle;
  final double? ellipsizeTextDecorationThickness;
  final double? ellipsizeTextLetterSpace;
  final double? ellipsizeTextSize;
  final TextStyle ellipsizeTextStyle;
  final bool ellipsizeTextVisible;
  final OnViewClickListener? onEllipsizeClick;

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
    this.ellipsizeFontStyle,
    this.ellipsizeFontWeight,
    this.ellipsizeText,
    this.ellipsizeTextColor,
    this.ellipsizeTextDecoration,
    this.ellipsizeTextDecorationColor,
    this.ellipsizeTextDecorationStyle,
    this.ellipsizeTextDecorationThickness,
    this.ellipsizeTextLetterSpace,
    this.ellipsizeTextSize,
    this.ellipsizeTextStyle = const TextStyle(),
    this.ellipsizeTextVisible = true,
    this.onEllipsizeClick,
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
          if ((ellipsizeText ?? "").isNotEmpty && ellipsizeTextVisible)
            TextSpan(
              text: ellipsizeText,
              recognizer: onEllipsizeClick != null
                  ? (TapGestureRecognizer()
                    ..onTap = () => onEllipsizeClick?.call(context))
                  : null,
              style: ellipsizeTextStyle.copyWith(
                color: ellipsizeTextColor,
                fontSize: ellipsizeTextSize,
                fontStyle: ellipsizeFontStyle,
                letterSpacing: ellipsizeTextLetterSpace,
                fontWeight: ellipsizeFontWeight,
                decoration: ellipsizeTextDecoration,
                decorationColor: ellipsizeTextDecorationColor,
                decorationStyle: ellipsizeTextDecorationStyle,
                decorationThickness: ellipsizeTextDecorationThickness,
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

  FontStyle? ellipsizeFontStyle;
  FontWeight? ellipsizeFontWeight;
  String? _ellipsizeText;
  ValueState<String>? ellipsizeTextState;
  bool ellipsizeTextAllCaps = false;
  Color? _ellipsizeTextColor;
  ValueState<Color>? ellipsizeTextColorState;
  TextDecoration? ellipsizeTextDecoration;
  Color? ellipsizeTextDecorationColor;
  TextDecorationStyle? ellipsizeTextDecorationStyle;
  double? ellipsizeTextDecorationThickness;
  double? ellipsizeTextLetterSpace;
  double? ellipsizeTextSize;
  TextStyle ellipsizeTextStyle = const TextStyle();
  bool ellipsizeTextVisible = true;
  OnViewClickListener? _onEllipsizeClick;

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

    ellipsizeFontStyle = view.ellipsizeFontStyle;
    ellipsizeFontWeight = view.ellipsizeFontWeight;
    ellipsizeText = view.ellipsizeText;
    ellipsizeTextState = view.ellipsizeTextState;
    ellipsizeTextColor = view.ellipsizeTextColor;
    ellipsizeTextColorState = view.ellipsizeTextColorState;
    ellipsizeTextDecoration = view.ellipsizeTextDecoration;
    ellipsizeTextDecorationColor = view.ellipsizeTextDecorationColor;
    ellipsizeTextDecorationStyle = view.ellipsizeTextDecorationStyle;
    ellipsizeTextDecorationThickness = view.ellipsizeTextDecorationThickness;
    ellipsizeTextLetterSpace = view.ellipsizeTextLetterSpace;
    ellipsizeTextSize = view.ellipsizeTextSize;
    ellipsizeTextStyle = view.ellipsizeTextStyle ?? const TextStyle();
    ellipsizeTextVisible = view.ellipsizeTextVisible ?? true;
    onEllipsizeClick = view.onEllipsizeClick;

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

  double? get spacingFactor {
    final x = textSize + lineSpacingExtra;
    final y = x * 0.068;
    return lineSpacingExtra > 0 ? y : null;
  }

  set text(String? value) => _text = value;

  String get text {
    final value = textState?.activated(activated, enabled) ?? _text ?? "";
    if (maxCharacters > 0 && !activated) {
      return value.substring(
        0,
        value.length > maxCharacters ? maxCharacters : value.length,
      );
    } else {
      return textAllCaps ? value.toUpperCase() : value;
    }
  }

  set textColor(Color? value) => _textColor = value;

  Color? get textColor {
    return textColorState?.activated(activated, enabled) ?? _textColor;
  }

  set ellipsizeText(String? value) => _ellipsizeText = value;

  String? get ellipsizeText {
    final value =
        ellipsizeTextState?.activated(activated, enabled) ?? _ellipsizeText;
    return ellipsizeTextAllCaps ? value?.toUpperCase() : value;
  }

  set ellipsizeTextColor(Color? value) => _ellipsizeTextColor = value;

  Color? get ellipsizeTextColor {
    return ellipsizeTextColorState?.activated(activated, enabled) ??
        _ellipsizeTextColor;
  }

  bool get isAutoEllipsize {
    final a = maxCharacters > 0;
    final b = text.length > maxCharacters;
    return (a && b) || ellipsizeTextVisible;
  }

  OnViewClickListener? get onEllipsizeClick =>
      enabled ? _onEllipsizeClick : null;

  set onEllipsizeClick(OnViewClickListener? listener) =>
      _onEllipsizeClick ??= listener;

  void setEllipsizeFontStyle(FontStyle? value) {
    ellipsizeFontStyle = value;
    _notify;
  }

  void setEllipsizeFontWeight(FontWeight value) {
    ellipsizeFontWeight = value;
    _notify;
  }

  void setEllipsizeLetterSpace(double? value) {
    ellipsizeTextLetterSpace = value;
    _notify;
  }

  void setEllipsizeText(String? value) {
    ellipsizeText = value;
    _notify;
  }

  void setEllipsizeTextState(ValueState<String>? value) {
    ellipsizeTextState = value;
    _notify;
  }

  void setEllipsizeTextColor(Color? value) {
    ellipsizeTextColor = value;
    _notify;
  }

  void setEllipsizeTextColorState(ValueState<Color>? value) {
    ellipsizeTextColorState = value;
    _notify;
  }

  void setEllipsizeTextDecoration(TextDecoration? value) {
    ellipsizeTextDecoration = value;
    _notify;
  }

  void setEllipsizeTextDecorationColor(Color? value) {
    ellipsizeTextDecorationColor = value;
    _notify;
  }

  void setEllipsizeTextDecorationStyle(TextDecorationStyle? value) {
    ellipsizeTextDecorationStyle = value;
    _notify;
  }

  void setEllipsizeTextDecorationThickness(double? value) {
    ellipsizeTextDecorationThickness = value;
    _notify;
  }

  void setEllipsizeTextSize(double? value) {
    ellipsizeTextSize = value;
    _notify;
  }

  void setEllipsizeTextStyle(TextStyle value) {
    ellipsizeTextStyle = value;
    _notify;
  }

  void setEllipsizeVisibility(bool value) {
    ellipsizeTextVisible = value;
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

  void setOnEllipsizeClickListener(OnViewClickListener listener) {
    _onClick = listener;
  }
}
