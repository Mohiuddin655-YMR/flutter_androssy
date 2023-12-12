import 'package:flutter/material.dart';
import 'package:flutter_androssy/extensions/size_extension.dart';
import 'package:flutter_androssy/extensions/theme.dart';

import '../icon/view.dart';
import '../view/view.dart';

class SwitchView extends YMRView<SwitchViewController> {
  final double size;

  final Color? activeThumbColor;
  final Color? inactiveThumbColor;
  final Color? activeThumbStrokeColor;
  final Color? inactiveThumbStrokeColor;
  final Color? activeTrackColor;
  final Color? inactiveTrackColor;
  final Color? activeTrackStrokeColor;
  final Color? inactiveTrackStrokeColor;

  final dynamic activeThumbIcon;
  final dynamic inactiveThumbIcon;
  final Color? activeThumbIconTint;
  final Color? inactiveThumbIconTint;

  final double? activeThumbSpacing;
  final double? inactiveThumbSpacing;
  final double? activeThumbStrokeSize;
  final double? inactiveThumbStrokeSize;

  final double? thumbIconSpacing;
  final int thumbWalkingTime;
  final double? trackBorderRadius;
  final double? trackStrokeSize;
  final double trackRatio;

  const SwitchView({
    super.key,
    super.enabled,
    this.size = 30,
    this.activeThumbColor,
    this.inactiveThumbColor,
    this.activeThumbStrokeColor,
    this.inactiveThumbStrokeColor,
    this.activeTrackColor,
    this.inactiveTrackColor,
    this.activeTrackStrokeColor,
    this.inactiveTrackStrokeColor,
    this.activeThumbIcon,
    this.inactiveThumbIcon,
    this.activeThumbIconTint,
    this.inactiveThumbIconTint,
    this.activeThumbSpacing,
    this.inactiveThumbSpacing,
    this.activeThumbStrokeSize,
    this.inactiveThumbStrokeSize,
    this.thumbIconSpacing,
    this.thumbWalkingTime = 200,
    this.trackBorderRadius,
    this.trackStrokeSize,
    this.trackRatio = 1.65,
    bool? value,
  }) : super(activated: value);

  @override
  SwitchViewController initController() {
    return SwitchViewController();
  }

  @override
  SwitchViewController attachController(controller) {
    return controller.fromSwitchView(this);
  }

  @override
  Widget? attach(context, controller) {
    return SwitchButton(
      activeThumbColor: activeThumbColor,
      activeThumbIcon: activeThumbIcon,
      activeThumbIconTint: activeThumbIconTint,
      activeThumbStrokeColor: activeThumbStrokeColor,
      activeThumbStrokeSize: activeThumbStrokeSize,
      activeThumbSpacing: activeThumbSpacing,
      activeTrackColor: activeTrackColor,
      activeTrackStrokeColor: activeTrackStrokeColor,
      inactiveThumbColor: inactiveThumbColor,
      inactiveThumbIcon: inactiveThumbIcon,
      inactiveThumbIconTint: inactiveThumbIconTint,
      inactiveThumbStrokeColor: inactiveThumbStrokeColor,
      inactiveThumbStrokeSize: inactiveThumbStrokeSize,
      inactiveThumbSpacing: inactiveThumbSpacing,
      inactiveTrackColor: inactiveTrackColor,
      inactiveTrackStrokeColor: inactiveTrackStrokeColor,
      enabled: controller.enabled,
      size: size,
      thumbIconSpacing: thumbIconSpacing,
      thumbWalkingTime: thumbWalkingTime,
      trackBorderRadius: trackBorderRadius,
      trackRatio: trackRatio,
      trackStrokeSize: trackStrokeSize,
      value: controller.activated,
    );
  }
}

class SwitchViewController extends ViewController {
  SwitchViewController fromSwitchView(SwitchView view) {
    super.fromView(view);
    return this;
  }
}

class SwitchButton extends StatefulWidget {
  final bool enabled;
  final bool value;
  final double size;

  final Color? activeThumbColor;
  final Color? inactiveThumbColor;
  final Color? activeThumbStrokeColor;
  final Color? inactiveThumbStrokeColor;
  final Color? activeTrackColor;
  final Color? inactiveTrackColor;
  final Color? activeTrackStrokeColor;
  final Color? inactiveTrackStrokeColor;

  final dynamic activeThumbIcon;
  final dynamic inactiveThumbIcon;
  final Color? activeThumbIconTint;
  final Color? inactiveThumbIconTint;

  final double? activeThumbSpacing;
  final double? inactiveThumbSpacing;
  final double? activeThumbStrokeSize;
  final double? inactiveThumbStrokeSize;

  final double? thumbIconSpacing;
  final int thumbWalkingTime;
  final double? trackBorderRadius;
  final double? trackStrokeSize;
  final double trackRatio;

  final SwitchButtonConfig config;
  final OnViewToggleListener? onToggle;

  const SwitchButton({
    super.key,
    this.config = const SwitchButtonConfig(),
    this.enabled = true,
    this.value = false,
    this.size = 30,
    this.activeThumbColor,
    this.inactiveThumbColor,
    this.activeThumbStrokeColor,
    this.inactiveThumbStrokeColor,
    this.activeTrackColor,
    this.inactiveTrackColor,
    this.activeTrackStrokeColor,
    this.inactiveTrackStrokeColor,
    this.activeThumbIcon,
    this.inactiveThumbIcon,
    this.activeThumbIconTint,
    this.inactiveThumbIconTint,
    this.activeThumbSpacing,
    this.inactiveThumbSpacing,
    this.activeThumbStrokeSize,
    this.inactiveThumbStrokeSize,
    this.thumbIconSpacing,
    this.thumbWalkingTime = 200,
    this.trackBorderRadius,
    this.trackStrokeSize,
    this.trackRatio = 1.65,
    this.onToggle,
  });

  @override
  State<SwitchButton> createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton>
    with SingleTickerProviderStateMixin {
  late Duration _duration;
  late final Animation _toggleAnimation;
  late final AnimationController _animationController;
  late SwitchButtonConfig I;

  SwitchButtonConfig configure() {
    return widget.config.copy(
      activeThumbColor: widget.activeThumbColor,
      activeThumbIcon: widget.activeThumbIcon,
      activeThumbIconTint: widget.activeThumbIconTint,
      activeThumbStrokeColor: widget.activeThumbStrokeColor,
      activeThumbStrokeSize: widget.activeThumbStrokeSize,
      activeThumbSpacing: widget.activeThumbSpacing,
      activeTrackColor: widget.activeTrackColor,
      activeTrackStrokeColor: widget.activeTrackStrokeColor,
      inactiveThumbColor: widget.inactiveThumbColor,
      inactiveThumbIcon: widget.inactiveThumbIcon,
      inactiveThumbIconTint: widget.inactiveThumbIconTint,
      inactiveThumbStrokeColor: widget.inactiveThumbStrokeColor,
      inactiveThumbStrokeSize: widget.inactiveThumbStrokeSize,
      inactiveThumbSpacing: widget.inactiveThumbSpacing,
      inactiveTrackColor: widget.inactiveTrackColor,
      inactiveTrackStrokeColor: widget.inactiveTrackStrokeColor,
      enabled: widget.enabled,
      size: widget.size,
      thumbIconSpacing: widget.thumbIconSpacing,
      thumbWalkingTime: widget.thumbWalkingTime,
      trackBorderRadius: widget.trackBorderRadius,
      trackRatio: widget.trackRatio,
      trackStrokeSize: widget.trackStrokeSize,
      value: widget.value,
    );
  }

  @override
  void initState() {
    super.initState();
    I = configure();
    _duration = Duration(milliseconds: I.thumbWalkingTime);
    _animationController = AnimationController(
      vsync: this,
      value: widget.value ? 1.0 : 0.0,
      duration: _duration,
    );
    _toggleAnimation = AlignmentTween(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.linear,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(SwitchButton oldWidget) {
    super.didUpdateWidget(oldWidget);

    I = configure();

    if (widget.value) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = SwitchTheme.of(context);

    var mAC = context.colorScheme.primary;
    var mIC = const Color(0xff697e8b);

    var active = widget.value;
    var size = I.size;

    var trackColor = ViewToggleContent(
      active:
          I.activeTrackColor ?? theme.trackColor(MaterialState.selected) ?? mAC,
      inactive:
          I.inactiveTrackColor ?? theme.trackColor.none ?? Colors.transparent,
    ).detect(active);

    var trackOutlineColor = ViewToggleContent(
      active: I.activeTrackStrokeColor ??
          theme.trackOutlineColor(MaterialState.selected) ??
          Colors.transparent,
      inactive:
          I.inactiveTrackStrokeColor ?? theme.trackOutlineColor.none ?? mIC,
    ).detect(active);

    var thumbColor = ViewToggleContent(
      active: I.activeThumbColor ??
          theme.thumbColor(MaterialState.selected) ??
          context.colorScheme.background,
      inactive: I.inactiveThumbColor ?? theme.thumbColor.none ?? mIC,
    ).detect(active);

    var thumbStrokeColor = ViewToggleContent(
      active: I.activeThumbStrokeColor ?? Colors.transparent,
      inactive: I.inactiveThumbStrokeColor ?? Colors.transparent,
    ).detect(active);

    var thumbSpacing = ViewToggleContent(
      active: I.activeThumbSpacing ?? size.x(5) ?? 4,
      inactive: I.inactiveThumbSpacing ?? size.x(20),
    ).detect(active);

    var thumbStrokeSize = ViewToggleContent(
      active: I.activeThumbStrokeSize ?? 0,
      inactive: I.inactiveThumbStrokeSize,
    ).detect(active);

    var thumbIcon = ViewToggleContent(
      active: I.activeThumbIcon,
      inactive: I.inactiveThumbIcon,
    ).detect(active);

    var thumbIconTint = ViewToggleContent(
      active: I.activeThumbIconTint,
      inactive: I.inactiveThumbIconTint,
    ).detect(active);

    var trackStrokeSize = I.trackStrokeSize ?? size.x(7) ?? 2.0;
    var borderRadius = I.trackBorderRadius ?? size;
    var dimension = I.trackRatio >= 1 ? I.trackRatio : 1.65;
    var thumbSize = size - (trackStrokeSize * 2) - (thumbSpacing * 2);

    Widget child = AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Opacity(
          opacity: widget.enabled ? 1 : 0.5,
          child: AnimatedContainer(
            duration: _duration,
            width: I.size * dimension,
            height: I.size,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              color: trackColor,
              border: trackStrokeSize > 0
                  ? Border.all(
                      color: trackOutlineColor,
                      strokeAlign: BorderSide.strokeAlignInside,
                      width: trackStrokeSize,
                    )
                  : null,
            ),
            child: Align(
              alignment: _toggleAnimation.value,
              child: AnimatedContainer(
                duration: _duration,
                curve: Curves.decelerate,
                width: thumbSize,
                margin: EdgeInsets.all(thumbSpacing),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: thumbColor,
                  border: thumbStrokeSize > 0
                      ? Border.all(
                          strokeAlign: BorderSide.strokeAlignInside,
                          color: thumbStrokeColor,
                          width: thumbStrokeSize,
                        )
                      : null,
                ),
                child: thumbIcon != null
                    ? FittedBox(
                        child: Padding(
                          padding: EdgeInsets.all(
                            I.thumbIconSpacing ?? 0,
                          ),
                          child: RawIconView(
                            icon: thumbIcon,
                            tint: thumbIconTint,
                          ),
                        ),
                      )
                    : null,
              ),
            ),
          ),
        );
      },
    );

    if (widget.onToggle != null) {
      return GestureDetector(
        onTap: () {
          if (widget.enabled) {
            if (widget.value) {
              _animationController.forward();
            } else {
              _animationController.reverse();
            }
            widget.onToggle?.call(!widget.value);
          }
        },
        child: child,
      );
    }

    return child;
  }
}

class SwitchButtonConfig {
  final double size;

  final Color? activeThumbColor;
  final Color? inactiveThumbColor;
  final Color? activeThumbStrokeColor;
  final Color? inactiveThumbStrokeColor;
  final Color? activeTrackColor;
  final Color? inactiveTrackColor;
  final Color? activeTrackStrokeColor;
  final Color? inactiveTrackStrokeColor;

  final dynamic activeThumbIcon;
  final dynamic inactiveThumbIcon;
  final Color? activeThumbIconTint;
  final Color? inactiveThumbIconTint;

  final double? activeThumbSpacing;
  final double? inactiveThumbSpacing;
  final double? activeThumbStrokeSize;
  final double? inactiveThumbStrokeSize;

  final double? thumbIconSpacing;
  final int thumbWalkingTime;
  final double? trackBorderRadius;
  final double? trackStrokeSize;
  final double trackRatio;

  const SwitchButtonConfig({
    this.size = 30,
    this.activeThumbColor,
    this.inactiveThumbColor,
    this.activeThumbStrokeColor,
    this.inactiveThumbStrokeColor,
    this.activeTrackColor,
    this.inactiveTrackColor,
    this.activeTrackStrokeColor,
    this.inactiveTrackStrokeColor,
    this.activeThumbIcon,
    this.inactiveThumbIcon,
    this.activeThumbIconTint,
    this.inactiveThumbIconTint,
    this.activeThumbSpacing,
    this.inactiveThumbSpacing,
    this.activeThumbStrokeSize,
    this.inactiveThumbStrokeSize,
    this.thumbIconSpacing,
    this.thumbWalkingTime = 200,
    this.trackBorderRadius,
    this.trackStrokeSize,
    this.trackRatio = 1.65,
  });

  SwitchButtonConfig copy({
    bool? enabled,
    bool? value,
    double? size,
    Color? activeThumbColor,
    Color? inactiveThumbColor,
    Color? activeThumbStrokeColor,
    Color? inactiveThumbStrokeColor,
    Color? activeTrackColor,
    Color? inactiveTrackColor,
    Color? activeTrackStrokeColor,
    Color? inactiveTrackStrokeColor,
    dynamic activeThumbIcon,
    dynamic inactiveThumbIcon,
    Color? activeThumbIconTint,
    Color? inactiveThumbIconTint,
    double? activeThumbSpacing,
    double? inactiveThumbSpacing,
    double? activeThumbStrokeSize,
    double? inactiveThumbStrokeSize,
    double? thumbIconSpacing,
    int? thumbWalkingTime,
    double? trackBorderRadius,
    double? trackStrokeSize,
    double? trackRatio,
  }) {
    return SwitchButtonConfig(
      activeThumbColor: activeThumbColor ?? this.activeThumbColor,
      activeThumbIcon: activeThumbIcon ?? this.activeThumbIcon,
      activeThumbIconTint: activeThumbIconTint ?? this.activeThumbIconTint,
      activeThumbStrokeColor:
          activeThumbStrokeColor ?? this.activeThumbStrokeColor,
      activeThumbStrokeSize:
          activeThumbStrokeSize ?? this.activeThumbStrokeSize,
      activeThumbSpacing: activeThumbSpacing ?? this.activeThumbSpacing,
      activeTrackColor: activeTrackColor ?? this.activeTrackColor,
      activeTrackStrokeColor:
          activeTrackStrokeColor ?? this.activeTrackStrokeColor,
      inactiveThumbColor: inactiveThumbColor ?? this.inactiveThumbColor,
      inactiveThumbIcon: inactiveThumbIcon ?? this.inactiveThumbIcon,
      inactiveThumbIconTint:
          inactiveThumbIconTint ?? this.inactiveThumbIconTint,
      inactiveThumbStrokeColor:
          inactiveThumbStrokeColor ?? this.inactiveThumbStrokeColor,
      inactiveThumbStrokeSize:
          inactiveThumbStrokeSize ?? this.inactiveThumbStrokeSize,
      inactiveThumbSpacing: inactiveThumbSpacing ?? this.inactiveThumbSpacing,
      inactiveTrackColor: inactiveTrackColor ?? this.inactiveTrackColor,
      inactiveTrackStrokeColor:
          inactiveTrackStrokeColor ?? this.inactiveTrackStrokeColor,
      size: size ?? this.size,
      thumbIconSpacing: thumbIconSpacing ?? this.thumbIconSpacing,
      thumbWalkingTime: thumbWalkingTime ?? this.thumbWalkingTime,
      trackBorderRadius: trackBorderRadius ?? this.trackBorderRadius,
      trackRatio: trackRatio ?? this.trackRatio,
      trackStrokeSize: trackStrokeSize ?? this.trackStrokeSize,
    );
  }
}

extension MaterialStateExtension<T> on MaterialStateProperty<T?>? {
  MaterialStateProperty<T?> get use =>
      this ?? const MaterialStatePropertyAll(null);

  T? call([MaterialState? state]) => use.resolve({if (state != null) state});

  T? property(MaterialState state) => use(state);

  T? get none => use();
}
