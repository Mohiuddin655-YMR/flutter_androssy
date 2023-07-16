part of '../widgets.dart';

class Content {
  final String? title;
  final String? body;

  Content({
    this.title,
    this.body,
  });
}

class ContentStyle {
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final Color textColor;
  final double textSize;

  const ContentStyle({
    this.fontWeight,
    this.textAlign,
    this.textColor = Colors.black,
    this.textSize = 14,
  });

  ContentStyle copy({
    FontWeight? fontWeight,
    TextAlign? textAlign,
    Color? textColor,
    double? textSize,
  }) {
    return ContentStyle(
      fontWeight: fontWeight ?? this.fontWeight,
      textAlign: textAlign ?? this.textAlign,
      textColor: textColor ?? this.textColor,
      textSize: textSize ?? this.textSize,
    );
  }
}

class ContentView extends YMRView<ContentViewController> {
  final String? header;
  final String? description;
  final List<Content>? paragraphs;
  final ContentStyle? titleStyle;
  final ContentStyle? paragraphStyle;
  final DotStyle? dotStyle;

  const ContentView({
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
    super.scrollable = true,
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
    this.header,
    this.description,
    this.dotStyle,
    this.paragraphs,
    this.titleStyle,
    this.paragraphStyle,
  });

  @override
  void init(ContentViewController controller) {}

  @override
  ContentViewController initController() {
    return ContentViewController();
  }

  @override
  ContentViewController attachController(ContentViewController controller) {
    return controller.fromContentView(this);
  }

  @override
  Widget? attach(BuildContext context, ContentViewController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if ((controller.description ?? "").isNotEmpty)
          _ParagraphText(
            content: Content(
              title: controller.header,
              body: controller.description,
            ),
            controller: controller,
            showDot: false,
          ),
        if (controller.paragraphs.isNotEmpty)
          _DottedTexts(controller: controller),
      ],
    );
  }
}

class _DottedText extends StatelessWidget {
  final ContentViewController controller;
  final String? text;
  final bool isParagraph;
  final bool showDot;

  const _DottedText({
    Key? key,
    this.isParagraph = false,
    this.showDot = true,
    required this.text,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var style = isParagraph ? controller.paragraphStyle : controller.titleStyle;
    final bulletSize = style.textSize / 2;
    final bulletPadding = (style.textSize * 0.18) + bulletSize / 2;
    return (text ?? "").isNotEmpty
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (showDot)
                Container(
                  alignment: Alignment.center,
                  width: bulletSize,
                  height: bulletSize,
                  margin: EdgeInsets.only(
                    right: bulletPadding * 1.5,
                    top: bulletPadding,
                  ),
                  decoration: BoxDecoration(
                    color: style.textColor,
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              Expanded(
                child: Text(
                  text ?? "",
                  textAlign: style.textAlign,
                  style: TextStyle(
                    color: style.textColor,
                    fontSize: style.textSize,
                    fontWeight: style.fontWeight,
                  ),
                ),
              ),
            ],
          )
        : const SizedBox();
  }
}

class _DottedTexts extends StatelessWidget {
  final ContentViewController controller;

  const _DottedTexts({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: controller.paragraphs.map((e) {
        return _ParagraphText(
          controller: controller,
          content: e,
        );
      }).toList(),
    );
  }
}

class _ParagraphText extends StatelessWidget {
  final ContentViewController controller;
  final Content content;
  final bool showDot;

  const _ParagraphText({
    Key? key,
    required this.content,
    required this.controller,
    this.showDot = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var titleStyle = controller.titleStyle;
    var paragraphStyle = controller.paragraphStyle;
    var isParagraphMode = (content.title ?? "").isEmpty;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          _DottedText(
            controller: controller,
            isParagraph: isParagraphMode,
            showDot: showDot,
            text: isParagraphMode ? content.body : content.title,
          ),
          if (!isParagraphMode)
            Container(
              padding: EdgeInsets.only(
                top: paragraphStyle.textSize / 2,
                left: showDot ? titleStyle.textSize * 1.2 : 0,
              ),
              child: Text(
                content.body ?? "",
                textAlign: paragraphStyle.textAlign,
                style: TextStyle(
                  color: paragraphStyle.textColor,
                  fontSize: paragraphStyle.textSize,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class ContentViewController extends ViewController {
  String? header;
  String? description;
  DotStyle dotStyle = DotStyle.bullet;
  List<Content> paragraphs = [];
  ContentStyle paragraphStyle = const ContentStyle();
  ContentStyle? _titleStyle;

  ContentViewController fromContentView(ContentView view) {
    super.fromView(view);
    header = view.header;
    description = view.description;
    dotStyle = view.dotStyle ?? DotStyle.bullet;
    paragraphs = view.paragraphs ?? [];
    paragraphStyle = view.paragraphStyle ?? const ContentStyle();
    _titleStyle = view.titleStyle;
    return this;
  }

  ContentStyle get titleStyle {
    return _titleStyle ??
        paragraphStyle.copy(
          fontWeight: FontWeight.bold,
        );
  }

  set titleStyle(ContentStyle value) => _titleStyle = value;
}

enum DotStyle {
  none,
  bullet,
}

extension DotExtension on DotStyle {
  bool get isBullet => this == DotStyle.bullet;
}
