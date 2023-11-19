part of '../widgets.dart';

class TextViewController extends ViewController {
  int maxCharacters = 0;

  void setMaxCharacters(int value) {
    onNotifyWithCallback(() => maxCharacters = value);
  }

  int? maxLines;

  void setMaxLines(int? value) {
    onNotifyWithCallback(() => maxLines = value);
  }

  Color? selectionColor;

  void setSelectionColor(Color? value) {
    onNotifyWithCallback(() => selectionColor = value);
  }

  String? semanticsLabel;

  void setSemanticsLabel(String? value) {
    onNotifyWithCallback(() => semanticsLabel = value);
  }

  bool? softWrap;

  void setSoftWrap(bool? value) {
    onNotifyWithCallback(() => softWrap = value);
  }

  StrutStyle? strutStyle;

  void setStrutStyle(StrutStyle? value) {
    onNotifyWithCallback(() => strutStyle = value);
  }

  double? letterSpacing;

  void setLetterSpacing(double? value) {
    onNotifyWithCallback(() => letterSpacing = value);
  }

  double lineSpacingExtra = 0;

  void setLineSpacingExtra(double value) {
    onNotifyWithCallback(() => lineSpacingExtra = value);
  }

  Locale? locale;

  void setLocale(Locale? value) {
    onNotifyWithCallback(() => locale = value);
  }

  double? wordSpacing;

  void setWordSpacing(double? value) {
    onNotifyWithCallback(() => wordSpacing = value);
  }

  String? ellipsis;

  void setEllipsis(String? value) {
    onNotifyWithCallback(() => ellipsis = value);
  }

  String? _text;

  set text(String? value) => _text = value;

  void setText(String? value) {
    onNotifyWithCallback(() => text = value);
  }

  String? textExtras;

  void setTextExtras(String? value) {
    onNotifyWithCallback(() => textExtras = value);
  }

  ValueState<String>? textState;

  void setTextState(ValueState<String>? value) {
    onNotifyWithCallback(() => textState = value);
  }

  TextAlign? textAlign;

  void setTextAlign(TextAlign? value) {
    onNotifyWithCallback(() => textAlign = value);
  }

  bool textAllCaps = false;

  void setTextAllCaps(bool value) {
    onNotifyWithCallback(() => textAllCaps = value);
  }

  Color? _textColor;

  set textColor(Color? value) => _textColor = value;

  void setTextColor(Color? value) {
    onNotifyWithCallback(() => textColor = value);
  }

  ValueState<Color>? textColorState;

  void setTextColorState(ValueState<Color>? value) {
    onNotifyWithCallback(() => textColorState = value);
  }

  TextDecoration? textDecoration;

  void setTextDecoration(TextDecoration? value) {
    onNotifyWithCallback(() => textDecoration = value);
  }

  Color? textDecorationColor;

  void setTextDecorationColor(Color? value) {
    onNotifyWithCallback(() => textDecorationColor = value);
  }

  TextDecorationStyle? textDecorationStyle;

  void setTextDecorationStyle(TextDecorationStyle? value) {
    onNotifyWithCallback(() => textDecorationStyle = value);
  }

  double? textDecorationThickness;

  void setTextDecorationThickness(double? value) {
    onNotifyWithCallback(() => textDecorationThickness = value);
  }

  TextDirection? textDirection;

  void setTextDirection(TextDirection? value) {
    onNotifyWithCallback(() => textDirection = value);
  }

  String? textFontFamily;

  void setTextFontFamily(String? value) {
    onNotifyWithCallback(() => textFontFamily = value);
  }

  FontStyle? textFontStyle;

  void setTextFontStyle(FontStyle? value) {
    onNotifyWithCallback(() => textFontStyle = value);
  }

  FontWeight? _textFontWeight;

  set textFontWeight(FontWeight? value) => _textFontWeight = value;

  void setTextFontWeight(FontWeight? value) {
    onNotifyWithCallback(() => textFontWeight = value);
  }

  ValueState<FontWeight>? textFontWeightState;

  void setTextFontWeightState(ValueState<FontWeight>? value) {
    onNotifyWithCallback(() => textFontWeightState = value);
  }

  TextHeightBehavior? textHeightBehavior;

  void setTextHeightBehavior(TextHeightBehavior? value) {
    onNotifyWithCallback(() => textHeightBehavior = value);
  }

  TextLeadingDistribution? textLeadingDistribution;

  void setTextLeadingDistribution(TextLeadingDistribution? value) {
    onNotifyWithCallback(() => textLeadingDistribution = value);
  }

  TextOverflow? textOverflow;

  void setTextOverflow(TextOverflow? value) {
    onNotifyWithCallback(() => textOverflow = value);
  }

  double textScaleFactor = 1;

  void setTextScaleFactor(double value) {
    onNotifyWithCallback(() => textScaleFactor = value);
  }

  double? _textSize;

  set textSize(double? value) => _textSize = value;

  void setTextSize(double? value) {
    onNotifyWithCallback(() => textSize = value);
  }

  ValueState<double>? textSizeState;

  void setTextSizeState(ValueState<double>? value) {
    onNotifyWithCallback(() => textSizeState = value);
  }

  List<TextSpan> textSpans = [];

  void setTextSpans(List<TextSpan> value) {
    onNotifyWithCallback(() => textSpans = value);
  }

  TextStyle? _textStyle;

  set textStyle(TextStyle? value) => _textStyle = value;

  void setTextStyle(TextStyle? value) {
    onNotifyWithCallback(() => textStyle = value);
  }

  ValueState<TextStyle>? textStyleState;

  void setTextStyleState(ValueState<TextStyle>? value) {
    onNotifyWithCallback(() => textStyleState = value);
  }

  TextWidthBasis textWidthBasis = TextWidthBasis.parent;

  void setTextWidthBasis(TextWidthBasis value) {
    onNotifyWithCallback(() => textWidthBasis = value);
  }

  /// PREFIX TEXT PROPERTIES
  FontStyle? prefixFontStyle;

  void setPrefixFontStyle(FontStyle? value) {
    onNotifyWithCallback(() => prefixFontStyle = value);
  }

  FontWeight? _prefixFontWeight;

  set prefixFontWeight(FontWeight? value) => _prefixFontWeight = value;

  void setPrefixFontWeight(FontWeight? value) {
    onNotifyWithCallback(() => prefixFontWeight = value);
  }

  ValueState<FontWeight>? prefixFontWeightState;

  void setPrefixFontWeightState(ValueState<FontWeight>? value) {
    onNotifyWithCallback(() => prefixFontWeightState = value);
  }

  String? _prefixText;

  set prefixText(String? value) => _prefixText = value;

  void setPrefixText(String? value) {
    onNotifyWithCallback(() => prefixText = value);
  }

  ValueState<String>? prefixTextState;

  void setPrefixTextState(ValueState<String>? value) {
    onNotifyWithCallback(() => prefixTextState = value);
  }

  bool prefixTextAllCaps = false;

  void setPrefixTextAllCaps(bool value) {
    onNotifyWithCallback(() => prefixTextAllCaps = value);
  }

  Color? _prefixTextColor;

  set prefixTextColor(Color? value) => _prefixTextColor = value;

  void setPrefixTextColor(Color? value) {
    onNotifyWithCallback(() => prefixTextColor = value);
  }

  ValueState<Color>? prefixTextColorState;

  void setPrefixTextColorState(ValueState<Color>? value) {
    onNotifyWithCallback(() => prefixTextColorState = value);
  }

  TextDecoration? prefixTextDecoration;

  void setPrefixTextDecoration(TextDecoration? value) {
    onNotifyWithCallback(() => prefixTextDecoration = value);
  }

  Color? prefixTextDecorationColor;

  void setPrefixTextDecorationColor(Color? value) {
    onNotifyWithCallback(() => prefixTextDecorationColor = value);
  }

  TextDecorationStyle? prefixTextDecorationStyle;

  void setPrefixTextDecorationStyle(TextDecorationStyle? value) {
    onNotifyWithCallback(() => prefixTextDecorationStyle = value);
  }

  double? prefixTextDecorationThickness;

  void setPrefixTextDecorationThickness(double? value) {
    onNotifyWithCallback(() => prefixTextDecorationThickness = value);
  }

  double? prefixTextLetterSpace;

  void setPrefixTextLetterSpace(double? value) {
    onNotifyWithCallback(() => prefixTextLetterSpace = value);
  }

  double? _prefixTextSize;

  set prefixTextSize(double? value) => _prefixTextSize = value;

  void setPrefixTextSize(double? value) {
    onNotifyWithCallback(() => prefixTextSize = value);
  }

  ValueState<double>? prefixTextSizeState;

  void setPrefixTextSizeState(ValueState<double>? value) {
    onNotifyWithCallback(() => prefixTextSizeState = value);
  }

  TextStyle? _prefixTextStyle;

  set prefixTextStyle(TextStyle? value) => _prefixTextStyle = value;

  void setPrefixTextStyle(TextStyle? value) {
    onNotifyWithCallback(() => prefixTextStyle = value);
  }

  ValueState<TextStyle>? prefixTextStyleState;

  void setPrefixTextStyleState(ValueState<TextStyle>? value) {
    onNotifyWithCallback(() => prefixTextStyleState = value);
  }

  bool prefixTextVisible = true;

  void setPrefixTextVisible(bool value) {
    onNotifyWithCallback(() => prefixTextVisible = value);
  }

  OnViewClickListener? _onPrefixClick;

  set onPrefixClick(OnViewClickListener? listener) => _onPrefixClick = listener;

  void setOnPrefixClickListener(OnViewClickListener? listener) {
    onNotifyWithCallback(() => onPrefixClick = listener);
  }

  /// SUFFIX TEXT PROPERTIES
  FontStyle? suffixFontStyle;

  void setSuffixFontStyle(FontStyle? value) {
    onNotifyWithCallback(() => suffixFontStyle = value);
  }

  FontWeight? _suffixFontWeight;

  set suffixFontWeight(FontWeight? value) => _suffixFontWeight = value;

  void setSuffixFontWeight(FontWeight? value) {
    onNotifyWithCallback(() => suffixFontWeight = value);
  }

  ValueState<FontWeight>? suffixFontWeightState;

  void setSuffixFontWeightState(ValueState<FontWeight>? value) {
    onNotifyWithCallback(() => suffixFontWeightState = value);
  }

  String? _suffixText;

  set suffixText(String? value) => _suffixText = value;

  void setSuffixText(String? value) {
    onNotifyWithCallback(() => suffixText = value);
  }

  ValueState<String>? suffixTextState;

  void setSuffixTextState(ValueState<String>? value) {
    onNotifyWithCallback(() => suffixTextState = value);
  }

  bool suffixTextAllCaps = false;

  void setSuffixTextAllCaps(bool value) {
    onNotifyWithCallback(() => suffixTextAllCaps = value);
  }

  Color? _suffixTextColor;

  set suffixTextColor(Color? value) => _suffixTextColor = value;

  void setSuffixTextColor(Color? value) {
    onNotifyWithCallback(() => suffixTextColor = value);
  }

  ValueState<Color>? suffixTextColorState;

  void setSuffixTextColorState(ValueState<Color>? value) {
    onNotifyWithCallback(() => suffixTextColorState = value);
  }

  TextDecoration? suffixTextDecoration;

  void setSuffixTextDecoration(TextDecoration? value) {
    onNotifyWithCallback(() => suffixTextDecoration = value);
  }

  Color? suffixTextDecorationColor;

  void setSuffixTextDecorationColor(Color? value) {
    onNotifyWithCallback(() => suffixTextDecorationColor = value);
  }

  TextDecorationStyle? suffixTextDecorationStyle;

  void setSuffixTextDecorationStyle(TextDecorationStyle? value) {
    onNotifyWithCallback(() => suffixTextDecorationStyle = value);
  }

  double? suffixTextDecorationThickness;

  void setSuffixTextDecorationThickness(double? value) {
    onNotifyWithCallback(() => suffixTextDecorationThickness = value);
  }

  double? suffixTextLetterSpace;

  void setSuffixTextLetterSpace(double? value) {
    onNotifyWithCallback(() => suffixTextLetterSpace = value);
  }

  double? _suffixTextSize;

  set suffixTextSize(double? value) => _suffixTextSize = value;

  void setSuffixTextSize(double? value) {
    onNotifyWithCallback(() => suffixTextSize = value);
  }

  ValueState<double>? suffixTextSizeState;

  void setSuffixTextSizeState(ValueState<double>? value) {
    onNotifyWithCallback(() => suffixTextSizeState = value);
  }

  TextStyle? _suffixTextStyle;

  set suffixTextStyle(TextStyle? value) => _suffixTextStyle = value;

  void setSuffixTextStyle(TextStyle? value) {
    onNotifyWithCallback(() => suffixTextStyle = value);
  }

  ValueState<TextStyle>? suffixTextStyleState;

  void setSuffixTextStyleState(ValueState<TextStyle>? value) {
    onNotifyWithCallback(() => suffixTextStyleState = value);
  }

  bool suffixTextVisible = true;

  void setSuffixTextVisible(bool value) {
    onNotifyWithCallback(() => suffixTextVisible = value);
  }

  OnViewClickListener? _onSuffixClick;

  set onSuffixClick(OnViewClickListener? listener) => _onSuffixClick = listener;

  void setOnSuffixClickListener(OnViewClickListener? value) {
    onNotifyWithCallback(() => onSuffixClick = value);
  }

  TextViewController fromTextView(TextView view) {
    super.fromView(view);

    ellipsis = view.ellipsis;

    maxCharacters = view.maxCharacters;
    maxLines = view.maxLines;
    locale = view.locale;

    letterSpacing = view.letterSpacing;
    lineSpacingExtra = view.lineSpacingExtra;
    selectionColor = view.selectionColor;
    semanticsLabel = view.semanticsLabel;
    softWrap = view.softWrap;
    textScaleFactor = view.textScaleFactor;
    strutStyle = view.strutStyle;
    wordSpacing = view.wordSpacing;

    text = view.text;
    textState = view.textState;
    textAlign = view.textAlign;
    textAllCaps = view.textAllCaps;
    textColor = view.textColor;
    textColorState = view.textColorState;
    textDecoration = view.textDecoration;
    textDecorationColor = view.textDecorationColor;
    textDecorationStyle = view.textDecorationStyle;
    textDecorationThickness = view.textDecorationThickness;
    textDirection = view.textDirection;
    textFontFamily = view.textFontFamily;
    textFontStyle = view.textFontStyle;
    textFontWeight = view.textFontWeight;
    textFontWeightState = view.textFontWeightState;
    textHeightBehavior = view.textHeightBehavior;
    textLeadingDistribution = view.textLeadingDistribution;
    textOverflow = view.textOverflow;
    textSize = view.textSize;
    textSizeState = view.textSizeState;
    textSpans = view.textSpans;
    textStyle = view.textStyle;
    textWidthBasis = view.textWidthBasis;
    textExtras = textExtrasFromSpans;

    ///PREFIX
    prefixFontStyle = view.prefixFontStyle;
    prefixFontWeight = view.prefixFontWeight;
    prefixFontWeightState = view.prefixFontWeightState;
    prefixText = view.prefixText;
    prefixTextState = view.prefixTextState;
    prefixTextAllCaps = view.prefixTextAllCaps;
    prefixTextColor = view.prefixTextColor;
    prefixTextColorState = view.prefixTextColorState;
    prefixTextDecoration = view.prefixTextDecoration;
    prefixTextDecorationColor = view.prefixTextDecorationColor;
    prefixTextDecorationStyle = view.prefixTextDecorationStyle;
    prefixTextDecorationThickness = view.prefixTextDecorationThickness;
    prefixTextLetterSpace = view.prefixTextLetterSpace;
    prefixTextSize = view.prefixTextSize;
    prefixTextSizeState = view.prefixTextSizeState;
    prefixTextStyle = view.prefixTextStyle;
    prefixTextStyleState = view.prefixTextStyleState;
    prefixTextVisible = view.prefixTextVisible;
    onPrefixClick = view.onPrefixClick;

    ///SUFFIX
    suffixFontStyle = view.suffixFontStyle;
    suffixFontWeight = view.suffixFontWeight;
    suffixFontWeightState = view.suffixFontWeightState;
    suffixText = view.suffixText;
    suffixTextState = view.suffixTextState;
    suffixTextAllCaps = view.suffixTextAllCaps;
    suffixTextColor = view.suffixTextColor;
    suffixTextColorState = view.suffixTextColorState;
    suffixTextDecoration = view.suffixTextDecoration;
    suffixTextDecorationColor = view.suffixTextDecorationColor;
    suffixTextDecorationStyle = view.suffixTextDecorationStyle;
    suffixTextDecorationThickness = view.suffixTextDecorationThickness;
    suffixTextLetterSpace = view.suffixTextLetterSpace;
    suffixTextSize = view.suffixTextSize;
    suffixTextSizeState = view.suffixTextSizeState;
    suffixTextStyle = view.suffixTextStyle;
    suffixTextStyleState = view.suffixTextStyleState;
    suffixTextVisible = view.suffixTextVisible;
    onSuffixClick = view.onSuffixClick;

    return this;
  }

  double? get spacingFactor {
    final x = (textSize ?? 0) + lineSpacingExtra;
    final y = x * 0.068;
    return lineSpacingExtra > 0 ? y : null;
  }

  String get text {
    final value = textState?.fromController(this) ?? _text ?? "";
    if (maxCharacters > 0 && !activated) {
      return value.substring(
        0,
        value.length > maxCharacters ? maxCharacters : value.length,
      );
    } else {
      return textAllCaps ? value.toUpperCase() : value;
    }
  }

  String get textExtrasFromSpans {
    StringBuffer buffer = StringBuffer();
    buffer.writeAll(textSpans.map((e) => e.text ?? ""));
    return buffer.toString();
  }

  Color? get textColor => textColorState?.fromController(this) ?? _textColor;

  FontWeight? get textFontWeight {
    return textFontWeightState?.fromController(this) ?? _textFontWeight;
  }

  double? get textSize => textSizeState?.fromController(this) ?? _textSize;

  TextStyle get textStyle =>
      textStyleState?.fromController(this) ?? _textStyle ?? const TextStyle();

  /// PREFIX

  String? get prefixText {
    final value = prefixTextState?.fromController(this) ?? _prefixText;
    return prefixTextAllCaps ? value?.toUpperCase() : value;
  }

  Color? get prefixTextColor =>
      prefixTextColorState?.fromController(this) ?? _prefixTextColor;

  FontWeight? get prefixFontWeight {
    return prefixFontWeightState?.fromController(this) ?? _prefixFontWeight;
  }

  double? get prefixTextSize =>
      prefixTextSizeState?.fromController(this) ?? _prefixTextSize;

  TextStyle get prefixTextStyle =>
      prefixTextStyleState?.fromController(this) ??
      _prefixTextStyle ??
      const TextStyle();

  bool get isAutoPrefix {
    final a = maxCharacters > 0;
    final b = text.length > maxCharacters;
    return (a && b) || prefixTextVisible;
  }

  OnViewClickListener? get onPrefixClick => enabled ? _onPrefixClick : null;

  ///SUFFIX

  String? get suffixText {
    final value = suffixTextState?.fromController(this) ?? _suffixText;
    return suffixTextAllCaps ? value?.toUpperCase() : value;
  }

  Color? get suffixTextColor =>
      suffixTextColorState?.fromController(this) ?? _suffixTextColor;

  FontWeight? get suffixFontWeight {
    return suffixFontWeightState?.fromController(this) ?? _suffixFontWeight;
  }

  double? get suffixTextSize =>
      suffixTextSizeState?.fromController(this) ?? _suffixTextSize;

  TextStyle get suffixTextStyle =>
      suffixTextStyleState?.fromController(this) ??
      _suffixTextStyle ??
      const TextStyle();

  bool get isAutoSuffix {
    final a = maxCharacters > 0;
    final b = text.length > maxCharacters;
    return (a && b) || suffixTextVisible;
  }

  OnViewClickListener? get onSuffixClick => enabled ? _onSuffixClick : null;
}

class TextView<T extends TextViewController> extends YMRView<T> {
  final int maxCharacters;
  final int? maxLines;

  final double? letterSpacing;
  final double lineSpacingExtra;
  final Color? selectionColor;
  final String? semanticsLabel;
  final bool? softWrap;
  final StrutStyle? strutStyle;
  final double? wordSpacing;

  final String? ellipsis;

  final Locale? locale;
  final String? text;
  final ValueState<String>? textState;
  final TextAlign? textAlign;
  final bool textAllCaps;
  final Color? textColor;
  final ValueState<Color>? textColorState;
  final TextDecoration? textDecoration;
  final Color? textDecorationColor;
  final TextDecorationStyle? textDecorationStyle;
  final double? textDecorationThickness;
  final TextDirection? textDirection;
  final String? textFontFamily;
  final FontStyle? textFontStyle;
  final FontWeight? textFontWeight;
  final ValueState<FontWeight>? textFontWeightState;
  final TextHeightBehavior? textHeightBehavior;
  final TextLeadingDistribution? textLeadingDistribution;
  final TextOverflow? textOverflow;
  final double textScaleFactor;
  final double? textSize;
  final ValueState<double>? textSizeState;
  final List<TextSpan> textSpans;
  final TextStyle? textStyle;
  final ValueState<TextStyle>? textStyleState;
  final TextWidthBasis textWidthBasis;

  ///PREFIX
  final FontStyle? prefixFontStyle;
  final FontWeight? prefixFontWeight;
  final ValueState<FontWeight>? prefixFontWeightState;
  final String? prefixText;
  final ValueState<String>? prefixTextState;
  final bool prefixTextAllCaps;
  final Color? prefixTextColor;
  final ValueState<Color>? prefixTextColorState;
  final TextDecoration? prefixTextDecoration;
  final Color? prefixTextDecorationColor;
  final TextDecorationStyle? prefixTextDecorationStyle;
  final double? prefixTextDecorationThickness;
  final double? prefixTextLetterSpace;
  final double? prefixTextSize;
  final ValueState<double>? prefixTextSizeState;
  final TextStyle? prefixTextStyle;
  final ValueState<TextStyle>? prefixTextStyleState;
  final bool prefixTextVisible;
  final OnViewClickListener? onPrefixClick;

  ///SUFFIX
  final FontStyle? suffixFontStyle;
  final FontWeight? suffixFontWeight;
  final ValueState<FontWeight>? suffixFontWeightState;
  final String? suffixText;
  final ValueState<String>? suffixTextState;
  final bool suffixTextAllCaps;
  final Color? suffixTextColor;
  final ValueState<Color>? suffixTextColorState;
  final TextDecoration? suffixTextDecoration;
  final Color? suffixTextDecorationColor;
  final TextDecorationStyle? suffixTextDecorationStyle;
  final double? suffixTextDecorationThickness;
  final double? suffixTextLetterSpace;
  final double? suffixTextSize;
  final ValueState<double>? suffixTextSizeState;
  final TextStyle? suffixTextStyle;
  final ValueState<TextStyle>? suffixTextStyleState;
  final bool suffixTextVisible;
  final OnViewClickListener? onSuffixClick;

  const TextView({
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
    super.widthState,
    super.widthMax,
    super.widthMin,
    super.visibility,
    super.onClick,
    super.onDoubleClick,
    super.onLongClick,
    super.onHover,
    super.onToggle,
    super.onChange,
    super.onError,
    super.onValid,
    super.onValidator,
    this.ellipsis,
    this.letterSpacing,
    this.lineSpacingExtra = 0,
    this.locale,
    this.maxCharacters = 0,
    this.maxLines,
    this.selectionColor,
    this.semanticsLabel,
    this.softWrap,
    this.strutStyle,
    this.wordSpacing,
    required this.text,
    this.textState,
    this.textAlign,
    this.textAllCaps = false,
    this.textColor,
    this.textColorState,
    this.textDecoration,
    this.textDecorationColor,
    this.textDecorationStyle,
    this.textDecorationThickness,
    this.textDirection,
    this.textFontFamily,
    this.textFontStyle,
    this.textFontWeight,
    this.textFontWeightState,
    this.textHeightBehavior,
    this.textLeadingDistribution,
    this.textOverflow,
    this.textScaleFactor = 1,
    this.textSize,
    this.textSizeState,
    this.textSpans = const [],
    this.textStyle,
    this.textStyleState,
    this.textWidthBasis = TextWidthBasis.parent,

    ///PREFIX
    this.prefixFontStyle,
    this.prefixFontWeight,
    this.prefixFontWeightState,
    this.prefixText,
    this.prefixTextState,
    this.prefixTextAllCaps = false,
    this.prefixTextColor,
    this.prefixTextColorState,
    this.prefixTextDecoration,
    this.prefixTextDecorationColor,
    this.prefixTextDecorationStyle,
    this.prefixTextDecorationThickness,
    this.prefixTextLetterSpace,
    this.prefixTextSize,
    this.prefixTextSizeState,
    this.prefixTextStyle,
    this.prefixTextStyleState,
    this.prefixTextVisible = true,
    this.onPrefixClick,

    ///SUFFIX
    this.suffixText,
    this.suffixTextState,
    this.suffixTextAllCaps = false,
    this.suffixTextColor,
    this.suffixTextColorState,
    this.suffixTextDecoration,
    this.suffixTextDecorationColor,
    this.suffixTextDecorationStyle,
    this.suffixTextDecorationThickness,
    this.suffixTextLetterSpace,
    this.suffixTextSize,
    this.suffixTextSizeState,
    this.suffixFontStyle,
    this.suffixFontWeight,
    this.suffixFontWeightState,
    this.suffixTextVisible = true,
    this.suffixTextStyle,
    this.suffixTextStyleState,
    this.onSuffixClick,
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
      ellipsis: controller.ellipsis,
      letterSpacing: controller.letterSpacing,
      lineHeight: controller.spacingFactor,
      locale: controller.locale,
      maxLines: controller.maxLines,
      selectionColor: controller.selectionColor,
      semanticsLabel: controller.semanticsLabel,
      softWrap: controller.softWrap,
      strutStyle: controller.strutStyle,
      text: controller.text,
      textAlign: controller.textAlign,
      textColor: controller.textColor,
      textDecoration: controller.textDecoration,
      textDecorationColor: controller.textDecorationColor,
      textDecorationStyle: controller.textDecorationStyle,
      textDecorationThickness: controller.textDecorationThickness,
      textDirection: controller.textDirection,
      textFontFamily: controller.textFontFamily,
      textFontStyle: controller.textFontStyle,
      textFontWeight: controller.textFontWeight,
      textHeightBehavior: controller.textHeightBehavior,
      textLeadingDistribution: controller.textLeadingDistribution,
      textOverflow: controller.textOverflow,
      textScaleFactor: controller.textScaleFactor,
      textSize: controller.textSize,
      textSpans: controller.textSpans,
      textStyle: controller.textStyle,
      textWidthBasis: controller.textWidthBasis,
      wordSpacing: controller.wordSpacing,
      onClick: null,

      /// PREFIX
      prefixFontStyle: controller.prefixFontStyle,
      prefixFontWeight: controller.prefixFontWeight,
      prefixText: controller.prefixText,
      prefixTextColor: controller.prefixTextColor,
      prefixTextDecoration: controller.prefixTextDecoration,
      prefixTextDecorationColor: controller.prefixTextDecorationColor,
      prefixTextDecorationStyle: controller.prefixTextDecorationStyle,
      prefixTextDecorationThickness: controller.prefixTextDecorationThickness,
      prefixTextLetterSpace: controller.prefixTextLetterSpace,
      prefixTextSize: controller.prefixTextSize,
      prefixTextStyle: controller.prefixTextStyle,
      prefixTextVisible: controller.prefixTextVisible,
      onPrefixClick: controller.onPrefixClick,

      /// SUFFIX
      suffixFontStyle: controller.suffixFontStyle,
      suffixFontWeight: controller.suffixFontWeight,
      suffixText: controller.suffixText,
      suffixTextColor: controller.suffixTextColor,
      suffixTextDecoration: controller.suffixTextDecoration,
      suffixTextDecorationColor: controller.suffixTextDecorationColor,
      suffixTextDecorationStyle: controller.suffixTextDecorationStyle,
      suffixTextDecorationThickness: controller.suffixTextDecorationThickness,
      suffixTextLetterSpace: controller.suffixTextLetterSpace,
      suffixTextSize: controller.suffixTextSize,
      suffixTextStyle: controller.suffixTextStyle,
      suffixTextVisible: controller.suffixTextVisible,
      onSuffixClick: controller.onSuffixClick,
    );
  }
}

class EllipsisPainter extends CustomPainter {
  final TextPainter painter;

  const EllipsisPainter(this.painter);

  @override
  void paint(Canvas canvas, Size size) {
    painter.layout(maxWidth: size.width);
    painter.paint(canvas, const Offset(0, 0));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class RawTextView extends StatelessWidget {
  final String? ellipsis;
  final int? maxLines;

  final double? letterSpacing;
  final double? lineHeight;
  final Locale? locale;
  final double? wordSpacing;

  final String? textFontFamily;
  final FontStyle? textFontStyle;
  final FontWeight? textFontWeight;
  final Color? selectionColor;
  final String? semanticsLabel;
  final bool? softWrap;
  final StrutStyle? strutStyle;

  final String? text;
  final TextAlign? textAlign;
  final Color? textColor;
  final TextDecoration? textDecoration;
  final Color? textDecorationColor;
  final TextDecorationStyle? textDecorationStyle;
  final double? textDecorationThickness;
  final TextDirection? textDirection;
  final TextHeightBehavior? textHeightBehavior;
  final TextLeadingDistribution? textLeadingDistribution;
  final TextOverflow? textOverflow;
  final double? textScaleFactor;
  final double? textSize;
  final List<TextSpan> textSpans;
  final TextStyle textStyle;
  final TextWidthBasis textWidthBasis;
  final OnViewClickListener? onClick;

  ///PREFIX
  final FontStyle? prefixFontStyle;
  final FontWeight? prefixFontWeight;
  final String? prefixText;
  final Color? prefixTextColor;
  final TextDecoration? prefixTextDecoration;
  final Color? prefixTextDecorationColor;
  final TextDecorationStyle? prefixTextDecorationStyle;
  final double? prefixTextDecorationThickness;
  final double? prefixTextLetterSpace;
  final double? prefixTextSize;
  final TextStyle prefixTextStyle;
  final bool prefixTextVisible;
  final OnViewClickListener? onPrefixClick;

  ///SUFFIX
  final FontStyle? suffixFontStyle;
  final FontWeight? suffixFontWeight;
  final String? suffixText;
  final Color? suffixTextColor;
  final TextDecoration? suffixTextDecoration;
  final Color? suffixTextDecorationColor;
  final TextDecorationStyle? suffixTextDecorationStyle;
  final double? suffixTextDecorationThickness;
  final double? suffixTextLetterSpace;
  final double? suffixTextSize;
  final TextStyle suffixTextStyle;
  final bool suffixTextVisible;
  final OnViewClickListener? onSuffixClick;

  const RawTextView({
    super.key,
    this.ellipsis,
    this.textFontFamily,
    this.textFontStyle,
    this.textFontWeight,
    this.letterSpacing,
    this.lineHeight,
    this.locale,
    this.maxLines,
    this.selectionColor,
    this.semanticsLabel,
    this.softWrap,
    this.strutStyle,
    required this.text,
    this.textAlign,
    this.textColor,
    this.textDecoration,
    this.textDecorationColor,
    this.textDecorationStyle,
    this.textDecorationThickness,
    this.textDirection,
    this.textHeightBehavior,
    this.textLeadingDistribution,
    this.textOverflow,
    this.textScaleFactor,
    this.textSize,
    this.textSpans = const [],
    this.textStyle = const TextStyle(),
    this.textWidthBasis = TextWidthBasis.parent,
    this.wordSpacing,
    this.onClick,

    ///PREFIX
    this.prefixFontStyle,
    this.prefixFontWeight,
    this.prefixText,
    this.prefixTextColor,
    this.prefixTextDecoration,
    this.prefixTextDecorationColor,
    this.prefixTextDecorationStyle,
    this.prefixTextDecorationThickness,
    this.prefixTextLetterSpace,
    this.prefixTextSize,
    this.prefixTextStyle = const TextStyle(),
    this.prefixTextVisible = true,
    this.onPrefixClick,

    ///SUFFIX
    this.suffixFontStyle,
    this.suffixFontWeight,
    this.suffixText,
    this.suffixTextColor,
    this.suffixTextDecoration,
    this.suffixTextDecorationColor,
    this.suffixTextDecorationStyle,
    this.suffixTextDecorationThickness,
    this.suffixTextLetterSpace,
    this.suffixTextSize,
    this.suffixTextStyle = const TextStyle(),
    this.suffixTextVisible = true,
    this.onSuffixClick,
  });

  @override
  Widget build(BuildContext context) {
    var isEllipsis = ellipsis != null;
    var isPrefix = (prefixText ?? "").isNotEmpty && prefixTextVisible;
    var isSuffix = (suffixText ?? "").isNotEmpty && suffixTextVisible;
    var isSpannable = isPrefix || isSuffix || textSpans.isNotEmpty;

    var style = textStyle.copyWith(
      color: textColor,
      fontSize: textSize,
      fontWeight: textFontWeight,
      decoration: textDecoration,
      decorationColor: textDecorationColor,
      decorationStyle: textDecorationStyle,
      decorationThickness: textDecorationThickness,
      fontFamily: textFontFamily,
      fontStyle: textFontStyle,
      height: lineHeight,
      leadingDistribution: textLeadingDistribution,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
    );

    var span = isSpannable
        ? TextSpan(
            style: isEllipsis ? style : null,
            semanticsLabel: semanticsLabel,
            children: [
              if (isPrefix)
                TextSpan(
                  text: prefixText,
                  recognizer: context.onClick(onPrefixClick ?? onClick),
                  style: prefixTextStyle.copyWith(
                    color: prefixTextColor,
                    fontSize: prefixTextSize,
                    fontStyle: prefixFontStyle,
                    letterSpacing: prefixTextLetterSpace,
                    fontWeight: prefixFontWeight,
                    decoration: prefixTextDecoration,
                    decorationColor: prefixTextDecorationColor,
                    decorationStyle: prefixTextDecorationStyle,
                    decorationThickness: prefixTextDecorationThickness,
                  ),
                ),
              TextSpan(
                text: text,
                recognizer: context.onClick(onClick),
              ),
              ...textSpans,
              if (isSuffix)
                TextSpan(
                  text: suffixText,
                  recognizer: context.onClick(onSuffixClick ?? onClick),
                  style: suffixTextStyle.copyWith(
                    color: suffixTextColor,
                    fontSize: suffixTextSize,
                    fontStyle: suffixFontStyle,
                    letterSpacing: suffixTextLetterSpace,
                    fontWeight: suffixFontWeight,
                    decoration: suffixTextDecoration,
                    decorationColor: suffixTextDecorationColor,
                    decorationStyle: suffixTextDecorationStyle,
                    decorationThickness: suffixTextDecorationThickness,
                  ),
                ),
            ],
          )
        : null;

    if (isEllipsis) {
      return LayoutBuilder(
        builder: (context, constraints) {
          var painter = TextPainter(
            text: span ??
                TextSpan(
                  text: text,
                  style: style,
                  locale: locale,
                  semanticsLabel: semanticsLabel,
                  recognizer: context.onClick(onClick),
                ),
            textAlign: textAlign ?? TextAlign.start,
            textDirection: textDirection ?? TextDirection.ltr,
            textScaleFactor: textScaleFactor ?? 1,
            maxLines: maxLines,
            ellipsis: ellipsis ?? "...",
            locale: locale,
            strutStyle: strutStyle,
            textWidthBasis: textWidthBasis,
            textHeightBehavior: textHeightBehavior,
          );
          painter.layout(maxWidth: constraints.maxWidth);
          return CustomPaint(
            size: painter.size,
            painter: EllipsisPainter(painter),
          );
        },
      );
    } else if (span != null) {
      return Text.rich(
        span,
        style: style,
        strutStyle: strutStyle,
        textAlign: textAlign,
        textDirection: textDirection,
        locale: locale,
        softWrap: softWrap,
        overflow: textOverflow,
        textScaleFactor: textScaleFactor,
        maxLines: maxLines,
        semanticsLabel: semanticsLabel,
        textWidthBasis: textWidthBasis,
        textHeightBehavior: textHeightBehavior,
        selectionColor: selectionColor,
      );
    } else {
      return Text(
        text ?? "",
        style: style,
        strutStyle: strutStyle,
        textAlign: textAlign,
        textDirection: textDirection,
        locale: locale,
        softWrap: softWrap,
        overflow: textOverflow,
        textScaleFactor: textScaleFactor,
        maxLines: maxLines,
        semanticsLabel: semanticsLabel,
        textWidthBasis: textWidthBasis,
        textHeightBehavior: textHeightBehavior,
        selectionColor: selectionColor,
      );
    }
  }
}
