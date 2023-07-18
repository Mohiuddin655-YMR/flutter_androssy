part of '../widgets.dart';

class MaterialEditText extends YMRView<MaterialEditTextController> {
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

  const MaterialEditText({
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
  MaterialEditTextController initController() {
    return MaterialEditTextController();
  }

  @override
  MaterialEditTextController attachController(
    MaterialEditTextController controller,
  ) {
    return controller.fromMaterialEditText(this);
  }

  @override
  Widget? attach(BuildContext context, MaterialEditTextController controller) {
    final isValid = controller.isValid;
    final hasError = controller.hasError;
    final theme = Theme.of(context);
    final primaryColor = controller.primary ?? theme.primaryColor;
    const secondaryColor = Color(0xffbbbbbb);
    const underlineColor = Color(0xffe1e1e1);
    var drawableTint = controller.drawableTint ??
        ValueState<Color>.focus(
          focused: primaryColor,
          unfocused: secondaryColor,
        );
    var style = TextStyle(
      color: controller.textColor ?? Colors.black,
      fontSize: controller.textSize,
    );
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: double.infinity,
          child: _METText(
            visible: controller.floatingLabelVisible,
            valid: controller.text.isNotEmpty,
            text: controller.hint,
            textAlign: controller.textAlign,
            textSize: controller.floatingLabelSize,
            textColor: controller.isFocused
                ? primaryColor
                : controller.floatingLabelColor ?? secondaryColor,
          ),
        ),
        GestureDetector(
          onTap: () => controller._requestFocus,
          child: AbsorbPointer(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 5, bottom: 8),
                  width: double.infinity,
                  child: Row(
                    children: [
                      if (controller.drawableStart != null)
                        _METDrawable(
                          icon: controller.drawableStart!,
                          size: 24,
                          focused: controller.isFocused,
                          tint: drawableTint,
                          padding: EdgeInsets.only(
                            right: controller.drawablePadding,
                          ),
                        ),
                      Expanded(
                        child: Stack(
                          alignment: Alignment.centerLeft,
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: Text(
                                controller.hint,
                                textAlign: controller.textAlign,
                                style: style.copyWith(
                                  color: controller.text.isNotEmpty
                                      ? Colors.transparent
                                      : controller.hintColor ?? secondaryColor,
                                  fontFamily: "",
                                ),
                              ),
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
                      ),
                      if (!controller._initial)
                        isValid && controller.onExecute != null
                            ? _METLoading(
                                value: controller.text,
                                onLoading: controller.onExecute,
                                builder: (value) {
                                  return _METDrawable(
                                    icon: controller.drawableEnd!,
                                    size: 24,
                                    focused: controller.isFocused,
                                    selected: isValid,
                                    tint: drawableTint,
                                    padding: EdgeInsets.only(
                                      left: controller.drawablePadding / 2,
                                    ),
                                    visible: value,
                                  );
                                },
                              )
                            : controller.drawableEnd != null
                                ? _METDrawable(
                                    icon: controller.drawableEnd!,
                                    size: 24,
                                    focused: controller.isFocused,
                                    selected: isValid,
                                    tint: drawableTint,
                                    visible: isValid,
                                    padding: EdgeInsets.only(
                                      left: controller.drawablePadding / 2,
                                    ),
                                  )
                                : const SizedBox(),
                    ],
                  ),
                ),
                _METUnderline(
                  focused: controller.isFocused,
                  enabled: controller.enabled,
                  error: hasError,
                  height: 1,
                  primary: primaryColor,
                  colorState: ValueState.state(
                    primary: primaryColor,
                    secondary: underlineColor,
                    error: controller.errorColor,
                    disable: underlineColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _METText(
                text: hasError ? controller._error : controller.helperText,
                textAlign: TextAlign.start,
                textSize: controller.floatingLabelSize,
                textColor: !hasError
                    ? controller.helperTextColor ?? secondaryColor
                    : controller.errorColor,
                valid: hasError || controller.helperText.isNotEmpty,
                visible: hasError || controller.helperText.isNotEmpty,
                padding: const EdgeInsets.only(
                  top: 4,
                  bottom: 4,
                ),
              ),
              _METText(
                text: controller.counter,
                textAlign: TextAlign.end,
                textSize: controller.floatingLabelSize,
                textColor: hasError ? controller.errorColor : secondaryColor,
                valid: controller.counterVisible && controller.isFocused,
                visible: controller.counterVisible,
                padding: const EdgeInsets.only(
                  top: 4,
                  bottom: 4,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void onDispose(MaterialEditTextController controller) {
    controller._dispose();
  }
}

class MaterialEditTextController extends ViewController {
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

  MaterialEditTextController() {
    _editable = TextEditingController();
    _node = FocusNode();
    _node.addListener(_handleFocusChange);
  }

  MaterialEditTextController fromMaterialEditText(MaterialEditText widget) {
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
    onExecute = widget.onExecute;
    onChange = widget.onChange;
    onError = widget.onError;
    onValidator = widget.onValidator;
    return this;
  }

  bool get isFocused => _focused ?? false;

  set text(String? value) => _editable.text = value ?? "";

  String get text => _editable.text;

  bool get hasError => !isValid && _error.isNotEmpty;

  bool get isValid {
    final v = onValidator?.call(_editable.text);
    onValid?.call(v ?? false);
    return v ?? true;
  }

  dynamic get iStart => drawableStart?.drawable(isFocused);

  dynamic get iEnd => drawableEnd?.drawable(isFocused);

  void get _requestFocus async {
    if (_node.hasFocus) {
      _node.unfocus();
      await Future.delayed(const Duration(milliseconds: 100)).then((value) {
        FocusScope.of(context).requestFocus(_node);
      });
    } else {
      FocusScope.of(context).requestFocus(_node);
    }
  }

  void _handleFocusChange() {
    if (_node.hasFocus != _focused) {
      _focused = _node.hasFocus;
      _notify;
    }
  }

  void _handleEditingChange(String value) {
    _initial = false;
    onChange?.call(value);
    _error = onError?.call(errorType(value)) ?? "";
    onChecked?.call(id ?? "$hashCode", isValid);
    _notify;
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

class _METText extends StatelessWidget {
  final bool valid;
  final bool visible;
  final String text;
  final TextAlign? textAlign;
  final Color? textColor;
  final double textSize;
  final EdgeInsetsGeometry? padding;

  const _METText({
    Key? key,
    required this.text,
    this.textAlign,
    this.textColor,
    this.textSize = 12,
    this.valid = false,
    this.visible = true,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: Container(
        padding: padding ??
            const EdgeInsets.symmetric(
              vertical: 4,
            ),
        child: Text(
          text,
          textAlign: textAlign,
          style: TextStyle(
            color: valid ? textColor ?? Colors.grey : Colors.transparent,
            fontFamily: "",
            fontSize: textSize,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class _METUnderline extends StatelessWidget {
  final Color? primary;
  final bool enabled;
  final bool focused;
  final bool error;
  final double height;
  final ValueState<Color> colorState;

  const _METUnderline({
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
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colorState.from(
              enabled
                  ? error
                      ? ViewState.error
                      : focused
                          ? ViewState.primary
                          : ViewState.secondary
                  : ViewState.disabled,
            ),
          ),
          height: focused ? height * 2 : height,
        ),
        SizedBox(
          height: focused ? 0 : height,
        ),
      ],
    );
  }
}

class _METDrawable extends StatelessWidget {
  final bool focused;
  final bool? selected;
  final MaterialIconData icon;
  final double size;
  final ValueState<Color>? tint;
  final EdgeInsetsGeometry? padding;
  final bool visible;

  const _METDrawable({
    Key? key,
    required this.icon,
    this.focused = false,
    this.selected,
    this.size = 24,
    this.tint,
    this.padding,
    this.visible = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = tint ??
        ValueState.focus(
          focused: Theme.of(context).primaryColor,
          unfocused: Colors.grey,
        );
    final drawable = icon.drawable(selected ?? focused);
    return Visibility(
      visible: visible,
      child: Container(
        margin: padding,
        width: size,
        height: size,
        child: FittedBox(
          child: RawIconView(
            icon: drawable,
            tint: color.focused(focused),
          ),
        ),
      ),
    );
  }
}

class _METLoading extends StatelessWidget {
  final String value;
  final Widget Function(bool value) builder;
  final Future<bool> Function(String value)? onLoading;

  const _METLoading({
    Key? key,
    required this.builder,
    this.value = "",
    this.onLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: onLoading?.call(value),
      builder: (context, state) {
        switch (state.connectionState) {
          case ConnectionState.done:
          case ConnectionState.none:
          case ConnectionState.active:
            return builder.call(state.data ?? false);
          case ConnectionState.waiting:
            return Container(
              width: 24,
              height: 24,
              padding: const EdgeInsets.all(3),
              child: const CircularProgressIndicator(strokeWidth: 2),
            );
        }
      },
    );
  }
}
