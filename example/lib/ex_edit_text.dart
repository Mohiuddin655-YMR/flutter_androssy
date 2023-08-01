import 'package:flutter/material.dart';
import 'package:flutter_androssy/widgets.dart';

class ExEditText extends EditText<ExEditTextController> {
  final String helperText;
  final Color? helperTextColor;
  final Color? floatingLabelColor;
  final double floatingLabelSize;
  final bool floatingLabelVisible;
  final bool errorVisible;
  final Color? errorColor;
  final bool counterVisible;
  final double drawablePadding;
  final ValueState<Color>? drawableTint;

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
    super.hint,
    super.id,
    super.autoFocus = false,
    super.hintColor,
    this.helperText = "",
    this.helperTextColor,
    this.floatingLabelColor,
    this.floatingLabelSize = 12,
    this.floatingLabelVisible = false,
    super.primary,
    super.text,
    super.textAlign = TextAlign.start,
    super.textColor,
    super.textSize = 18,
    this.errorColor = const Color(0xFFF44336),
    this.errorVisible = true,
    this.counterVisible = false,
    super.digits,
    super.drawableStart,
    super.drawableEnd,
    this.drawablePadding = 24,
    this.drawableTint,
    super.inputType = TextInputType.text,
    super.maxCharacters = 0,
    super.minCharacters = 0,
    super.obscureText = false,
    this.onExecute,
    super.onChecked,
  });

  @override
  ExEditTextController initController() => ExEditTextController();

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
    final hasError = controller.hasError;

    return LinearLayout(
      children: [
        /// Highlight Text
        TextView(
          controller: controller.tvHighlight,
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

        /// Edit field
        EditText(
          controller: controller,
          hint: controller.hint,
        ),

        /// BOTTOM
        LinearLayout(
          controller: controller.llBottom,
          width: double.infinity,
          orientation: Axis.horizontal,
          crossGravity: CrossAxisAlignment.center,
          mainGravity: MainAxisAlignment.spaceBetween,
          children: [
            TextView(
              flex: 1,
              controller: controller.tvHelper,
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
              controller: controller.tvCounter,
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
}

class ExEditTextController extends EditTextController {
  late ViewController underline;
  late TextViewController tvCounter, tvHelper, tvHighlight, tvHint;
  late LinearLayoutController llBottom;
  final String _error = "";

  String helperText = "";
  Color? helperTextColor;
  Color? floatingLabelColor;
  double floatingLabelSize = 12;
  bool floatingLabelVisible = false;
  bool errorVisible = false;
  Color? errorColor = const Color(0xFFF44336);
  bool counterVisible = false;
  double drawablePadding = 24;
  ValueState<Color>? drawableTint;

  late Future<bool> Function(String)? onExecute;

  ExEditTextController() {
    underline = ViewController();
    tvCounter = TextViewController();
    tvHelper = TextViewController();
    tvHighlight = TextViewController();
    tvHint = TextViewController();
    llBottom = LinearLayoutController();
  }

  ExEditTextController fromMaterialEditText(ExEditText view) {
    super.fromEditText(view);
    helperText = view.helperText;
    helperTextColor = view.helperTextColor;
    floatingLabelColor = view.floatingLabelColor;
    floatingLabelSize = view.floatingLabelSize;
    floatingLabelVisible = view.floatingLabelVisible;
    errorVisible = view.errorVisible;
    errorColor = view.errorColor;
    counterVisible = view.counterVisible;
    onError = view.onError;
    onExecute = view.onExecute;
    return this;
  }

  bool get hasError => !isValid && _error.isNotEmpty;

  dynamic get iStart => drawableStart?.drawable(isFocused);

  dynamic get iEnd => drawableEnd?.drawable(isFocused);

  var isValid = false;

  ViewError errorType(String text) {
    if (text.isEmpty && !isInitial) {
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

  @override
  int get minCharacters => super.minCharacters ?? 0;
}
