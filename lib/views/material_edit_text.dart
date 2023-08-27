part of '../widgets.dart';

class MaterialEditText extends EditText<MaterialEditTextController> {
  /// HELPER TEXT PROPERTIES
  final String helperText;
  final Color? helperTextColor;

  /// FLOATING TEXT PROPERTIES
  final Color? floatingLabelColor;
  final double floatingLabelSize;
  final bool floatingLabelVisible;

  /// ERROR TEXT PROPERTIES
  final bool errorVisible;
  final Color? errorColor;

  /// COUNTER TEXT PROPERTIES
  final bool counterVisible;

  /// INDICATOR PROPERTIES
  final Future<bool> Function(String)? onExecute;

  const MaterialEditText({
    /// SUPER PROPERTIES
    super.key,
    super.absorbMode,
    super.activated,
    super.animation,
    super.animationType,
    super.background,
    super.backgroundState,
    super.backgroundBlendMode,
    super.backgroundGradient,
    super.backgroundGradientState,
    super.backgroundImage,
    super.backgroundImageState,
    super.border,
    super.borderHorizontal,
    super.borderVertical,
    super.borderTop,
    super.borderBottom,
    super.borderStart,
    super.borderEnd,
    super.borderColor,
    super.borderGradient,
    super.borderRadius,
    super.borderRadiusBL,
    super.borderRadiusBR,
    super.borderRadiusTL,
    super.borderRadiusTR,
    super.clipBehavior,
    super.controller,
    super.dimensionRatio,
    super.elevation,
    super.enabled,
    super.expandable,
    super.foreground,
    super.foregroundBlendMode,
    super.foregroundGradient,
    super.foregroundImage,
    super.flex,
    super.gravity,
    super.height,
    super.heightMax,
    super.heightMin,
    super.hoverColor,
    super.margin,
    super.marginHorizontal,
    super.marginVertical,
    super.marginTop,
    super.marginBottom,
    super.marginStart,
    super.marginEnd,
    super.orientation,
    super.padding,
    super.paddingHorizontal,
    super.paddingVertical,
    super.paddingTop,
    super.paddingBottom,
    super.paddingStart,
    super.paddingEnd,
    super.position,
    super.positionType,
    super.pressedColor,
    super.rippleColor,
    super.scrollable,
    super.scrollController,
    super.scrollingType,
    super.shadow,
    super.shadowBlurRadius,
    super.shadowBlurStyle,
    super.shadowColor,
    super.shadowType,
    super.shadowSpreadRadius,
    super.shadowHorizontal,
    super.shadowVertical,
    super.shadowStart,
    super.shadowEnd,
    super.shadowTop,
    super.shadowBottom,
    super.shape,
    super.transform,
    super.transformGravity,
    super.width,
    super.widthMax,
    super.widthMin,
    super.visibility,
    super.maxCharacters,
    super.maxLines,
    super.letterSpacing,
    super.lineSpacingExtra,
    super.locale,
    super.wordSpacing,
    super.textFontFamily,
    super.textFontStyle,
    super.textFontWeight,
    super.selectionColor,
    super.strutStyle,
    super.text,
    super.textAlign,
    super.textAllCaps,
    super.textColor,
    super.textHeightBehavior,
    super.textOverflow,
    super.textScaleFactor,
    super.textSize,
    super.textStyle,
    super.textWidthBasis,
    super.onChange,
    super.onError,
    super.onValid,
    super.onValidator,

    /// SUPER BASE PROPERTIES
    super.id,
    super.digits = "",
    super.hint = "",
    super.hintColor,
    super.primary,
    super.minCharacters,

    /// SUPER DRAWABLE PROPERTIES
    super.drawableStart,
    super.drawableStartState,
    super.drawableStartBuilder,
    super.drawableStartSize,
    super.drawableStartSizeState,
    super.drawableStartPadding,
    super.drawableStartPaddingState,
    super.drawableStartTint,
    super.drawableStartTintState,
    super.drawableStartVisible = true,
    super.drawableEnd,
    super.drawableEndState,
    super.drawableEndBuilder,
    super.drawableEndSize,
    super.drawableEndSizeState,
    super.drawableEndPadding,
    super.drawableEndPaddingState,
    super.drawableEndTint,
    super.drawableEndTintState,
    super.drawableEndVisible = true,

    /// SUPER INDICATOR PROPERTIES
    super.indicator,
    super.indicatorSize = 24,
    super.indicatorStrokeColor,
    super.indicatorStrokeColorState,
    super.indicatorStroke = 2,
    super.indicatorStrokeBackground,
    super.indicatorStrokeBackgroundState,
    super.indicatorVisible = false,

    /// SUPER EDITING PROPERTIES
    super.autocorrect = true,
    super.autofillHints = const [],
    super.autoFocus = false,
    super.clipBehaviorText = Clip.hardEdge,
    super.cursorColor,
    super.cursorHeight,
    super.cursorOpacityAnimates = false,
    super.cursorRadius,
    super.cursorWidth = 2,
    super.contentInsertionConfiguration,
    super.dragStartBehavior = DragStartBehavior.start,
    super.enableIMEPersonalizedLearning = true,
    super.enableInteractiveSelection,
    super.enableSuggestions = true,
    super.expands = false,
    super.inputType,
    super.keyboardAppearance = Brightness.light,
    super.magnifierConfiguration = TextMagnifierConfiguration.disabled,
    super.minLines,
    super.mouseCursor,
    super.obscureText,
    super.obscuringCharacter = '•',
    super.readOnly = false,
    super.restorationId,
    super.scribbleEnabled = true,
    super.scrollControllerText,
    super.scrollPaddingText = const EdgeInsets.all(20),
    super.scrollPhysicsText,
    super.selectionControls,
    super.selectionHeightStyle = BoxHeightStyle.tight,
    super.selectionWidthStyle = BoxWidthStyle.tight,
    super.showCursor,
    super.smartDashesType,
    super.smartQuotesType,
    super.spellCheckConfiguration,
    super.textCapitalization = TextCapitalization.none,
    super.textInputAction,
    super.undoController,

    /// SUPER CALLBACK AND LISTENING PROPERTIES
    super.onAppPrivateCommand,
    super.onChecked,
    super.onEditingComplete,
    super.onSubmitted,
    super.onTapOutside,

    /// HELPER TEXT PROPERTIES
    this.helperText = "",
    this.helperTextColor,
    this.floatingLabelColor,
    this.floatingLabelSize = 12,
    this.floatingLabelVisible = false,

    /// ERROR TEXT PROPERTIES
    this.errorColor = const Color(0xFFF44336),
    this.errorVisible = true,
    this.counterVisible = false,

    /// INDICATOR PROPERTIES
    this.onExecute,
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
  Widget build(
    BuildContext context,
    MaterialEditTextController controller,
    Widget parent,
  ) {
    final hasError = controller.hasError;
    final theme = Theme.of(context);
    final primaryColor = controller.primary ?? theme.primaryColor;
    const secondaryColor = Color(0xffbbbbbb);
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
        super.build(context, controller, parent),
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

class MaterialEditTextController extends EditTextController {
  String _error = "";

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

  MaterialEditTextController fromMaterialEditText(MaterialEditText view) {
    super.fromEditText(view);
    helperText = view.helperText;
    helperTextColor = view.helperTextColor;
    floatingLabelColor = view.floatingLabelColor;
    floatingLabelSize = view.floatingLabelSize;
    floatingLabelVisible = view.floatingLabelVisible;
    errorVisible = view.errorVisible;
    errorColor = view.errorColor;
    counterVisible = view.counterVisible;
    onExecute = view.onExecute;
    onChange = view.onChange;
    onError = view.onError;
    onValidator = view.onValidator;
    return this;
  }

  bool get hasError => !isValid && _error.isNotEmpty;

  bool get isValid {
    final v = onValidator?.call(_editable.text);
    onValid?.call(v ?? false);
    return v ?? true;
  }

  dynamic get iStart => drawableStart?.drawable(isFocused);

  dynamic get iEnd => drawableEnd?.drawable(isFocused);

  ViewError errorType(String text) {
    if (text.isEmpty && !_initial) {
      return ViewError.empty;
    } else if (!isValid) {
      final length = text.length;
      if (maxCharacters > 0 && maxCharacters < length) {
        return ViewError.maximum;
      } else if ((minCharacters ?? 0) > 0 && (minCharacters ?? 0) > length) {
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
