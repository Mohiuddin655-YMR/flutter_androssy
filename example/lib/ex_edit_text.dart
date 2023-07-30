import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_androssy/widgets.dart';

class ExEditTextController extends ViewController {
  late TextEditingController _editable;
  late FocusNode _node;
  bool? _focused;
  bool _initial = true;
  String _error = "";

  String? id;
  bool autoFocus = false;
  Color? primary;
  double textSize = 18;
  Color? textColor;
  String hint = "";
  Color? hintColor;
  String helperText = "";
  Color? helperTextColor;
  Color? floatingLabelColor;
  double floatingLabelSize = 12;
  bool floatingLabelVisible = false;
  TextAlign textAlign = TextAlign.start;
  bool errorVisible = false;
  Color? errorColor = const Color(0xFFF44336);
  bool counterVisible = false;
  String? digits;
  MaterialIconData? drawableStart;
  MaterialIconData? drawableEnd;
  double drawablePadding = 24;
  ValueState<Color>? drawableTint;
  TextInputType inputType = TextInputType.text;
  int maxCharacters = 0;
  int minCharacters = 0;
  bool obscureText = false;

  late Function(String tag, bool valid)? onChecked;
  late Future<bool> Function(String)? onExecute;

  ExEditTextController() {
    _editable = TextEditingController();
    _node = FocusNode();
    _node.addListener(_handleFocusChange);
  }

  ExEditTextController fromMaterialEditText(ExEditText widget) {
    super.fromView(widget);
    _editable.text = widget.text ?? "";
    id = widget.id;
    autoFocus = widget.autoFocus;
    primary = widget.primary;
    textSize = widget.textSize;
    textColor = widget.textColor;
    hint = widget.hint;
    hintColor = widget.hintColor;
    helperText = widget.helperText;
    helperTextColor = widget.helperTextColor;
    floatingLabelColor = widget.floatingLabelColor;
    floatingLabelSize = widget.floatingLabelSize;
    floatingLabelVisible = widget.floatingLabelVisible;
    textAlign = widget.textAlign;
    errorVisible = widget.errorVisible;
    errorColor = widget.errorColor;
    counterVisible = widget.counterVisible;
    digits = widget.digits;
    drawableStart = widget.drawableStart;
    drawableEnd = widget.drawableEnd;
    drawablePadding = widget.drawablePadding;
    drawableTint = widget.drawableTint;
    inputType = widget.inputType;
    maxCharacters = widget.maxCharacters;
    minCharacters = widget.minCharacters;
    obscureText = widget.obscureText;
    onChecked = widget.onChecked;
    onChange = widget.onChange;
    onError = widget.onError;
    onExecute = widget.onExecute;
    onValidator = widget.onValidator;
    return this;
  }

  bool get isFocused => _focused ?? false;

  set text(String? value) => _editable.text = value ?? "";

  String get text => _editable.text;

  bool get hasError => !isValid && _error.isNotEmpty;

  dynamic get iStart => drawableStart?.drawable(isFocused);

  dynamic get iEnd => drawableEnd?.drawable(isFocused);

  void showKeyboard(BuildContext context) async {
    if (_node.hasFocus) {
      _node.unfocus();
      await Future.delayed(const Duration(milliseconds: 100)).then((value) {
        FocusScope.of(context).requestFocus(_node);
      });
    } else {
      FocusScope.of(context).requestFocus(_node);
    }
  }

  void hideKeyboard(BuildContext context) => FocusScope.of(context).unfocus();

  void _handleFocusChange() {
    if (_node.hasFocus != _focused) {
      onNotifyWithCallback(() {
        _focused = _node.hasFocus;
      });
    }
  }

  var isValid = false;

  var isLoading = false;

  void _handleEditingChange(String value) async {
    _initial = false;
    isValid = onValidator?.call(value) ?? true;
    onValid?.call(isValid);
    onChange?.call(value);
    onChecked?.call(id ?? "$hashCode", isValid);
    if (onExecute != null && !_initial && isValid) {
      var
      var isAvailable = await onExecute?.call(value) ?? false;
      if (isAvailable) {
        _error = onError?.call(ViewError.alreadyFound) ?? "";
      }
    } else {
      _error = onError?.call(errorType(value)) ?? "";
    }
    onNotify();
  }

  ViewError errorType(String text) {
    if (text.isEmpty && !_initial) {
      return ViewError.empty;
    } else if (!isValid) {
      final length = text.length;
      if (maxCharacters > 0 && maxCharacters < length) {
        return ViewError.maximum;
      } else if (minCharacters > 0 && minCharacters > length) {
        return ViewError.minimum;
      } else {
        return ViewError.invalid;
      }
    } else {
      return ViewError.none;
    }
  }

  String get counter {
    var currentLength = text.length;
    final maxLength = maxCharacters;
    return maxLength > 0
        ? '$currentLength / $maxLength'
        : currentLength > 0
            ? "$currentLength"
            : "";
  }

  List<TextInputFormatter>? get formatter {
    final digit = digits ?? "";
    if (digit.isNotEmpty) {
      return [
        FilteringTextInputFormatter.allow(RegExp("[$digit]")),
      ];
    }
    return null;
  }

  void _dispose() {
    _editable.dispose();
    _node.dispose();
  }
}

class ExEditText extends YMRView<ExEditTextController> {
  final String? id;
  final bool autoFocus;
  final Color? primary;
  final String? text;
  final double textSize;
  final Color? textColor;
  final String hint;
  final Color? hintColor;
  final String helperText;
  final Color? helperTextColor;
  final Color? floatingLabelColor;
  final double floatingLabelSize;
  final bool floatingLabelVisible;
  final TextAlign textAlign;
  final bool errorVisible;
  final Color? errorColor;
  final bool counterVisible;
  final String? digits;
  final MaterialIconData? drawableStart;
  final MaterialIconData? drawableEnd;
  final double drawablePadding;
  final ValueState<Color>? drawableTint;
  final TextInputType inputType;
  final int maxCharacters;
  final int minCharacters;
  final bool obscureText;

  final Function(String tag, bool value)? onChecked;
  final Future<bool> Function(String)? onExecute;

  const ExEditText({
    super.key,
    super.animation,
    super.animationType,
    super.controller,
    super.enabled,
    super.flex,
    super.margin,
    super.marginHorizontal,
    super.marginVertical,
    super.marginTop,
    super.marginBottom,
    super.marginStart,
    super.marginEnd,
    super.position,
    super.positionType,
    super.transform,
    super.transformGravity,
    super.width,
    super.widthMax,
    super.widthMin,
    super.visibility,
    super.onChange,
    super.onError,
    super.onValid,
    super.onValidator,
    required this.hint,
    this.id,
    this.autoFocus = false,
    this.hintColor,
    this.helperText = "",
    this.helperTextColor,
    this.floatingLabelColor,
    this.floatingLabelSize = 12,
    this.floatingLabelVisible = false,
    this.primary,
    this.text,
    this.textAlign = TextAlign.start,
    this.textColor,
    this.textSize = 18,
    this.errorColor = const Color(0xFFF44336),
    this.errorVisible = true,
    this.counterVisible = false,
    this.digits,
    this.drawableStart,
    this.drawableEnd,
    this.drawablePadding = 24,
    this.drawableTint,
    this.inputType = TextInputType.text,
    this.maxCharacters = 0,
    this.minCharacters = 0,
    this.obscureText = false,
    this.onExecute,
    this.onChecked,
  });

  @override
  ExEditTextController initController() {
    return ExEditTextController();
  }

  @override
  ExEditTextController attachController(
    ExEditTextController controller,
  ) {
    return controller.fromMaterialEditText(this);
  }

  @override
  Widget? attach(BuildContext context, ExEditTextController controller) {
    final theme = Theme.of(context);
    final primaryColor = controller.primary ?? theme.primaryColor;
    const secondaryColor = Color(0xffbbbbbb);
    const underlineColor = Color(0xffe1e1e1);
    var drawableTint = controller.drawableTint ??
        ValueState<Color>(
          activate: primaryColor,
          primary: secondaryColor,
        );
    var style = TextStyle(
      color: controller.textColor ?? Colors.black,
      fontSize: controller.textSize,
    );

    final isValid = controller.isValid;
    final hasError = controller.hasError;

    return LinearLayout(
      children: [
        /// FLOATING TEXT
        TextView(
          width: double.infinity,
          visibility: controller.floatingLabelVisible,
          paddingVertical: 4,
          text: controller.hint,
          textAlign: controller.textAlign,
          textSize: controller.floatingLabelSize,
          textColor: controller.isFocused
              ? primaryColor
              : controller.floatingLabelColor ?? secondaryColor,
          textFontWeight: FontWeight.w500,
        ),

        /// EDIT FIELD
        LinearLayout(
          orientation: Axis.horizontal,
          width: double.infinity,
          paddingTop: 5,
          paddingBottom: 8,
          children: [
            _METDrawable(
              icon: controller.drawableStart,
              focused: controller.isFocused,
              tint: drawableTint,
              padding: EdgeInsets.only(
                right: controller.drawablePadding,
              ),
            ),
            StackLayout(
              flex: 1,
              gravity: Alignment.centerLeft,
              children: [
                TextView(
                  width: double.infinity,
                  text: controller.hint,
                  textAlign: controller.textAlign,
                  textStyle: style,
                  textColor: controller.text.isNotEmpty
                      ? Colors.transparent
                      : controller.hintColor ?? secondaryColor,
                ),
                EditableText(
                  textAlign: controller.textAlign,
                  keyboardType: controller.inputType,
                  controller: controller._editable,
                  focusNode: controller._node,
                  autofocus: controller.autoFocus,
                  style: style,
                  cursorColor: primaryColor,
                  obscureText: controller.obscureText,
                  backgroundCursorColor: primaryColor,
                  onChanged: controller._handleEditingChange,
                  inputFormatters: controller.formatter,
                ),
              ],
            ),
            FutureBuilder(
              future: onExecute?.call(controller.text),
              builder: (context, task) {
                var loading = task.connectionState == ConnectionState.waiting;
                var isAvailable = task.data ?? false;
                if (loading && !controller._initial && isValid) {
                  return Container(
                    width: 24,
                    height: 24,
                    padding: const EdgeInsets.all(3),
                    child: const CircularProgressIndicator(strokeWidth: 2),
                  );
                } else {
                  return _METDrawable(
                    icon: controller.drawableEnd,
                    focused: controller.isFocused,
                    selected: isValid,
                    tint: drawableTint,
                    visible: !isAvailable,
                    padding: EdgeInsets.only(
                      left: controller.drawablePadding / 2,
                    ),
                  );
                }
              },
            ),
          ],
        ),

        /// UNDERLINE
        YMRView(
          orientation: Axis.vertical,
          marginBottom: controller.isFocused ? 0 : 1,
          height: controller.isFocused ? 2 : 1,
          background: ValueState(
            primary: primaryColor,
            secondary: underlineColor,
            error: controller.errorColor,
            disable: underlineColor,
          ).fromType(
            controller.enabled
                ? hasError
                    ? ValueStateType.error
                    : controller.isFocused
                        ? ValueStateType.primary
                        : ValueStateType.secondary
                : ValueStateType.disabled,
          ),
        ),

        /// BOTTOM
        LinearLayout(
          width: double.infinity,
          orientation: Axis.horizontal,
          crossGravity: CrossAxisAlignment.center,
          mainGravity: MainAxisAlignment.spaceBetween,
          children: [
            TextView(
              flex: 1,
              visibility: hasError || controller.helperText.isNotEmpty,
              paddingVertical: 4,
              text: hasError ? controller._error : controller.helperText,
              textAlign: TextAlign.start,
              textSize: controller.floatingLabelSize,
              textColor: !hasError
                  ? controller.helperTextColor ?? secondaryColor
                  : controller.errorColor,
              textFontWeight: FontWeight.w500,
            ),
            TextView(
              visibility: controller.counterVisible,
              paddingVertical: 4,
              text: controller.counter,
              textAlign: TextAlign.end,
              textSize: controller.floatingLabelSize,
              textColor: hasError ? controller.errorColor : secondaryColor,
              textFontWeight: FontWeight.w500,
            ),
          ],
        ),
      ],
    );
  }

  @override
  void onDispose(ExEditTextController controller) {
    controller._dispose();
  }
}

class _METDrawable extends StatelessWidget {
  final bool focused;
  final bool? selected;
  final MaterialIconData? icon;
  final ValueState<Color>? tint;
  final EdgeInsetsGeometry? padding;
  final bool visible;

  const _METDrawable({
    Key? key,
    this.icon,
    this.focused = false,
    this.selected,
    this.tint,
    this.padding,
    this.visible = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (icon != null) {
      final color = tint ??
          ValueState(
            primary: Colors.grey,
            activate: Theme.of(context).primaryColor,
          );
      final drawable = icon?.drawable(selected ?? focused);
      return Visibility(
        visible: visible,
        child: Container(
          margin: padding,
          width: 24,
          height: 24,
          child: FittedBox(
            child: RawIconView(
              icon: drawable,
              tint: color.detect(focused),
            ),
          ),
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}

class METUnderline extends StatelessWidget {
  final Color? primary;
  final bool enabled;
  final bool focused;
  final bool error;
  final double height;
  final ValueState<Color> colorState;

  const METUnderline({
    Key? key,
    this.primary,
    this.enabled = true,
    this.focused = false,
    this.error = false,
    required this.colorState,
    this.height = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return YMRView(
      orientation: Axis.vertical,
      marginBottom: focused ? 0 : height,
      height: focused ? height * 2 : height,
      background: colorState.fromType(
        enabled
            ? error
                ? ValueStateType.error
                : focused
                    ? ValueStateType.primary
                    : ValueStateType.secondary
            : ValueStateType.disabled,
      ),
    );
  }
}
