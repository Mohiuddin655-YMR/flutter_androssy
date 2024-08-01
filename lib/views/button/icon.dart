part of 'view.dart';

class _Icon extends StatelessWidget {
  final ButtonController controller;
  final bool visible;

  const _Icon({
    required this.controller,
    this.visible = true,
  });

  @override
  Widget build(BuildContext context) {
    Widget child = Padding(
      padding: EdgeInsets.only(
        left: !controller.isCenterText && controller.isEndIconVisible
            ? controller.iconSpace
            : 0,
        right: !controller.isCenterText && controller.isStartIconVisible
            ? controller.iconSpace
            : 0,
      ),
      child: AndrossyIcon(
        icon: controller.icon,
        color: controller.iconTint,
        size: controller.iconSize,
      ),
    );
    if (controller.isCenterText) {
      child = Positioned(
        left: controller.isEndIconVisible ? null : 0,
        right: controller.isEndIconVisible ? 0 : null,
        child: child,
      );
    }
    if (visible) {
      return child;
    } else {
      return const SizedBox.shrink();
    }
  }
}
