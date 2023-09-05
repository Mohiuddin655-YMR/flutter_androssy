part of '../raw.dart';

class SwitchButton extends StatefulWidget {
  final bool enabled;
  final bool value;
  final OnViewToggleListener? onToggle;

  const SwitchButton({
    super.key,
    this.value = false,
    this.enabled = true,
    this.onToggle,
  });

  @override
  State<SwitchButton> createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton>
    with SingleTickerProviderStateMixin {
  late Duration duration = const Duration(milliseconds: 200);
  late final Animation _toggleAnimation;
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      value: widget.value ? 1.0 : 0.0,
      duration: duration,
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

    if (oldWidget.value == widget.value) return;

    if (widget.value) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
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
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Opacity(
            opacity: widget.enabled ? 1 : 0.6,
            child: Container(
              width: 40,
              height: 24,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color:
                    widget.value ? context.primaryColor : Colors.grey.shade300,
              ),
              child: Align(
                alignment: _toggleAnimation.value,
                child: Container(
                  width: 16,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: widget.value ? Colors.white : Colors.transparent,
                    border: !widget.value
                        ? Border.all(color: Colors.white, width: 3)
                        : null,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
