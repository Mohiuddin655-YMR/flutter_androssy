part of 'view.dart';

class _Constants {
  const _Constants._();

  static const defaultSmsCodeMatcher = '\\d{4,7}';

  static const _animationDuration = Duration(milliseconds: 180);

  static const _defaultLength = 4;

  static const _defaultSeparator = SizedBox(width: 8);

  static const _hiddenTextStyle = TextStyle(
    fontSize: 1,
    height: 1,
    color: Colors.transparent,
  );

  static const _defaultInputColor = Color.fromRGBO(222, 231, 240, .57);
  static const _defaultInputDecoration = BoxDecoration(
    color: _defaultInputColor,
    borderRadius: BorderRadius.all(Radius.circular(8)),
  );

  static const _defaultInputTheme = InputTheme(
    width: 56,
    height: 60,
    textStyle: TextStyle(),
    decoration: _defaultInputDecoration,
  );
}
