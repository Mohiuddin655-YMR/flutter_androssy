// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:picon/widgets/layout.dart';
//
// import '../../core/contents/constants.dart';
// import '../../utils/models/state_value.dart';
// import '../icons/material_icon.dart';
//
// class MaterialEditText extends StatefulWidget {
//   final MaterialEditTextController? controller;
//   final String? id;
//   final bool autoFocus;
//   final double? width;
//   final double border;
//   final Color? borderColor;
//   final bool borderHighlight;
//   final bool enabled;
//   final Color? primary;
//   final Color? background;
//   final String? text;
//   final double textSize;
//   final Color? textColor;
//   final String hint;
//   final Color? hintColor;
//   final String helperText;
//   final Color? helperTextColor;
//   final Color? floatingLabelColor;
//   final double floatingLabelSize;
//   final bool floatingLabelVisible;
//   final TextAlign textAlign;
//   final EdgeInsetsGeometry? padding, margin;
//   final double borderRadius;
//   final bool errorVisible;
//   final Color? errorColor;
//   final bool counterVisible;
//   final String? digits;
//   final MaterialIconData? drawableStart;
//   final MaterialIconData? drawableEnd;
//   final double drawablePadding;
//   final StateValue<Color>? drawableTint;
//   final TextInputType inputType;
//   final int maxCharacters;
//   final int minCharacters;
//   final bool obscureText;
//
//   final OnLayoutValidatorListener? onValidator;
//   final OnLayoutErrorListener? onError;
//   final OnLayoutChangeListener? onChange;
//   final Function(String tag, bool value)? onChecked;
//   final Future<bool> Function(String)? onExecute;
//
//   const MaterialEditText({
//     Key? key,
//     required this.hint,
//     this.id,
//     this.autoFocus = false,
//     this.width,
//     this.hintColor,
//     this.helperText = "",
//     this.helperTextColor,
//     this.floatingLabelColor,
//     this.floatingLabelSize = 12,
//     this.floatingLabelVisible = false,
//     this.border = 0,
//     this.borderColor,
//     this.borderHighlight = true,
//     this.borderRadius = 0,
//     this.enabled = true,
//     this.primary,
//     this.controller,
//     this.text,
//     this.textAlign = TextAlign.start,
//     this.textColor,
//     this.textSize = 18,
//     this.background,
//     this.padding,
//     this.margin,
//     this.errorColor = const Color(0xFFF44336),
//     this.errorVisible = true,
//     this.counterVisible = false,
//     this.digits,
//     this.drawableStart,
//     this.drawableEnd,
//     this.drawablePadding = 24,
//     this.drawableTint,
//     this.inputType = TextInputType.text,
//     this.maxCharacters = 0,
//     this.minCharacters = 0,
//     this.obscureText = false,
//     this.onExecute,
//     this.onChecked,
//     this.onError,
//     this.onValidator,
//     this.onChange,
//   }) : super(key: key);
//
//   @override
//   State<MaterialEditText> createState() => _MaterialEditTextState();
// }
//
// class _MaterialEditTextState extends State<MaterialEditText> {
//   late MaterialEditTextController controller;
//   late TextEditingController editingController;
//
//   bool get hasError => !isValid && controller._error.isNotEmpty;
//
//   bool get isValid => controller.isValid;
//
//   @override
//   void initState() {
//     editingController = TextEditingController();
//     controller = widget.controller ?? MaterialEditTextController();
//     controller._editable.text = widget.text ?? "";
//     controller.id = widget.id;
//     controller.autoFocus = widget.autoFocus;
//     controller.width = widget.width;
//     controller.border = widget.border;
//     controller.borderColor = widget.borderColor;
//     controller.borderHighlight = widget.borderHighlight;
//     controller.primary = widget.primary;
//     controller.background = widget.background;
//     controller.textSize = widget.textSize;
//     controller.textColor = widget.textColor;
//     controller.hint = widget.hint;
//     controller.hintColor = widget.hintColor;
//     controller.helperText = widget.helperText;
//     controller.helperTextColor = widget.helperTextColor;
//     controller.floatingLabelColor = widget.floatingLabelColor;
//     controller.floatingLabelSize = widget.floatingLabelSize;
//     controller.floatingLabelVisible = widget.floatingLabelVisible;
//     controller.textAlign = widget.textAlign;
//     controller.padding = widget.padding;
//     controller.margin = widget.margin;
//     controller.borderRadius = widget.borderRadius;
//     controller.errorVisible = widget.errorVisible;
//     controller.errorColor = widget.errorColor;
//     controller.counterVisible = widget.counterVisible;
//     controller.digits = widget.digits;
//     controller.drawableStart = widget.drawableStart;
//     controller.drawableEnd = widget.drawableEnd;
//     controller.drawablePadding = widget.drawablePadding;
//     controller.drawableTint = widget.drawableTint;
//     controller.inputType = widget.inputType;
//     controller.maxCharacters = widget.maxCharacters;
//     controller.minCharacters = widget.minCharacters;
//     controller.obscureText = widget.obscureText;
//     controller.onChecked = widget.onChecked;
//     controller.onExecute = widget.onExecute;
//     controller.onChange = widget.onChange;
//     controller.onError = widget.onError;
//     controller.onValidator = widget.onValidator;
//     controller.setNotifier(setState);
//     super.initState();
//   }
//
//   @override
//   void didUpdateWidget(covariant MaterialEditText oldWidget) {
//     controller._editable.text = widget.text ?? "";
//     controller.id = widget.id;
//     controller.autoFocus = widget.autoFocus;
//     controller.width = widget.width;
//     controller.border = widget.border;
//     controller.borderColor = widget.borderColor;
//     controller.borderHighlight = widget.borderHighlight;
//     controller.primary = widget.primary;
//     controller.background = widget.background;
//     controller.textSize = widget.textSize;
//     controller.textColor = widget.textColor;
//     controller.hint = widget.hint;
//     controller.hintColor = widget.hintColor;
//     controller.helperText = widget.helperText;
//     controller.helperTextColor = widget.helperTextColor;
//     controller.floatingLabelColor = widget.floatingLabelColor;
//     controller.floatingLabelSize = widget.floatingLabelSize;
//     controller.floatingLabelVisible = widget.floatingLabelVisible;
//     controller.textAlign = widget.textAlign;
//     controller.padding = widget.padding;
//     controller.margin = widget.margin;
//     controller.borderRadius = widget.borderRadius;
//     controller.errorVisible = widget.errorVisible;
//     controller.errorColor = widget.errorColor;
//     controller.counterVisible = widget.counterVisible;
//     controller.digits = widget.digits;
//     controller.drawableStart = widget.drawableStart;
//     controller.drawableEnd = widget.drawableEnd;
//     controller.drawablePadding = widget.drawablePadding;
//     controller.drawableTint = widget.drawableTint;
//     controller.inputType = widget.inputType;
//     controller.maxCharacters = widget.maxCharacters;
//     controller.minCharacters = widget.minCharacters;
//     controller.obscureText = widget.obscureText;
//     controller.onChecked = widget.onChecked;
//     controller.onExecute = widget.onExecute;
//     controller.onChange = widget.onChange;
//     controller.onError = widget.onError;
//     controller.onValidator = widget.onValidator;
//     super.didUpdateWidget(oldWidget);
//   }
//
//   @override
//   void dispose() {
//     controller._dispose();
//     super.dispose();
//   }
//
//   dynamic get iStart =>
//       controller.drawableStart?.drawable(controller.isFocused);
//
//   dynamic get iEnd => controller.drawableEnd?.drawable(controller.isFocused);
//
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final primaryColor = controller.primary ?? theme.primaryColor;
//     const secondaryColor = Color(0xffbbbbbb);
//     const underlineColor = Color(0xffe1e1e1);
//     var drawableTint = controller.drawableTint ??
//         StateValue<Color>(
//           primary: primaryColor,
//           unfocused: secondaryColor,
//         );
//     var style = TextStyle(
//       color: controller.textColor ?? Colors.black,
//       fontSize: controller.textSize,
//     );
//     return GestureDetector(
//       onTap: () => controller._node.requestFocus(),
//       child: AbsorbPointer(
//         child: Container(
//           width: controller.width ?? double.infinity,
//           margin: controller.margin ?? const EdgeInsets.only(bottom: 22),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               SizedBox(
//                 width: double.infinity,
//                 child: _HighlightText(
//                   visible: controller.floatingLabelVisible,
//                   valid: controller.text.isNotEmpty,
//                   text: controller.hint,
//                   textAlign: controller.textAlign,
//                   textSize: controller.floatingLabelSize,
//                   textColor: controller.isFocused
//                       ? primaryColor
//                       : controller.floatingLabelColor ?? secondaryColor,
//                   padding: EdgeInsets.only(
//                     right: 4,
//                     left:
//                     controller.border > 0 ? controller.borderRadius / 2 : 0,
//                   ),
//                 ),
//               ),
//               Container(
//                 padding: controller.padding ??
//                     const EdgeInsets.only(
//                       top: 5,
//                       bottom: 8,
//                     ),
//                 decoration: BoxDecoration(
//                   color: controller.background,
//                   border: controller.border > 0
//                       ? Border.all(
//                     width: controller.borderHighlight
//                         ? controller.isFocused
//                         ? controller.border * 1.5
//                         : controller.border
//                         : controller.border,
//                     color: controller.borderColor ?? primaryColor,
//                   )
//                       : null,
//                   borderRadius: BorderRadius.circular(controller.borderRadius),
//                 ),
//                 child: SizedBox(
//                   width: double.infinity,
//                   child: Row(
//                     children: [
//                       if (controller.drawableStart != null)
//                         _Drawable(
//                           icon: controller.drawableStart!,
//                           size: 24,
//                           focused: controller.isFocused,
//                           tint: drawableTint,
//                           padding: EdgeInsets.only(
//                             right: controller.drawablePadding,
//                           ),
//                         ),
//                       Expanded(
//                         child: Stack(
//                           alignment: Alignment.centerLeft,
//                           children: [
//                             if (controller.text.isEmpty)
//                               SizedBox(
//                                 width: double.infinity,
//                                 child: Text(
//                                   controller.hint,
//                                   textAlign: controller.textAlign,
//                                   style: style.copyWith(
//                                     color:
//                                     controller.hintColor ?? secondaryColor,
//                                     fontFamily: "",
//                                   ),
//                                 ),
//                               ),
//                             EditableText(
//                               textAlign: controller.textAlign,
//                               controller: controller._editable,
//                               focusNode: controller._node,
//                               autofocus: controller.autoFocus,
//                               style: style,
//                               cursorColor: primaryColor,
//                               cursorHeight: controller.textSize,
//                               obscureText: controller.obscureText,
//                               backgroundCursorColor: primaryColor,
//                               onChanged: controller._handleEditingChange,
//                               inputFormatters: controller.formatter,
//                             ),
//                           ],
//                         ),
//                       ),
//                       if (!controller._initial)
//                         isValid && controller.onExecute != null
//                             ? _Loading(
//                           value: controller.text,
//                           onLoading: controller.onExecute,
//                           builder: (value) {
//                             return _Drawable(
//                               icon: controller.drawableEnd!,
//                               size: 24,
//                               focused: controller.isFocused,
//                               selected: isValid,
//                               tint: drawableTint,
//                               padding: EdgeInsets.only(
//                                 left: controller.drawablePadding / 2,
//                               ),
//                               visible: value,
//                             );
//                           },
//                         )
//                             : _Drawable(
//                           icon: controller.drawableEnd!,
//                           size: 24,
//                           focused: controller.isFocused,
//                           selected: isValid,
//                           tint: drawableTint,
//                           visible: isValid,
//                           padding: EdgeInsets.only(
//                             left: controller.drawablePadding / 2,
//                           ),
//                         ),
//                     ],
//                   ),
//                 ),
//               ),
//               _Underline(
//                 visible:
//                 controller.background == null && controller.border <= 0,
//                 focused: controller.isFocused,
//                 enabled: controller.enabled,
//                 error: hasError,
//                 height: 1,
//                 primary: primaryColor,
//                 colorState: StateValue(
//                   primary: primaryColor,
//                   error: controller.errorColor,
//                   unfocused: underlineColor,
//                   disabled: underlineColor,
//                 ),
//               ),
//               SizedBox(
//                 width: double.infinity,
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     _HighlightText(
//                       text:
//                       hasError ? controller._error : controller.helperText,
//                       textAlign: TextAlign.start,
//                       textSize: controller.floatingLabelSize,
//                       textColor: !hasError
//                           ? controller.helperTextColor ?? secondaryColor
//                           : controller.errorColor,
//                       valid: hasError || controller.helperText.isNotEmpty,
//                       visible: hasError || controller.helperText.isNotEmpty,
//                       padding: EdgeInsets.only(
//                         top: 4,
//                         bottom: 4,
//                         right: 4,
//                         left: controller.border > 0
//                             ? controller.borderRadius / 2
//                             : 0,
//                       ),
//                     ),
//                     _HighlightText(
//                       text: controller.counter,
//                       textAlign: TextAlign.end,
//                       textSize: controller.floatingLabelSize,
//                       textColor:
//                       hasError ? controller.errorColor : secondaryColor,
//                       valid: controller.counterVisible && controller.isFocused,
//                       visible: controller.counterVisible,
//                       padding: EdgeInsets.only(
//                         top: 4,
//                         bottom: 4,
//                         left: 4,
//                         right: controller.border > 0
//                             ? controller.borderRadius / 2
//                             : 0,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class _HighlightText extends StatelessWidget {
//   final bool valid;
//   final bool visible;
//   final String text;
//   final TextAlign? textAlign;
//   final Color? textColor;
//   final double textSize;
//   final EdgeInsetsGeometry? padding;
//
//   const _HighlightText({
//     Key? key,
//     required this.text,
//     this.textAlign,
//     this.textColor,
//     this.textSize = 12,
//     this.valid = false,
//     this.visible = true,
//     this.padding,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Visibility(
//       visible: visible,
//       child: Container(
//         padding: padding ??
//             const EdgeInsets.symmetric(
//               vertical: 4,
//             ),
//         child: Text(
//           text,
//           textAlign: textAlign,
//           style: TextStyle(
//             color: valid ? textColor ?? AppColors.grey : Colors.transparent,
//             fontFamily: "",
//             fontSize: textSize,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class _Underline extends StatelessWidget {
//   final Color? primary;
//   final bool visible;
//   final bool enabled;
//   final bool focused;
//   final bool error;
//   final double height;
//   final StateValue<Color>? colorState;
//
//   const _Underline({
//     Key? key,
//     this.primary,
//     this.visible = true,
//     this.enabled = true,
//     this.focused = false,
//     this.error = false,
//     this.colorState,
//     this.height = 1,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final color = colorState ??
//         StateValue<Color?>(
//           primary: primary,
//           unfocused: AppColors.grey.withOpacity(0.2),
//           disabled: AppColors.grey.withOpacity(0.2),
//         );
//     return Visibility(
//       visible: visible,
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               color: color.typed(
//                 enabled
//                     ? error
//                     ? StateType.error
//                     : focused
//                     ? StateType.focused
//                     : StateType.unfocused
//                     : StateType.disabled,
//               ),
//             ),
//             height: focused ? height * 2 : height,
//           ),
//           SizedBox(
//             height: focused ? 0 : height,
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class _Drawable extends StatelessWidget {
//   final bool focused;
//   final bool? selected;
//   final MaterialIconData icon;
//   final double size;
//   final StateValue<Color>? tint;
//   final EdgeInsetsGeometry? padding;
//   final bool visible;
//
//   const _Drawable({
//     Key? key,
//     required this.icon,
//     this.focused = false,
//     this.selected,
//     this.size = 24,
//     this.tint,
//     this.padding,
//     this.visible = true,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final color = tint ??
//         StateValue(
//           primary: Theme.of(context).primaryColor,
//           unfocused: AppColors.grey,
//         );
//     final drawable = icon.drawable(selected ?? focused);
//     return Visibility(
//       visible: visible,
//       child: Container(
//         margin: padding,
//         width: size,
//         height: size,
//         child: FittedBox(
//           child: drawable is String
//               ? SvgPicture.asset(
//             drawable,
//             color: color.focused(focused),
//           )
//               : drawable is IconData
//               ? Icon(
//             drawable,
//             color: color.focused(focused),
//           )
//               : null,
//         ),
//       ),
//     );
//   }
// }
//
// class _Loading extends StatelessWidget {
//   final String value;
//   final Widget Function(bool value) builder;
//   final Future<bool> Function(String value)? onLoading;
//
//   const _Loading({
//     Key? key,
//     required this.builder,
//     this.value = "",
//     this.onLoading,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<bool>(
//       future: onLoading?.call(value),
//       builder: (context, state) {
//         switch (state.connectionState) {
//           case ConnectionState.done:
//           case ConnectionState.none:
//           case ConnectionState.active:
//             return builder.call(state.data ?? false);
//           case ConnectionState.waiting:
//             return Container(
//               width: 24,
//               height: 24,
//               padding: const EdgeInsets.all(3),
//               child: const CircularProgressIndicator(strokeWidth: 2),
//             );
//         }
//       },
//     );
//   }
// }
//
// class MaterialEditTextController extends LayoutController {
//   late TextEditingController _editable;
//   late FocusNode _node;
//   bool? _focused;
//   bool _initial = true;
//   String _error = "";
//
//   String? id;
//   bool autoFocus = false;
//   double? width;
//   double border = 0;
//   Color? borderColor;
//   bool borderHighlight = true;
//   Color? primary;
//   Color? background;
//   double textSize = 18;
//   Color? textColor;
//   String hint = "";
//   Color? hintColor;
//   String helperText = "";
//   Color? helperTextColor;
//   Color? floatingLabelColor;
//   double floatingLabelSize = 12;
//   bool floatingLabelVisible = false;
//   TextAlign textAlign = TextAlign.start;
//   EdgeInsetsGeometry? padding, margin;
//   double borderRadius = 0;
//   bool errorVisible = false;
//   Color? errorColor = const Color(0xFFF44336);
//   bool counterVisible = false;
//   String? digits;
//   MaterialIconData? drawableStart;
//   MaterialIconData? drawableEnd;
//   double drawablePadding = 24;
//   StateValue<Color>? drawableTint;
//   TextInputType inputType = TextInputType.text;
//   int maxCharacters = 0;
//   int minCharacters = 0;
//   bool obscureText = false;
//
//   late Function(String tag, bool valid)? onChecked;
//   late Future<bool> Function(String)? onExecute;
//
//   MaterialEditTextController() {
//     _editable = TextEditingController();
//     _node = FocusNode();
//     _node.addListener(_handleFocusChange);
//   }
//
//   bool get isFocused => _focused ?? false;
//
//   set text(String? value) => _editable.text = value ?? "";
//
//   String get text => _editable.text;
//
//   bool get isValid {
//     final v = onValidator?.call(_editable.text);
//     onValid?.call(v ?? false);
//     return v ?? true;
//   }
//
//   void _handleFocusChange() {
//     if (_node.hasFocus != _focused) {
//       _focused = _node.hasFocus;
//       notify;
//     }
//   }
//
//   void _handleEditingChange(String value) {
//     _initial = false;
//     onChange?.call(value);
//     _error = onError?.call(errorType(value)) ?? "";
//     onChecked?.call(id ?? "$hashCode", isValid);
//     notify;
//   }
//
//   Error errorType(String text) {
//     if (text.isEmpty && !_initial) {
//       return Error.empty;
//     } else if (!isValid) {
//       final length = text.length;
//       if (maxCharacters > 0 && maxCharacters < length) {
//         return Error.maximum;
//       } else if (minCharacters > 0 && minCharacters > length) {
//         return Error.minimum;
//       } else {
//         return Error.invalid;
//       }
//     } else {
//       return Error.none;
//     }
//   }
//
//   String get counter {
//     var currentLength = text.length;
//     final maxLength = maxCharacters;
//     return maxLength > 0
//         ? '$currentLength / $maxLength'
//         : currentLength > 0
//         ? "$currentLength"
//         : "";
//   }
//
//   List<TextInputFormatter>? get formatter {
//     final digit = digits ?? "";
//     if (digit.isNotEmpty) {
//       return [
//         FilteringTextInputFormatter.allow(RegExp("[$digit]")),
//       ];
//     }
//     return null;
//   }
//
//   void _dispose() {
//     _editable.dispose();
//     _node.dispose();
//   }
// }