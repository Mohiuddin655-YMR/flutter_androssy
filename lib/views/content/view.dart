import 'package:flutter/material.dart';

import '../view/view.dart';

part 'controller.dart';
part 'model.dart';
part 'style_content.dart';
part 'style_dot.dart';
part 'widget_dotted_text.dart';
part 'widget_dotted_texts.dart';
part 'widget_paragraph_text.dart';

class ContentView extends YMRView<ContentViewController> {
  final String? header;
  final String? description;
  final List<Content>? paragraphs;
  final ContentStyle? titleStyle;
  final ContentStyle? paragraphStyle;
  final DotStyle? dotStyle;

  const ContentView({
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
    super.child,
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
