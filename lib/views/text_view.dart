part of '../widgets.dart';

class EllipsisPainter extends CustomPainter {
  final TextPainter painter;

  const EllipsisPainter(this.painter);

  @override
  void paint(Canvas canvas, Size size) {
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

  final String? fontFamily;
  final FontStyle? fontStyle;
  final FontWeight? fontWeight;
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
  final double textSize;
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
    this.fontFamily,
    this.fontStyle,
    this.fontWeight,
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
    this.textSize = 14,
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
            text: span,
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

class TextView<T extends TextViewController> extends YMRView<T> {
  final int? maxCharacters;
  final int? maxLines;

  final double? letterSpacing;
  final double? lineSpacingExtra;
  final Color? selectionColor;
  final String? semanticsLabel;
  final bool? softWrap;
  final StrutStyle? strutStyle;
  final double? wordSpacing;

  final String? ellipsis;

  final String? fontFamily;
  final FontStyle? fontStyle;
  final FontWeight? fontWeight;

  final Locale? locale;
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
  final TextHeightBehavior? textHeightBehavior;
  final TextLeadingDistribution? textLeadingDistribution;
  final TextOverflow? textOverflow;
  final double? textScaleFactor;
  final double? textSize;
  final List<TextSpan>? textSpans;
  final TextStyle? textStyle;
  final TextWidthBasis? textWidthBasis;

  ///PREFIX
  final FontStyle? prefixFontStyle;
  final FontWeight? prefixFontWeight;
  final String? prefixText;
  final ValueState<String>? prefixTextState;
  final bool? prefixTextAllCaps;
  final Color? prefixTextColor;
  final ValueState<Color>? prefixTextColorState;
  final TextDecoration? prefixTextDecoration;
  final Color? prefixTextDecorationColor;
  final TextDecorationStyle? prefixTextDecorationStyle;
  final double? prefixTextDecorationThickness;
  final double? prefixTextLetterSpace;
  final double? prefixTextSize;
  final TextStyle? prefixTextStyle;
  final bool? prefixTextVisible;
  final OnViewClickListener? onPrefixClick;

  ///SUFFIX
  final FontStyle? suffixFontStyle;
  final FontWeight? suffixFontWeight;
  final String? suffixText;
  final ValueState<String>? suffixTextState;
  final bool? suffixTextAllCaps;
  final Color? suffixTextColor;
  final ValueState<Color>? suffixTextColorState;
  final TextDecoration? suffixTextDecoration;
  final Color? suffixTextDecorationColor;
  final TextDecorationStyle? suffixTextDecorationStyle;
  final double? suffixTextDecorationThickness;
  final double? suffixTextLetterSpace;
  final double? suffixTextSize;
  final TextStyle? suffixTextStyle;
  final bool? suffixTextVisible;
  final OnViewClickListener? onSuffixClick;

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
    this.ellipsis,
    this.fontFamily,
    this.fontStyle,
    this.fontWeight,
    this.letterSpacing,
    this.lineSpacingExtra,
    this.locale,
    this.maxCharacters,
    this.maxLines,
    this.selectionColor,
    this.semanticsLabel,
    this.softWrap,
    this.strutStyle,
    this.wordSpacing,
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
    this.textHeightBehavior,
    this.textLeadingDistribution,
    this.textOverflow,
    this.textScaleFactor,
    this.textSize,
    this.textSpans,
    this.textStyle,
    this.textWidthBasis,

    ///PREFIX
    this.prefixFontStyle,
    this.prefixFontWeight,
    this.prefixText,
    this.prefixTextState,
    this.prefixTextAllCaps,
    this.prefixTextColor,
    this.prefixTextColorState,
    this.prefixTextDecoration,
    this.prefixTextDecorationColor,
    this.prefixTextDecorationStyle,
    this.prefixTextDecorationThickness,
    this.prefixTextLetterSpace,
    this.prefixTextSize,
    this.prefixTextStyle,
    this.prefixTextVisible,
    this.onPrefixClick,

    ///SUFFIX
    this.suffixText,
    this.suffixTextState,
    this.suffixTextAllCaps,
    this.suffixTextColor,
    this.suffixTextColorState,
    this.suffixTextDecoration,
    this.suffixTextDecorationColor,
    this.suffixTextDecorationStyle,
    this.suffixTextDecorationThickness,
    this.suffixTextLetterSpace,
    this.suffixTextSize,
    this.suffixFontStyle,
    this.suffixTextVisible,
    this.suffixFontWeight,
    this.suffixTextStyle,
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
      fontFamily: controller.fontFamily,
      fontStyle: controller.fontStyle,
      fontWeight: controller.fontWeight,
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

class TextViewController extends ViewController {
  int maxCharacters = 0;
  int? maxLines;
  Color? selectionColor;
  String? semanticsLabel;
  bool? softWrap;
  StrutStyle? strutStyle;

  double? letterSpacing;
  double lineSpacingExtra = 0;
  Locale? locale;
  double? wordSpacing;

  String? ellipsis;
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
  TextHeightBehavior? textHeightBehavior;
  TextLeadingDistribution? textLeadingDistribution;
  TextOverflow? textOverflow;
  double textScaleFactor = 1;
  double textSize = 14;
  List<TextSpan> textSpans = [];
  TextStyle textStyle = const TextStyle();
  TextWidthBasis textWidthBasis = TextWidthBasis.parent;

  ///PREFIX
  FontStyle? prefixFontStyle;
  FontWeight? prefixFontWeight;
  String? _prefixText;
  ValueState<String>? prefixTextState;
  bool prefixTextAllCaps = false;
  Color? _prefixTextColor;
  ValueState<Color>? prefixTextColorState;
  TextDecoration? prefixTextDecoration;
  Color? prefixTextDecorationColor;
  TextDecorationStyle? prefixTextDecorationStyle;
  double? prefixTextDecorationThickness;
  double? prefixTextLetterSpace;
  double? prefixTextSize;
  TextStyle prefixTextStyle = const TextStyle();
  bool prefixTextVisible = true;
  OnViewClickListener? _onPrefixClick;

  /// SUFFIX
  FontStyle? suffixFontStyle;
  FontWeight? suffixFontWeight;
  String? _suffixText;
  ValueState<String>? suffixTextState;
  bool suffixTextAllCaps = false;
  Color? _suffixTextColor;
  ValueState<Color>? suffixTextColorState;
  TextDecoration? suffixTextDecoration;
  Color? suffixTextDecorationColor;
  TextDecorationStyle? suffixTextDecorationStyle;
  double? suffixTextDecorationThickness;
  double? suffixTextLetterSpace;
  double? suffixTextSize;
  TextStyle suffixTextStyle = const TextStyle();
  bool suffixTextVisible = true;
  OnViewClickListener? _onSuffixClick;

  TextViewController fromTextView(TextView view) {
    super.fromView(view);

    ellipsis = view.ellipsis;
    fontFamily = view.fontFamily;
    fontStyle = view.fontStyle;
    fontWeight = view.fontWeight;

    maxCharacters = view.maxCharacters ?? 0;
    maxLines = view.maxLines;
    locale = view.locale;

    letterSpacing = view.letterSpacing;
    lineSpacingExtra = view.lineSpacingExtra ?? 0;
    selectionColor = view.selectionColor;
    semanticsLabel = view.semanticsLabel;
    softWrap = view.softWrap;
    textScaleFactor = view.textScaleFactor ?? 1;
    strutStyle = view.strutStyle;
    wordSpacing = view.wordSpacing;

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
    textHeightBehavior = view.textHeightBehavior;
    textLeadingDistribution = view.textLeadingDistribution;
    textOverflow = view.textOverflow;
    textSize = view.textSize ?? 14;
    textSpans = view.textSpans ?? [];
    textStyle = view.textStyle ?? const TextStyle();
    textWidthBasis = view.textWidthBasis ?? TextWidthBasis.parent;

    ///PREFIX
    prefixFontStyle = view.prefixFontStyle;
    prefixFontWeight = view.prefixFontWeight;
    prefixText = view.prefixText;
    prefixTextState = view.prefixTextState;
    prefixTextAllCaps = view.prefixTextAllCaps ?? false;
    prefixTextColor = view.prefixTextColor;
    prefixTextColorState = view.prefixTextColorState;
    prefixTextDecoration = view.prefixTextDecoration;
    prefixTextDecorationColor = view.prefixTextDecorationColor;
    prefixTextDecorationStyle = view.prefixTextDecorationStyle;
    prefixTextDecorationThickness = view.prefixTextDecorationThickness;
    prefixTextLetterSpace = view.prefixTextLetterSpace;
    prefixTextSize = view.prefixTextSize;
    prefixTextStyle = view.prefixTextStyle ?? const TextStyle();
    prefixTextVisible = view.prefixTextVisible ?? true;
    onPrefixClick = view.onPrefixClick;

    ///SUFFIX
    suffixFontStyle = view.suffixFontStyle;
    suffixFontWeight = view.suffixFontWeight;
    suffixText = view.suffixText;
    suffixTextState = view.suffixTextState;
    suffixTextAllCaps = view.suffixTextAllCaps ?? false;
    suffixTextColor = view.suffixTextColor;
    suffixTextColorState = view.suffixTextColorState;
    suffixTextDecoration = view.suffixTextDecoration;
    suffixTextDecorationColor = view.suffixTextDecorationColor;
    suffixTextDecorationStyle = view.suffixTextDecorationStyle;
    suffixTextDecorationThickness = view.suffixTextDecorationThickness;
    suffixTextLetterSpace = view.suffixTextLetterSpace;
    suffixTextSize = view.suffixTextSize;
    suffixTextStyle = view.suffixTextStyle ?? const TextStyle();
    suffixTextVisible = view.suffixTextVisible ?? true;
    onSuffixClick = view.onSuffixClick;

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

  /// PREFIX

  set prefixText(String? value) => _prefixText = value;

  String? get prefixText {
    final value = prefixTextState?.activated(activated, enabled) ?? _prefixText;
    return prefixTextAllCaps ? value?.toUpperCase() : value;
  }

  set prefixTextColor(Color? value) => _prefixTextColor = value;

  Color? get prefixTextColor {
    return prefixTextColorState?.activated(activated, enabled) ??
        _prefixTextColor;
  }

  bool get isAutoPrefix {
    final a = maxCharacters > 0;
    final b = text.length > maxCharacters;
    return (a && b) || prefixTextVisible;
  }

  OnViewClickListener? get onPrefixClick => enabled ? _onPrefixClick : null;

  set onPrefixClick(OnViewClickListener? listener) =>
      _onPrefixClick ??= listener;

  void setPrefixFontStyle(FontStyle? value) {
    prefixFontStyle = value;
    _notify;
  }

  void setPrefixFontWeight(FontWeight value) {
    prefixFontWeight = value;
    _notify;
  }

  void setPrefixLetterSpace(double? value) {
    prefixTextLetterSpace = value;
    _notify;
  }

  void setPrefixText(String? value) {
    prefixText = value;
    _notify;
  }

  void setPrefixTextState(ValueState<String>? value) {
    prefixTextState = value;
    _notify;
  }

  void setPrefixTextColor(Color? value) {
    prefixTextColor = value;
    _notify;
  }

  void setPrefixTextColorState(ValueState<Color>? value) {
    prefixTextColorState = value;
    _notify;
  }

  void setPrefixTextDecoration(TextDecoration? value) {
    prefixTextDecoration = value;
    _notify;
  }

  void setPrefixTextDecorationColor(Color? value) {
    prefixTextDecorationColor = value;
    _notify;
  }

  void setPrefixTextDecorationStyle(TextDecorationStyle? value) {
    prefixTextDecorationStyle = value;
    _notify;
  }

  void setPrefixTextDecorationThickness(double? value) {
    prefixTextDecorationThickness = value;
    _notify;
  }

  void setPrefixTextSize(double? value) {
    prefixTextSize = value;
    _notify;
  }

  void setPrefixTextStyle(TextStyle value) {
    prefixTextStyle = value;
    _notify;
  }

  void setPrefixVisibility(bool value) {
    prefixTextVisible = value;
    _notify;
  }

  void setOnPrefixClickListener(OnViewClickListener listener) {
    _onPrefixClick = listener;
  }

  ///SUFFIX

  set suffixText(String? value) => _suffixText = value;

  String? get suffixText {
    final value = suffixTextState?.activated(activated, enabled) ?? _suffixText;
    return suffixTextAllCaps ? value?.toUpperCase() : value;
  }

  set suffixTextColor(Color? value) => _suffixTextColor = value;

  Color? get suffixTextColor {
    return suffixTextColorState?.activated(activated, enabled) ??
        _suffixTextColor;
  }

  bool get isAutoSuffix {
    final a = maxCharacters > 0;
    final b = text.length > maxCharacters;
    return (a && b) || suffixTextVisible;
  }

  OnViewClickListener? get onSuffixClick => enabled ? _onSuffixClick : null;

  set onSuffixClick(OnViewClickListener? listener) =>
      _onSuffixClick ??= listener;

  void setSuffixFontStyle(FontStyle? value) {
    suffixFontStyle = value;
    _notify;
  }

  void setSuffixFontWeight(FontWeight value) {
    suffixFontWeight = value;
    _notify;
  }

  void setSuffixLetterSpace(double? value) {
    suffixTextLetterSpace = value;
    _notify;
  }

  void setSuffixText(String? value) {
    suffixText = value;
    _notify;
  }

  void setSuffixTextState(ValueState<String>? value) {
    suffixTextState = value;
    _notify;
  }

  void setSuffixTextColor(Color? value) {
    suffixTextColor = value;
    _notify;
  }

  void setSuffixTextColorState(ValueState<Color>? value) {
    suffixTextColorState = value;
    _notify;
  }

  void setSuffixTextDecoration(TextDecoration? value) {
    suffixTextDecoration = value;
    _notify;
  }

  void setSuffixTextDecorationColor(Color? value) {
    suffixTextDecorationColor = value;
    _notify;
  }

  void setSuffixTextDecorationStyle(TextDecorationStyle? value) {
    suffixTextDecorationStyle = value;
    _notify;
  }

  void setSuffixTextDecorationThickness(double? value) {
    suffixTextDecorationThickness = value;
    _notify;
  }

  void setSuffixTextSize(double? value) {
    suffixTextSize = value;
    _notify;
  }

  void setSuffixTextStyle(TextStyle value) {
    suffixTextStyle = value;
    _notify;
  }

  void setSuffixVisibility(bool value) {
    suffixTextVisible = value;
    _notify;
  }

  void setOnSuffixClickListener(OnViewClickListener listener) {
    _onSuffixClick = listener;
  }

  /// GENERAL

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
