part of 'view.dart';

class _Header extends StatelessWidget {
  final EditTextController controller;
  final Color? primaryColor;
  final Color? secondaryColor;
  final bool visible;
  final EdgeInsets floatingTextSpace;

  const _Header({
    required this.controller,
    required this.primaryColor,
    required this.secondaryColor,
    required this.visible,
    required this.floatingTextSpace,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: Container(
        width: double.infinity,
        padding: floatingTextSpace.copyWith(top: 0),
        child: _HighlightText(
          valid: controller.text.isNotEmpty,
          text: controller.hintText,
          textAlign: controller.textAlign,
          textSize: controller.floatingTextSize,
          textColor: controller.isFocused
              ? primaryColor
              : controller.floatingTextColor ?? secondaryColor,
        ),
      ),
    );
  }
}
