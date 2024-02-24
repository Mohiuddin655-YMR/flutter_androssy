part of 'view.dart';

class _HighlightText extends StatelessWidget {
  final bool valid;
  final bool visible;
  final String? text;
  final TextAlign? textAlign;
  final Color? textColor;
  final double textSize;

  const _HighlightText({
    this.visible = true,
    required this.text,
    this.textAlign,
    this.textColor,
    this.textSize = 12,
    this.valid = false,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: Text(
        text ?? "",
        textAlign: textAlign,
        style: TextStyle(
          color: valid ? textColor ?? Colors.grey : Colors.transparent,
          fontFamily: "",
          fontSize: textSize,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
