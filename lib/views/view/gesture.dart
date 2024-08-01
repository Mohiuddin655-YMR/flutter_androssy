import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../utils/view_listener_effect.dart';

typedef OnAndrossyGestureClickListener = void Function(BuildContext context);

typedef OnClickEffectBuilder = Widget Function(
  BuildContext context,
  double value,
  Widget child,
);

class AndrossyGesture extends StatelessWidget {
  final EdgeInsets? margin;

  final double elevation;
  final BorderRadius? borderRadius;
  final Color? background;
  final Clip clipBehavior;

  // LISTENERS
  final bool isInkWellMode;

  final Color? highlightColor;
  final Color? hoverColor;
  final Color? splashColor;

  final ViewClickEffect? clickEffect;
  final OnAndrossyGestureClickListener? onClick;
  final OnAndrossyGestureClickListener? onDoubleClick;
  final OnAndrossyGestureClickListener? onLongClick;
  final void Function(bool status)? onNotifyHover;
  final void Function()? onNotifyToggle;

  final Widget child;

  const AndrossyGesture({
    super.key,
    this.margin,
    this.elevation = 0,
    this.borderRadius,
    this.background,
    this.clipBehavior = Clip.antiAlias,
    this.isInkWellMode = false,
    this.splashColor,
    this.hoverColor,
    this.highlightColor,
    this.clickEffect,
    this.onClick,
    this.onDoubleClick,
    this.onLongClick,
    this.onNotifyHover,
    this.onNotifyToggle,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    Widget child = this.child;
    if (isInkWellMode) {
      child = Material(
        elevation: elevation,
        borderRadius: borderRadius,
        color: background,
        clipBehavior: clipBehavior,
        child: _Listener(
          isInkWellMode: isInkWellMode,
          rippleColor: splashColor,
          hoverColor: hoverColor,
          pressedColor: highlightColor,
          clickEffect: clickEffect,
          onClick: isClickable ? _onClick : null,
          onDoubleClick: onDoubleClick,
          onLongClick: onLongClick,
          onNotifyHover: onNotifyHover,
          child: child,
        ),
      );
      if (margin != null) {
        child = Padding(padding: margin!, child: child);
      }
    } else {
      child = _Listener(
        isInkWellMode: isInkWellMode,
        rippleColor: splashColor,
        hoverColor: hoverColor,
        pressedColor: highlightColor,
        clickEffect: clickEffect,
        onClick: isClickable ? _onClick : null,
        onDoubleClick: onDoubleClick,
        onLongClick: onLongClick,
        onNotifyHover: onNotifyHover,
        child: child,
      );
    }
    if (kIsWeb) {
      return RepaintBoundary(
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: child,
        ),
      );
    } else {
      return child;
    }
  }

  bool get isClickable {
    return onNotifyToggle != null || onClick != null;
  }

  void _onClick(BuildContext context) {
    if (isClickable) {
      if (onNotifyToggle != null) {
        onNotifyToggle!();
      } else {
        onClick!(context);
      }
    }
  }
}

class _Listener extends StatefulWidget {
  final bool isInkWellMode;
  final Color? rippleColor;
  final Color? hoverColor;
  final Color? pressedColor;
  final Widget child;
  final ViewClickEffect? clickEffect;
  final OnAndrossyGestureClickListener? onClick;
  final OnAndrossyGestureClickListener? onDoubleClick;
  final OnAndrossyGestureClickListener? onLongClick;
  final void Function(bool status)? onNotifyHover;

  const _Listener({
    this.isInkWellMode = false,
    this.rippleColor,
    this.hoverColor,
    this.pressedColor,
    this.clickEffect,
    this.onClick,
    this.onDoubleClick,
    this.onLongClick,
    this.onNotifyHover,
    required this.child,
  });

  @override
  State<_Listener> createState() => _ListenerState();
}

class _ListenerState extends State<_Listener>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;

  ViewClickEffect get _effect {
    return widget.clickEffect ?? const ViewClickEffect.none();
  }

  @override
  void initState() {
    if (!_effect.effect.isNone) {
      _controller = AnimationController(
        vsync: this,
        animationBehavior: _effect.behavior,
        duration: _effect.duration,
        reverseDuration: _effect.reverseDuration,
        value: _effect.value,
        upperBound: _effect.upperBound,
        lowerBound: _effect.lowerBound,
      );
      _animation = CurvedAnimation(
        parent: _controller!,
        curve: _effect.curve,
        reverseCurve: _effect.reverseCurve ?? _effect.curve,
      );
    }
    super.initState();
  }

  @override
  void dispose() {
    if (_controller != null) _controller!.dispose();
    super.dispose();
  }

  void _onClick() async {
    if (widget.onClick != null) widget.onClick!(context);
    if (_controller != null) {
      _controller!.reverse().whenComplete(_controller!.forward);
    }
  }

  void _onDClick() {
    if (widget.onDoubleClick != null) widget.onDoubleClick!(context);
    if (_controller != null) {
      _controller!.reverse().whenComplete(_controller!.forward);
    }
  }

  void _onLClick() {
    if (widget.onLongClick != null) widget.onLongClick!(context);
    if (_controller != null) {
      _controller!.reverse().whenComplete(_controller!.forward);
    }
  }

  void _onHover(bool value) async {
    if (widget.onNotifyHover != null) widget.onNotifyHover!(value);
    if (_controller != null) {
      if (value) {
        _controller!.reverse();
      } else {
        _controller!.forward();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isInkWellMode) {
      return InkWell(
        splashColor: widget.rippleColor,
        hoverColor: widget.hoverColor,
        highlightColor: widget.pressedColor,
        onTap: widget.onClick != null ? _onClick : null,
        onDoubleTap: widget.onDoubleClick != null ? _onDClick : null,
        onLongPress: widget.onLongClick != null ? _onLClick : null,
        onHover: widget.onNotifyHover != null ? _onHover : null,
        child: _Effect(
          effect: _effect,
          value: _animation,
          child: widget.child,
        ),
      );
    } else {
      return GestureDetector(
        onTap: widget.onClick != null ? _onClick : null,
        onDoubleTap: widget.onDoubleClick != null ? _onDClick : null,
        onLongPress: widget.onLongClick != null ? _onLClick : null,
        child: _Effect(
          effect: _effect,
          value: _animation,
          child: widget.child,
        ),
      );
    }
  }
}

class _Effect extends StatelessWidget {
  final ViewClickEffect effect;
  final Animation<double>? value;
  final Widget child;

  const _Effect({
    required this.effect,
    required this.value,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    Widget child = this.child;
    if (value != null) {
      if (effect.effect.isBounce) {
        child = ScaleTransition(scale: value!, child: child);
      } else if (effect.effect.isCustom) {
        child = AnimatedBuilder(
          animation: value!,
          builder: (context, child) => effect.builder!(
            context,
            value!.value,
            child!,
          ),
          child: child,
        );
      }
    }
    return child;
  }
}

// enum ViewClickEffects {
//   none,
//   bounce,
//   custom;
//
//   bool get isNone => this == none;
//
//   bool get isBounce => this == bounce;
//
//   bool get isCustom => this == custom;
// }
//
// class ViewClickEffect {
//   final AnimationBehavior behavior;
//   final Curve curve;
//   final Curve? reverseCurve;
//   final Duration duration;
//   final Duration? reverseDuration;
//   final ViewClickEffects effect;
//   final double value;
//   final double lowerBound;
//   final double upperBound;
//   final OnClickEffectBuilder? builder;
//
//   const ViewClickEffect._({
//     this.behavior = AnimationBehavior.normal,
//     this.curve = Curves.linear,
//     this.reverseCurve,
//     this.duration = const Duration(milliseconds: 200),
//     this.reverseDuration,
//     this.effect = ViewClickEffects.none,
//     this.value = 1,
//     this.lowerBound = 0.0,
//     this.upperBound = 1.0,
//     this.builder,
//   });
//
//   const ViewClickEffect({
//     required OnClickEffectBuilder builder,
//     AnimationBehavior behavior = AnimationBehavior.normal,
//     Curve curve = Curves.linear,
//     Curve? reverseCurve,
//     Duration duration = const Duration(milliseconds: 200),
//     Duration? reverseDuration,
//     double value = 1.0,
//     double upperBound = 1.0,
//     double lowerBound = 0.5,
//   }) : this._(
//           effect: ViewClickEffects.custom,
//           behavior: behavior,
//           curve: curve,
//           reverseCurve: reverseCurve,
//           duration: duration,
//           reverseDuration: reverseDuration,
//           value: value,
//           upperBound: upperBound,
//           lowerBound: lowerBound,
//           builder: builder,
//         );
//
//   const ViewClickEffect.none() : this._();
//
//   const ViewClickEffect.bounce({
//     AnimationBehavior behavior = AnimationBehavior.normal,
//     Curve curve = Curves.linear,
//     Curve? reverseCurve,
//     Duration duration = const Duration(milliseconds: 200),
//     Duration? reverseDuration,
//     double value = 1.0,
//     double upperBound = 1.0,
//     double lowerBound = 0.95,
//   }) : this._(
//           effect: ViewClickEffects.bounce,
//           behavior: behavior,
//           curve: curve,
//           reverseCurve: reverseCurve,
//           duration: duration,
//           reverseDuration: reverseDuration,
//           value: value,
//           upperBound: upperBound,
//           lowerBound: lowerBound,
//         );
// }
