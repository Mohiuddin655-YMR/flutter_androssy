import 'package:flutter/material.dart';
import 'package:flutter_androssy/extensions.dart';
import 'package:flutter_androssy/extensions/theme.dart';

import '../linear_layout/view.dart';
import '../text/view.dart';
import '../view/view.dart';

part 'alignment.dart';
part 'controller.dart';

class CheckmarkView extends TextView<CheckmarkViewController> {
  /// BASE PROPERTIES
  final CheckboxAlignment checkboxAlignment;
  final double spaceBetween;

  /// CHECK BOX PROPERTIES
  final Color? primary;
  final Color? activeColor;
  final Color? checkColor;
  final Color? fillColor;
  final ValueState<Color>? fillColorState;
  final Color? checkFocusColor;
  final FocusNode? checkFocusNode;
  final Color? checkHoverColor;
  final bool checkAutofocus;
  final bool isError;
  final MaterialTapTargetSize materialTapTargetSize;
  final MouseCursor? mouseCursor;
  final double? splashRadius;
  final bool tristate;
  final VisualDensity? visualDensity;

  final double checkboxRadius;
  final Color? checkboxStrokeColor;
  final double checkboxStrokeSize;
  final int overlayOpacity;

  const CheckmarkView({
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

    /// TEXT PROPERTIES
    super.ellipsis,
    super.letterSpacing,
    super.lineSpacingExtra,
    super.locale,
    super.maxCharacters,
    super.maxLines,
    super.selectionColor,
    super.semanticsLabel,
    super.softWrap,
    super.strutStyle,
    super.wordSpacing,
    super.text,
    super.textState,
    super.textAlign,
    super.textAllCaps,
    super.textColor,
    super.textColorState,
    super.textDecoration,
    super.textDecorationColor,
    super.textDecorationStyle,
    super.textDecorationThickness,
    super.textDirection,
    super.textFontFamily,
    super.textFontStyle,
    super.textFontWeight,
    super.textFontWeightState,
    super.textHeightBehavior,
    super.textLeadingDistribution,
    super.textOverflow,
    super.textSize,
    super.textSizeState,
    super.textSpans,
    super.textStyle,
    super.textStyleState,
    super.textWidthBasis,

    /// BASE PROPERTIES
    this.spaceBetween = 8,
    this.checkboxAlignment = CheckboxAlignment.rightCenter,

    /// CHECK BOX PROPERTIES
    this.primary,
    this.activeColor,
    this.checkColor,
    this.fillColor,
    this.fillColorState,
    this.checkFocusColor,
    this.checkFocusNode,
    this.checkHoverColor,
    this.checkAutofocus = false,
    this.isError = false,
    this.materialTapTargetSize = MaterialTapTargetSize.shrinkWrap,
    this.mouseCursor,
    this.splashRadius,
    this.tristate = false,
    this.visualDensity,
    this.checkboxRadius = 4,
    this.checkboxStrokeColor,
    this.checkboxStrokeSize = 2,
    this.overlayOpacity = 20,
    bool checked = false,
  }) : super(activated: checked);

  @override
  CheckmarkViewController initController() {
    return CheckmarkViewController();
  }

  @override
  CheckmarkViewController attachController(CheckmarkViewController controller) {
    return controller.fromCheckmarkView(this);
  }

  @override
  Widget? attach(BuildContext context, CheckmarkViewController controller) {
    Widget child = Checkbox.adaptive(
      activeColor: controller.activeColor,
      autofocus: controller.checkAutofocus,
      checkColor: controller.checkColor,
      fillColor: controller.fillColorProperty,
      focusColor: controller.checkFocusColor,
      focusNode: controller.checkFocusNode,
      hoverColor: controller.checkHoverColor,
      isError: controller.isError,
      materialTapTargetSize: controller.materialTapTargetSize,
      mouseCursor: controller.mouseCursor,
      overlayColor: controller.overlayColor,
      shape: controller.checkboxShape,
      side: controller.borderSide,
      splashRadius: controller.splashRadius,
      tristate: controller.tristate,
      value: controller.activated,
      visualDensity: controller.visualDensity,
      onChanged: (value) => controller.onNotifyToggleWithActivator(),
    );

    return LinearLayout(
      width: double.infinity,
      orientation: Axis.horizontal,
      crossGravity: controller.checkboxAlignment.isTopMode
          ? CrossAxisAlignment.start
          : controller.checkboxAlignment.isBottomMode
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.center,
      children: [
        if (controller._isStart) child,
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              left: controller._isStart ? controller.spaceBetween : 0,
              right: !controller._isStart ? controller.spaceBetween : 0,
            ),
            child: super.attach(context, controller)!,
          ),
        ),
        if (!controller._isStart) child,
      ],
    );
  }
}
