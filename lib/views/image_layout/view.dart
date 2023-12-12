import 'package:flutter/material.dart';

import '../image/view.dart';
import '../view/view.dart';

part 'builder.dart';
part 'controller.dart';
part 'layer_type.dart';
part 'layer_x.dart';
part 'layer_x2.dart';
part 'layer_x3.dart';
part 'layer_x4.dart';
part 'layer_x5.dart';
part 'layer_x6.dart';
part 'layer_xn.dart';
part 'typedefs.dart';

class ImageLayout<T> extends YMRView<ImageLayoutController<T>> {
  final double? frameRatio;
  final ImageLayoutFrameRatioBuilder? frameRatioBuilder;
  final Color? itemBackground;
  final double? itemSpace;
  final ImageType? itemType;
  final List<T>? items;
  final dynamic placeholder;
  final ImageType? placeholderType;

  const ImageLayout({
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
    this.frameRatio,
    this.frameRatioBuilder,
    this.itemBackground,
    this.itemSpace,
    this.itemType,
    this.items,
    this.placeholder,
    this.placeholderType,
  });

  @override
  ImageLayoutController<T> initController() {
    return ImageLayoutController<T>();
  }

  @override
  ImageLayoutController<T> attachController(
    ImageLayoutController<T> controller,
  ) {
    return controller.fromView(
      this,
      frameRatio: frameRatio,
      frameBuilder: frameRatioBuilder,
      itemBackground: itemBackground,
      itemSpace: itemSpace,
      itemType: itemType,
      items: items,
      placeholder: placeholder,
      placeholderType: placeholderType,
    );
  }

  @override
  Widget? attach(
    BuildContext context,
    ImageLayoutController<T> controller,
  ) {
    switch (controller.layer) {
      case ImageLayoutLayers.x:
        return _LayerX<T>(controller: controller);
      case ImageLayoutLayers.x2:
        return _LayerX2<T>(controller: controller);
      case ImageLayoutLayers.x3:
        return _LayerX3<T>(controller: controller);
      case ImageLayoutLayers.x4:
        return _LayerX4<T>(controller: controller);
      case ImageLayoutLayers.x5:
        return _LayerX5<T>(controller: controller);
      case ImageLayoutLayers.x6:
        return _LayerX6<T>(controller: controller);
      case ImageLayoutLayers.xn:
        return _LayerXn<T>(controller: controller);
    }
  }
}
