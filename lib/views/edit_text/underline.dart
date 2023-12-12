part of 'view.dart';

class Underline extends StatelessWidget {
  final Color? primary;
  final bool visible;
  final bool enabled;
  final bool focused;
  final bool error;
  final double height;
  final ValueState<Color> colorState;

  const Underline({
    super.key,
    this.primary,
    this.visible = true,
    this.enabled = true,
    this.focused = false,
    this.error = false,
    required this.colorState,
    this.height = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: Container(
        margin: EdgeInsets.only(bottom: focused && enabled ? 0 : height),
        decoration: BoxDecoration(
          color: colorState.fromType(
            enabled
                ? error
                    ? ValueStateType.error
                    : focused
                        ? ValueStateType.primary
                        : ValueStateType.secondary
                : ValueStateType.disabled,
          ),
        ),
        height: focused && enabled ? height * 2 : height,
      ),
    );
  }
}
