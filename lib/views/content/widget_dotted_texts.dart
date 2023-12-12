part of 'view.dart';

class _DottedTexts extends StatelessWidget {
  final ContentViewController controller;

  const _DottedTexts({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: controller.paragraphs.map((e) {
        return _ParagraphText(
          controller: controller,
          content: e,
        );
      }).toList(),
    );
  }
}
