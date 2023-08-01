import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_androssy/widgets.dart';

class ET<T extends ETC> extends TextView<T> {
  ///BOOLEAN PROPERTIES
  final bool autoFocus;
  final bool obscureText;

  /// STRING PROPERTIES
  final String digits;
  final String hint;

  ///COLOR PROPERTIES
  final Color? hintColor;
  final Color? primary;

  ///OBJECT PROPERTIES
  final TextInputType? inputType;

  const ET({
    /// SUPER PROPERTIES
    super.key,
    super.controller,
    super.enabled,
    super.background,
    super.padding,
    super.paddingHorizontal,
    super.paddingVertical,
    super.paddingTop,
    super.paddingBottom,
    super.paddingStart,
    super.paddingEnd,
    super.width,
    super.text,
    super.flex,

    /// BOOLEAN PROPERTIES
    this.autoFocus = false,
    this.obscureText = false,

    /// STRING PROPERTIES
    this.digits = "",
    this.hint = "",

    /// COLOR PROPERTIES
    this.hintColor,
    this.primary,

    /// OBJECT PROPERTIES
    this.inputType,
  });

  @override
  ViewRoots initRootProperties() => const ViewRoots(observer: false);

  @override
  T initController() => ETC() as T;

  @override
  T attachController(T controller) => controller.fromEditText(this) as T;

  @override
  void onDispose(T controller) => controller._dispose();

  @override
  Widget build(BuildContext context, T controller, Widget parent) {
    final primaryColor = controller.primary ?? context.primaryColor;
    const underlineColor = Color(0xffe1e1e1);
    return GestureDetector(
      onTap: () => controller.showKeyboard(context),
      child: controller.isUnderlineHide
          ? parent
          : Column(
              children: [
                parent,
                UnderlineView(
                  visible: controller.background == null &&
                      controller.borderAll <= 0,
                  focused: controller.isFocused,
                  enabled: controller.enabled,
                  error: controller.error,
                  height: 1,
                  primary: primaryColor,
                  colorState: ValueState(
                    primary: primaryColor,
                    secondary: underlineColor,
                    error: Colors.red,
                    disable: underlineColor,
                  ),
                ),
              ],
            ),
    );
  }

  @override
  Widget? attach(BuildContext context, T controller) {
    final primaryColor = controller.primary ?? context.primaryColor;
    const secondaryColor = Color(0xffbbbbbb);
    var style = TextStyle(
      color: controller.textColor ?? Colors.black,
      fontSize: controller.textSize ?? 18,
    );
    return Stack(
      alignment: controller.gravity ?? Alignment.centerLeft,
      children: [
        SizedBox(
          width: double.infinity,
          child: Text(
            controller.hint,
            textAlign: controller.textAlign ?? TextAlign.start,
            style: style.copyWith(
              fontFamily: "",
              color: controller.text.isNotEmpty
                  ? Colors.transparent
                  : controller.hintColor ?? secondaryColor,
            ),
          ),
        ),
        EditableText(
          controller: controller._editable,
          readOnly: controller.isReadMode,
          textAlign: controller.textAlign ?? TextAlign.start,
          maxLines: null,
          focusNode: controller._node,
          autofocus: controller.autoFocus,
          style: style,
          cursorColor: primaryColor,
          obscureText: controller.obscureText,
          backgroundCursorColor: primaryColor,
          keyboardType: controller.inputType ?? TextInputType.multiline,
          onChanged: controller._handleEditingChange,
          inputFormatters: controller.formatter,
        ),
      ],
    );
  }
}

class ETC extends TextViewController {
  late TextEditingController _editable;
  late FocusNode _node;
  bool _initial = true;
  bool _focused = false;

  ///BOOLEAN PROPERTIES
  bool autoFocus = false;
  bool obscureText = false;

  /// STRING PROPERTIES
  String digits = "";
  String hint = "";

  ///COLOR PROPERTIES
  Color? hintColor;
  Color? primary;

  ///OBJECT PROPERTIES
  TextInputType? inputType;

  /// OVERRIDE PROPERTIES
  @override
  String get text => _editable.text;

  /// CUSTOM PROPERTIES
  bool get isFocused => _focused;

  bool get isReadMode => !enabled;

  bool get isUnderlineHide => background != null || borderAll > 0;

  List<TextInputFormatter>? get formatter {
    if (digits.isNotEmpty) {
      return [
        FilteringTextInputFormatter.allow(RegExp("[$digits]")),
      ];
    }
    return null;
  }

  ETC() {
    _init();
  }

  void _init() {
    _editable = TextEditingController();
    _node = FocusNode();
    _node.addListener(_handleFocusChange);
  }

  ETC fromEditText(ET view) {
    super.fromTextView(view);

    ///BOOLEAN PROPERTIES
    autoFocus = view.autoFocus;
    obscureText = view.obscureText;

    /// STRING PROPERTIES
    digits = view.digits;
    hint = view.hint;

    ///COLOR PROPERTIES
    hintColor = view.hintColor;
    primary = view.primary;

    ///OBJECT PROPERTIES
    inputType = view.inputType;
    return this;
  }

  void _handleFocusChange() {
    onNotifyWithCallback(() {
      if (_node.hasFocus != _focused) {
        _focused = _node.hasFocus;
      }
    });
  }

  void _handleEditingChange(String value) async {
    onNotifyWithCallback(() {
      _initial = false;
    });
  }

  void showKeyboard(BuildContext context) async {
    log("show_keyboard");
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

  void _dispose() {
    _editable.dispose();
    _node.dispose();
  }
}

class UnderlineView extends StatelessWidget {
  final Color? primary;
  final bool visible;
  final bool enabled;
  final bool focused;
  final bool error;
  final double height;
  final ValueState<Color> colorState;

  const UnderlineView({
    Key? key,
    this.primary,
    this.visible = true,
    this.enabled = true,
    this.focused = false,
    this.error = false,
    required this.colorState,
    this.height = 1,
  }) : super(key: key);

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
