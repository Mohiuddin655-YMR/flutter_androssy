import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_androssy/core.dart';

import 'gesture.dart';
import 'render.dart';

class AndrossyView extends StatelessWidget {
  final bool visible;
  final bool scrollable;
  final ScrollController? scrollController;
  final ViewScrollingType scrollingType;
  final Axis orientation;
  final EdgeInsets padding;

  final ImageFilter? backdropFilter;
  final BlendMode? backdropMode;

  final ViewRoots roots;
  final bool isCircular;
  final bool isBorderRadius;
  final bool isMargin;
  final bool isConstraints;

  final BorderRadius? borderRadius;

  final bool animationEnabled;
  final int animation;
  final Curve animationType;

  final Alignment? gravity;

  final Clip clipBehavior;
  final double? width;
  final double? height;
  final Matrix4? transform;
  final AlignmentGeometry? transformGravity;
  final double widthMax;
  final double widthMin;
  final double heightMax;
  final double heightMin;
  final BlendMode? backgroundBlendMode;
  final BlendMode? foregroundBlendMode;
  final bool isBorder;
  final BoxBorder? boxBorder;

  final Widget? Function(BuildContext _) attach;
  final Widget Function(BuildContext _, Widget ___) builder;
  final Widget Function(BuildContext _, Widget ___) root;

  final Color? background;
  final Gradient? backgroundGradient;
  final DecorationImage? backgroundImage;
  final List<BoxShadow>? shadows;

  final Color? foreground;
  final Gradient? foregroundGradient;
  final DecorationImage? foregroundImage;

  final EdgeInsets margin;
  final bool isPadding;
  final bool isScrollable;
  final bool isOpacity;
  final double opacity;
  final bool opacityAlwaysIncludeSemantics;

  final dynamic Function(Size)? onNotifyWrapper;

  final bool absorbMode;
  final bool isClickMode;

  final bool isDimensional;
  final double dimensionRatio;

  final bool isFlexible;
  final int flex;

  final bool isPositional;
  final ViewPosition position;

  // LISTENERS
  final double elevation;
  final double maxSize;

  final bool isInkWellMode;
  final Color? rippleColor;
  final Color? hoverColor;
  final Color? pressedColor;

  final ViewClickEffect? clickEffect;
  final OnViewClickListener? onClick;
  final OnViewClickListener? onDoubleClick;
  final OnViewClickListener? onLongClick;
  final void Function(bool status)? onNotifyHover;
  final void Function()? onNotifyToggle;

  const AndrossyView({
    super.key,
    required this.visible,
    required this.scrollable,
    required this.scrollController,
    required this.scrollingType,
    required this.orientation,
    required this.padding,
    required this.backdropFilter,
    required this.backdropMode,
    required this.roots,
    required this.isCircular,
    required this.isBorderRadius,
    required this.isMargin,
    required this.isConstraints,
    required this.borderRadius,
    required this.animationEnabled,
    required this.animation,
    required this.animationType,
    required this.gravity,
    required this.clipBehavior,
    required this.width,
    required this.height,
    required this.transform,
    required this.transformGravity,
    required this.widthMax,
    required this.widthMin,
    required this.heightMax,
    required this.heightMin,
    required this.backgroundBlendMode,
    required this.foregroundBlendMode,
    required this.isBorder,
    required this.boxBorder,
    required this.attach,
    required this.builder,
    required this.root,
    required this.background,
    required this.backgroundGradient,
    required this.backgroundImage,
    required this.shadows,
    required this.foreground,
    required this.foregroundGradient,
    required this.foregroundImage,
    required this.margin,
    required this.isPadding,
    required this.isScrollable,
    required this.isOpacity,
    required this.opacity,
    required this.opacityAlwaysIncludeSemantics,
    required this.onNotifyWrapper,
    required this.absorbMode,
    required this.isClickMode,
    required this.isDimensional,
    required this.dimensionRatio,
    required this.isFlexible,
    required this.flex,
    required this.isPositional,
    required this.position,
    required this.elevation,
    required this.maxSize,
    required this.isInkWellMode,
    required this.rippleColor,
    required this.hoverColor,
    required this.pressedColor,
    required this.clickEffect,
    required this.onClick,
    required this.onDoubleClick,
    required this.onLongClick,
    required this.onNotifyHover,
    required this.onNotifyToggle,
  });

  @override
  Widget build(BuildContext context) {
    /// INITIAL
    Widget child = const SizedBox();

    /// VISIBILITY
    if (visible) {
      /// ATTACH
      child = attach(context) ?? child;

      /// SCROLLER
      if (scrollable) {
        child = SingleChildScrollView(
          controller: scrollController,
          physics: scrollingType.physics,
          scrollDirection: orientation,
          padding: padding,
          child: child,
        );
      }

      /// BACKDROP FILTER
      if (backdropFilter != null) {
        child = BackdropFilter(
          filter: backdropFilter ?? ImageFilter.blur(),
          blendMode: backdropMode ?? BlendMode.srcOver,
          child: child,
        );
      }

      /// STYLES
      if (roots.view) {
        final root = roots;
        final isCircular = this.isCircular;
        final isRadius = isBorderRadius;
        final isRippleMode = isInkWellMode;
        final isMargin = this.isMargin;
        final isConstraints = this.isConstraints;

        final borderRadius =
            !isRippleMode && isRadius && !isCircular ? this.borderRadius : null;

        if (animationEnabled) {
          child = AnimatedContainer(
            duration: Duration(milliseconds: animation),
            curve: animationType,
            alignment: gravity,
            clipBehavior:
                root.decoration && !isRippleMode ? clipBehavior : Clip.none,
            width: width,
            height: height,
            transform: transform,
            transformAlignment: transformGravity,
            constraints: isConstraints
                ? BoxConstraints(
                    maxWidth: widthMax,
                    minWidth: widthMin,
                    maxHeight: heightMax,
                    minHeight: heightMin,
                  )
                : null,
            decoration: root.decoration
                ? BoxDecoration(
                    backgroundBlendMode: backgroundBlendMode,
                    border: isBorder ? boxBorder : null,
                    borderRadius: isCircular ? null : borderRadius,
                    color: root.background && !isRippleMode ? background : null,
                    gradient: backgroundGradient,
                    image: backgroundImage,
                    boxShadow: shadows,
                    shape: isCircular ? BoxShape.circle : BoxShape.rectangle,
                  )
                : null,
            foregroundDecoration: root.decoration
                ? BoxDecoration(
                    backgroundBlendMode: foregroundBlendMode,
                    borderRadius: borderRadius,
                    color: foreground,
                    gradient: foregroundGradient,
                    image: foregroundImage,
                    shape: isCircular ? BoxShape.circle : BoxShape.rectangle,
                  )
                : null,
            margin: isMargin && !isRippleMode ? margin : null,
            padding: isPadding && !isScrollable ? padding : null,
            child: child,
          );
        } else {
          child = Container(
            alignment: gravity,
            clipBehavior:
                root.decoration && !isRippleMode ? clipBehavior : Clip.none,
            width: width,
            height: height,
            transform: transform,
            transformAlignment: transformGravity,
            constraints: isConstraints
                ? BoxConstraints(
                    maxWidth: widthMax,
                    minWidth: widthMin,
                    maxHeight: heightMax,
                    minHeight: heightMin,
                  )
                : null,
            decoration: root.decoration
                ? BoxDecoration(
                    backgroundBlendMode: backgroundBlendMode,
                    border: isBorder ? boxBorder : null,
                    borderRadius: isCircular ? null : borderRadius,
                    color: root.background && !isRippleMode ? background : null,
                    gradient: backgroundGradient,
                    image: backgroundImage,
                    boxShadow: shadows,
                    shape: isCircular ? BoxShape.circle : BoxShape.rectangle,
                  )
                : null,
            foregroundDecoration: root.decoration
                ? BoxDecoration(
                    backgroundBlendMode: foregroundBlendMode,
                    borderRadius: borderRadius,
                    color: foreground,
                    gradient: foregroundGradient,
                    image: foregroundImage,
                    shape: isCircular ? BoxShape.circle : BoxShape.rectangle,
                  )
                : null,
            margin: isMargin && !isRippleMode ? margin : null,
            padding: isPadding && !isScrollable ? padding : null,
            child: child,
          );
        }
      }

      /// BUILDER
      child = builder(context, child);

      /// OPACITY
      if (isOpacity) {
        child = Opacity(
          opacity: opacity,
          alwaysIncludeSemantics: opacityAlwaysIncludeSemantics,
          child: child,
        );
      }

      /// WRAPPER
      if (onNotifyWrapper != null) {
        child = AndrossyRender(
          render: onNotifyWrapper!,
          child: child,
        );
      }

      /// ABSORBER
      if (absorbMode) {
        child = AbsorbPointer(child: child);
      }

      /// CALLBACKS
      if (isClickMode) {
        child = AndrossyGesture(
          margin: isMargin ? margin : null,
          elevation: elevation,
          clipBehavior: clipBehavior,
          isInkWellMode: isInkWellMode,
          onClick: onClick,
          onDoubleClick: onDoubleClick,
          onLongClick: onLongClick,
          onNotifyHover: onNotifyHover,
          onNotifyToggle: onNotifyToggle,
          child: child,
        );
      }

      /// DIMENSION
      if (isDimensional) {
        child = AspectRatio(
          aspectRatio: dimensionRatio,
          child: child,
        );
      }

      /// EXPENDABLE
      if (isFlexible) {
        child = Expanded(
          flex: flex,
          child: child,
        );
      }

      /// POSITION
      if (isPositional) {
        child = Positioned(
          top: position.top,
          bottom: position.bottom,
          left: position.left,
          right: position.right,
          child: child,
        );
      }

      /// ROOT (FINAL)
      child = root(context, child);
    }
    return child;
  }
}
