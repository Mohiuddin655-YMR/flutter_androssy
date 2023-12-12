import 'package:flutter/material.dart';

class Bouncer extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final VoidCallback? onTap;

  const Bouncer({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 150),
    this.onTap,
  });

  @override
  State<Bouncer> createState() => _BouncerState();
}

class _BouncerState extends State<Bouncer> with SingleTickerProviderStateMixin {
  late AnimationController _animController;
  late Animation<double> _animation;

  @override
  void initState() {
    _animController = AnimationController(
      vsync: this,
      duration: widget.duration,
      value: 1.0,
      upperBound: 1.0,
      lowerBound: 0.95,
    );
    _animation = CurvedAnimation(
      parent: _animController,
      curve: Curves.linear,
      reverseCurve: Curves.linear,
    );
    super.initState();
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  void _onTap() async {
    widget.onTap?.call();
    await _animController.reverse();
    _animController.forward();
  }

  @override
  Widget build(BuildContext context) {
    Widget child = widget.child;
    if (widget.onTap != null) {
      child = RepaintBoundary(
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: widget.onTap != null ? _onTap : null,
            child: ScaleTransition(
              scale: _animation,
              child: child,
            ),
          ),
        ),
      );
    }
    return child;
  }
}
