part of 'view.dart';

class _Footer extends StatelessWidget {
  final bool hasError;
  final EditTextController controller;
  final Color? secondaryColor;
  final EdgeInsets floatingTextSpace;

  const _Footer({
    required this.hasError,
    required this.controller,
    required this.secondaryColor,
    required this.floatingTextSpace,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: floatingTextSpace.copyWith(bottom: 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: controller.textAlign == TextAlign.center
            ? MainAxisAlignment.center
            : MainAxisAlignment.spaceBetween,
        children: [
          _HighlightText(
            visible: hasError || controller.helperText.isNotEmpty,
            text: hasError ? controller.errorText : controller.helperText,
            textAlign: controller.textAlign,
            textSize: controller.floatingTextSize,
            textColor: !hasError
                ? controller.helperTextColor ?? secondaryColor
                : controller.errorTextColor,
            valid: hasError || controller.helperText.isNotEmpty,
          ),
          _HighlightText(
            visible: controller.textAlign != TextAlign.center &&
                controller.counterTextVisible,
            text: controller.counter,
            textAlign: TextAlign.end,
            textSize: controller.floatingTextSize,
            textColor: hasError ? controller.errorTextColor : secondaryColor,
            valid: controller.counterTextVisible && controller.isFocused,
          ),
        ],
      ),
    );
  }
}
