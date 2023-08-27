part of '../widgets.dart';

typedef EditTextDrawableBuilder<T extends EditTextController> = Widget Function(
  BuildContext context,
  T controller,
);

typedef EditTextContextMenuBuilder = Widget Function(
  BuildContext context,
  EditableTextState state,
);

typedef EditTextPrivateCommandListener = void Function(
  String value,
  Map<String, dynamic> params,
);

typedef EditTextVoidListener = void Function();
typedef EditTextCheckingListener = Function(String tag, bool valid);
typedef EditTextSelectionChangeListener = void Function(
  TextSelection selection,
  SelectionChangedCause? cause,
);
typedef EditTextSubmitListener = void Function(String value);
typedef EditTextTapOutsideListener = void Function(PointerDownEvent event);

class EditText<T extends EditTextController> extends TextView<T> {
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

  /// BASE PROPERTIES
  final String? id;
  final String digits;
  final String hint;
  final Color? hintColor;
  final Color? primary;
  final int? minCharacters;

  /// DRAWABLE PROPERTIES
  final dynamic drawableStart;
  final ValueState<dynamic>? drawableStartState;
  final EditTextDrawableBuilder<T>? drawableStartBuilder;
  final double? drawableStartSize;
  final ValueState<double>? drawableStartSizeState;
  final double? drawableStartPadding;
  final ValueState<double>? drawableStartPaddingState;
  final Color? drawableStartTint;
  final ValueState<Color>? drawableStartTintState;
  final bool drawableStartVisible;
  final dynamic drawableEnd;
  final ValueState<dynamic>? drawableEndState;
  final EditTextDrawableBuilder<T>? drawableEndBuilder;
  final double? drawableEndSize;
  final ValueState<double>? drawableEndSizeState;
  final double? drawableEndPadding;
  final ValueState<double>? drawableEndPaddingState;
  final Color? drawableEndTint;
  final ValueState<Color>? drawableEndTintState;
  final bool drawableEndVisible;

  /// INDICATOR PROPERTIES
  final Widget? indicator;
  final double indicatorSize;
  final Color? indicatorStrokeColor;
  final ValueState<Color>? indicatorStrokeColorState;
  final double indicatorStroke;
  final Color? indicatorStrokeBackground;
  final ValueState<Color>? indicatorStrokeBackgroundState;
  final bool indicatorVisible;

  /// EDITING PROPERTIES
  final bool autocorrect;
  final List<String> autofillHints;
  final bool autoFocus;
  final Clip clipBehaviorText;
  final Color? cursorColor;
  final double? cursorHeight;
  final bool cursorOpacityAnimates;
  final Radius? cursorRadius;
  final double cursorWidth;
  final ContentInsertionConfiguration? contentInsertionConfiguration;
  final EditTextContextMenuBuilder? contextMenuBuilder;
  final DragStartBehavior dragStartBehavior;
  final bool enableIMEPersonalizedLearning;
  final bool? enableInteractiveSelection;
  final bool enableSuggestions;
  final bool expands;
  final TextInputType? inputType;
  final Brightness keyboardAppearance;
  final TextMagnifierConfiguration magnifierConfiguration;
  final int? minLines;
  final MouseCursor? mouseCursor;
  final bool? obscureText;
  final String obscuringCharacter;
  final bool readOnly;
  final String? restorationId;
  final bool scribbleEnabled;
  final ScrollController? scrollControllerText;
  final EdgeInsets scrollPaddingText;
  final ScrollPhysics? scrollPhysicsText;
  final TextSelectionControls? selectionControls;
  final BoxHeightStyle selectionHeightStyle;
  final BoxWidthStyle selectionWidthStyle;
  final bool? showCursor;
  final SmartDashesType? smartDashesType;
  final SmartQuotesType? smartQuotesType;
  final SpellCheckConfiguration? spellCheckConfiguration;
  final TextCapitalization textCapitalization;
  final TextInputAction? textInputAction;
  final UndoHistoryController? undoController;

  /// LISTENER & CALLBACKS
  final EditTextPrivateCommandListener? onAppPrivateCommand;
  final EditTextCheckingListener? onChecked;
  final EditTextVoidListener? onEditingComplete;
  final EditTextSubmitListener? onSubmitted;
  final EditTextTapOutsideListener? onTapOutside;

  const EditText({
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

    /// BASE PROPERTIES
    this.id,
    this.digits = "",
    this.hint = "",
    this.hintColor,
    this.primary,
    this.minCharacters,

    /// DRAWABLE PROPERTIES
    this.drawableStart,
    this.drawableStartState,
    this.drawableStartBuilder,
    this.drawableStartSize,
    this.drawableStartSizeState,
    this.drawableStartPadding,
    this.drawableStartPaddingState,
    this.drawableStartTint,
    this.drawableStartTintState,
    this.drawableStartVisible = true,
    this.drawableEnd,
    this.drawableEndState,
    this.drawableEndBuilder,
    this.drawableEndSize,
    this.drawableEndSizeState,
    this.drawableEndPadding,
    this.drawableEndPaddingState,
    this.drawableEndTint,
    this.drawableEndTintState,
    this.drawableEndVisible = true,

    /// INDICATOR PROPERTIES
    this.indicator,
    this.indicatorSize = 24,
    this.indicatorStrokeColor,
    this.indicatorStrokeColorState,
    this.indicatorStroke = 2,
    this.indicatorStrokeBackground,
    this.indicatorStrokeBackgroundState,
    this.indicatorVisible = false,

    /// EDITING PROPERTIES
    this.autocorrect = true,
    this.autofillHints = const [],
    this.autoFocus = false,
    this.clipBehaviorText = Clip.hardEdge,
    this.cursorColor,
    this.cursorHeight,
    this.cursorOpacityAnimates = false,
    this.cursorRadius,
    this.cursorWidth = 2,
    this.contentInsertionConfiguration,
    this.contextMenuBuilder = _defaultContextMenuBuilder,
    this.dragStartBehavior = DragStartBehavior.start,
    this.enableIMEPersonalizedLearning = true,
    this.enableInteractiveSelection,
    this.enableSuggestions = true,
    this.expands = false,
    this.inputType,
    this.keyboardAppearance = Brightness.light,
    this.magnifierConfiguration = TextMagnifierConfiguration.disabled,
    this.minLines,
    this.mouseCursor,
    this.obscureText,
    this.obscuringCharacter = '•',
    this.readOnly = false,
    this.restorationId,
    this.scribbleEnabled = true,
    this.scrollControllerText,
    this.scrollPaddingText = const EdgeInsets.all(20),
    this.scrollPhysicsText,
    this.selectionControls,
    this.selectionHeightStyle = BoxHeightStyle.tight,
    this.selectionWidthStyle = BoxWidthStyle.tight,
    this.showCursor,
    this.smartDashesType,
    this.smartQuotesType,
    this.spellCheckConfiguration,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction,
    this.undoController,

    /// CALLBACK AND LISTENING PROPERTIES
    this.onAppPrivateCommand,
    this.onChecked,
    this.onEditingComplete,
    this.onSubmitted,
    this.onTapOutside,
  });

  @override
  ViewRoots initRootProperties() => const ViewRoots(
        observer: false,
        padding: false,
      );

  @override
  T initController() => EditTextController() as T;

  @override
  T attachController(T controller) => controller.fromEditText(this) as T;

  @override
  void onDispose(T controller) => controller._dispose();

  static Widget _defaultContextMenuBuilder(
    BuildContext context,
    EditableTextState editableTextState,
  ) {
    return AdaptiveTextSelectionToolbar.editableText(
      editableTextState: editableTextState,
    );
  }

  @visibleForTesting
  static Widget defaultSpellCheckSuggestionsToolbarBuilder(
    BuildContext context,
    EditableTextState editableTextState,
  ) {
    switch (defaultTargetPlatform) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return CupertinoSpellCheckSuggestionsToolbar.editableText(
          editableTextState: editableTextState,
        );
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return SpellCheckSuggestionsToolbar.editableText(
          editableTextState: editableTextState,
        );
    }
  }

  static SpellCheckConfiguration inferAndroidSpellCheckConfiguration(
    SpellCheckConfiguration? configuration,
  ) {
    if (configuration == null ||
        configuration == const SpellCheckConfiguration.disabled()) {
      return const SpellCheckConfiguration.disabled();
    }
    return configuration.copyWith(
      misspelledTextStyle: configuration.misspelledTextStyle ??
          TextField.materialMisspelledTextStyle,
      spellCheckSuggestionsToolbarBuilder:
          configuration.spellCheckSuggestionsToolbarBuilder ??
              defaultSpellCheckSuggestionsToolbarBuilder,
    );
  }

  @override
  Widget? attach(BuildContext context, T controller) {
    final theme = Theme.of(context);
    final primaryColor = controller.primary ?? theme.primaryColor;
    const underlineColor = Color(0xffe1e1e1);
    const secondaryColor = Color(0xffbbbbbb);
    final hasError = controller.hasError;

    var style = TextStyle(
      color: controller.textColor ?? Colors.black,
      fontSize: controller.textSize ?? 18,
      height: 1.2,
    );
    var colors = ValueState(
      primary: secondaryColor,
      secondary: primaryColor,
      disable: secondaryColor,
      ternary: secondaryColor,
      error: const Color(0xFFF44336),
    );

    var defaultColor = colors.fromController(controller);

    Widget child = Padding(
      padding: controller.padding ?? EdgeInsets.zero,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Builder(
            builder: (context) {
              if (drawableStartBuilder != null) {
                return drawableStartBuilder!(context, controller);
              } else {
                return IconView(
                  visibility: controller.drawableStart != null,
                  icon: controller.drawableStart,
                  size: controller.drawableStartSize,
                  tint: controller.drawableStartTint ?? defaultColor,
                  marginEnd: controller.drawableStartPadding ?? 12,
                );
              }
            },
          ),
          Expanded(
            child: TextField(
              canRequestFocus: true,
              enabled: controller.enabled,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
                isDense: true,
                isCollapsed: true,
                hintText: controller.hint,
                hintStyle: style.copyWith(
                  fontFamily: "",
                  color: controller.text.isNotEmpty
                      ? Colors.transparent
                      : controller.hintColor ?? secondaryColor,
                ),
              ),
              autocorrect: controller.autocorrect,
              autofillHints: controller.autofillHints,
              autofocus: controller.autoFocus,
              clipBehavior: controller.clipBehaviorText,
              controller: controller._editable,
              cursorColor: controller.cursorColor ?? primaryColor,
              cursorHeight: controller.cursorHeight,
              cursorOpacityAnimates: controller.cursorOpacityAnimates,
              cursorRadius: controller.cursorRadius,
              cursorWidth: controller.cursorWidth,
              contentInsertionConfiguration:
              controller.contentInsertionConfiguration,
              contextMenuBuilder: controller.contextMenuBuilder,
              dragStartBehavior: controller.dragStartBehavior,
              enableIMEPersonalizedLearning:
              controller.enableIMEPersonalizedLearning,
              enableInteractiveSelection: controller.enableInteractiveSelection,
              enableSuggestions: controller.enableSuggestions,
              expands: controller.expands,
              focusNode: controller._node,
              inputFormatters: controller.formatter,
              keyboardAppearance: controller.keyboardAppearance,
              keyboardType: controller.inputType,
              maxLines: controller.maxLines,
              magnifierConfiguration: controller.magnifierConfiguration,
              minLines: controller.minLines,
              mouseCursor: controller.mouseCursor,
              obscureText: controller.obscureText,
              obscuringCharacter: controller.obscuringCharacter,
              onAppPrivateCommand: controller.onAppPrivateCommand,
              onChanged: controller._handleEditingChange,
              onEditingComplete: controller.onEditingComplete,
              onSubmitted: controller.onSubmitted,
              onTapOutside: controller.onTapOutside,
              readOnly: controller.isReadMode,
              restorationId: controller.restorationId,
              scribbleEnabled: controller.scribbleEnabled,
              scrollController: controller.scrollControllerText,
              scrollPadding: controller.scrollPaddingText,
              scrollPhysics: controller.scrollPhysicsText,
              selectionControls: controller.selectionControls,
              selectionHeightStyle: controller.selectionHeightStyle,
              selectionWidthStyle: controller.selectionWidthStyle,
              showCursor: controller.showCursor,
              smartDashesType: controller.smartDashesType,
              smartQuotesType: controller.smartQuotesType,
              spellCheckConfiguration: controller.spellCheckConfiguration,
              strutStyle: controller.strutStyle,
              style: style,
              textAlign: controller.textAlign ?? TextAlign.start,
              textCapitalization: controller.textCapitalization,
              textDirection: controller.textDirection,
              textInputAction: controller.textInputAction,
              undoController: controller.undoController,
            ),
          ),
          Builder(
            builder: (context) {
              if (controller.indicatorVisible) {
                return Container(
                  width: controller.indicatorSize,
                  height: controller.indicatorSize,
                  padding: EdgeInsets.all(controller.indicatorSize * 0.05),
                  child: CircularProgressIndicator(
                    strokeWidth: controller.indicatorStroke,
                    color: controller.indicatorStrokeColor ?? defaultColor,
                    backgroundColor: controller.indicatorStrokeBackground ??
                        defaultColor?.withOpacity(0.1),
                  ),
                );
              } else if (drawableEndBuilder != null) {
                return drawableEndBuilder!(context, controller);
              } else {
                return IconView(
                  visibility: controller.drawableEnd != null,
                  icon: controller.drawableEnd,
                  size: controller.drawableEndSize,
                  tint: controller.drawableEndTint ?? defaultColor,
                  marginStart: controller.drawableEndPadding ?? 4,
                );
              }
            },
          ),
        ],
      ),
    );

    return GestureDetector(
      onTap: () => controller.showKeyboard(context),
      child: controller.isUnderlineHide
          ? child
          : Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: _EditTextHighlightText(
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
                child,
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
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _EditTextHighlightText(
                        text: hasError
                            ? controller._error
                            : controller.helperText,
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
                      _EditTextHighlightText(
                        text: controller.counter,
                        textAlign: TextAlign.end,
                        textSize: controller.floatingLabelSize,
                        textColor:
                            hasError ? controller.errorColor : secondaryColor,
                        valid:
                            controller.counterVisible && controller.isFocused,
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
            ),
    );
  }
}


class _EditTextHighlightText extends StatelessWidget {
  final bool valid;
  final bool visible;
  final String text;
  final TextAlign? textAlign;
  final Color? textColor;
  final double textSize;
  final EdgeInsetsGeometry? padding;

  const _EditTextHighlightText({
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


class EditTextController extends TextViewController {
  late TextEditingController _editable;
  late FocusNode _node;

  EditTextController() {
    _editable = TextEditingController();
    _node = FocusNode();
    _node.addListener(_handleFocusChange);
  }

  EditTextController fromEditText(EditText view) {
    super.fromTextView(view);

    helperText = view.helperText;
    helperTextColor = view.helperTextColor;
    floatingLabelColor = view.floatingLabelColor;
    floatingLabelSize = view.floatingLabelSize;
    floatingLabelVisible = view.floatingLabelVisible;
    errorVisible = view.errorVisible;
    errorColor = view.errorColor;
    counterVisible = view.counterVisible;
    onChange = view.onChange;
    onError = view.onError;
    onValidator = view.onValidator;

    /// BASE PROPERTIES
    id = view.id;
    digits = view.digits;
    hint = view.hint;
    hintColor = view.hintColor;
    primary = view.primary;
    maxCharacters = view.maxCharacters ?? 0;
    minCharacters = view.minCharacters ?? 0;

    /// DRAWABLE PROPERTIES
    drawableStart = view.drawableStart;
    drawableStartState = view.drawableStartState;
    drawableStartSize = view.drawableStartSize;
    drawableStartSizeState = view.drawableStartSizeState;
    drawableStartPadding = view.drawableStartPadding;
    drawableStartPaddingState = view.drawableStartPaddingState;
    drawableStartTint = view.drawableStartTint;
    drawableStartTintState = view.drawableStartTintState;
    drawableStartVisible = view.drawableStartVisible;
    drawableEnd = view.drawableEnd;
    drawableEndState = view.drawableEndState;
    drawableEndSize = view.drawableEndSize;
    drawableEndSizeState = view.drawableEndSizeState;
    drawableEndPadding = view.drawableEndPadding;
    drawableEndPaddingState = view.drawableEndPaddingState;
    drawableEndTint = view.drawableEndTint;
    drawableEndTintState = view.drawableEndTintState;
    drawableEndVisible = view.drawableEndVisible;

    /// INDICATOR PROPERTIES
    indicator = view.indicator;
    indicatorSize = view.indicatorSize;
    indicatorStroke = view.indicatorStroke;
    indicatorStrokeColor = view.indicatorStrokeColor;
    indicatorStrokeColorState = view.indicatorStrokeColorState;
    indicatorStrokeBackground = view.indicatorStrokeBackground;
    indicatorStrokeBackgroundState = view.indicatorStrokeBackgroundState;
    indicatorVisible = view.indicatorVisible;

    /// EDITING PROPERTIES
    autocorrect = view.autocorrect;
    autofillHints = view.autofillHints;
    autoFocus = view.autoFocus;
    clipBehaviorText = view.clipBehaviorText;
    cursorColor = view.cursorColor;
    cursorHeight = view.cursorHeight;
    cursorOpacityAnimates = view.cursorOpacityAnimates;
    cursorRadius = view.cursorRadius;
    cursorWidth = view.cursorWidth;
    contentInsertionConfiguration = view.contentInsertionConfiguration;
    contextMenuBuilder = view.contextMenuBuilder;
    dragStartBehavior = view.dragStartBehavior;
    enableIMEPersonalizedLearning = view.enableIMEPersonalizedLearning;
    enableInteractiveSelection = view.enableInteractiveSelection;
    enableSuggestions = view.enableSuggestions;
    expands = view.expands;
    keyboardAppearance = view.keyboardAppearance;
    inputType = view.inputType;
    magnifierConfiguration = view.magnifierConfiguration;
    minLines = view.minLines;
    mouseCursor = view.mouseCursor;
    _obscureText = view.obscureText;
    obscuringCharacter = view.obscuringCharacter;
    readOnly = view.readOnly;
    restorationId = view.restorationId;
    scribbleEnabled = view.scribbleEnabled;
    scrollControllerText = view.scrollControllerText;
    scrollPaddingText = view.scrollPaddingText;
    scrollPhysicsText = view.scrollPhysicsText;
    selectionControls = view.selectionControls;
    selectionHeightStyle = view.selectionHeightStyle;
    selectionWidthStyle = view.selectionWidthStyle;
    showCursor = view.showCursor;
    smartDashesType = view.smartDashesType;
    smartQuotesType = view.smartQuotesType;
    spellCheckConfiguration = view.spellCheckConfiguration;
    textCapitalization = view.textCapitalization;
    textInputAction = view.textInputAction;
    textHeightBehavior = view.textHeightBehavior;
    undoController = view.undoController;

    /// LISTENER & CALLBACKS
    onAppPrivateCommand = view.onAppPrivateCommand;
    onChecked = view.onChecked;
    onEditingComplete = view.onEditingComplete;
    onSubmitted = view.onSubmitted;
    onTapOutside = view.onTapOutside;

    /// CUSTOMIZATIONS
    _editable.text = view.text ?? _editable.text;
    return this;
  }

  /// HELPER TEXT PROPERTIES
  String helperText = "";
  Color? helperTextColor;

  /// FLOATING TEXT PROPERTIES
  Color? floatingLabelColor;
  double floatingLabelSize = 12;
  bool floatingLabelVisible = false;

  /// ERROR TEXT PROPERTIES
  bool errorVisible = false;
  String _error = "";
  Color? errorColor = const Color(0xFFF44336);

  /// COUNTER TEXT PROPERTIES
  bool counterVisible = false;

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

  /// CUSTOMIZATIONS
  bool _initial = true;

  bool _focused = false;

  bool get isInitial => _initial;

  bool get isFocused => _focused;

  bool get isReadMode => !enabled && readOnly;

  bool get isUnderlineHide => background != null || borderAll > 0;

  List<TextInputFormatter>? get formatter {
    if (digits.isNotEmpty) {
      return [
        FilteringTextInputFormatter.allow(RegExp("[$digits]")),
      ];
    }
    return null;
  }

  void _handleFocusChange() {
    if (_node.hasFocus != _focused) {
      _focused = _node.hasFocus;
      if (onFocusChanged(_focused)) {
        onNotify();
      }
    }
  }

  bool onFocusChanged(bool focused) {
    return true;
  }

  void _handleEditingChange(String value) {
    onNotifyWithCallback(() {
      _initial = false;
      if (onChange != null) {
        onChange!(value);
      }
    });
  }

  void showKeyboard(BuildContext context) async {
    FocusScope.of(context).requestFocus(_node);
  }

  void hideKeyboard(BuildContext context) => FocusScope.of(context).unfocus();

  void _dispose() {
    _editable.dispose();
    _node.dispose();
  }

  /// SUPER PROPERTIES
  @override
  String get text => _editable.text;

  @override
  bool get activated => isFocused;

  @override
  double? get paddingVertical => super.paddingVertical ?? 8;

  @override
  int? get maxLines {
    switch (inputType) {
      case TextInputType.datetime:
      case TextInputType.emailAddress:
      case TextInputType.name:
      case TextInputType.number:
      case TextInputType.phone:
      case TextInputType.streetAddress:
      case TextInputType.text:
      case TextInputType.visiblePassword:
      case TextInputType.text:
        return 1;
      case TextInputType.multiline:
      case TextInputType.url:
      default:
        return null;
    }
  }

  /// BASE PROPERTIES
  String? id;
  String digits = "";
  String hint = "";
  Color? hintColor;
  Color? primary;
  int? minCharacters;

  /// DRAWABLE PROPERTIES
  dynamic _drawableStart;
  ValueState<dynamic>? drawableStartState;
  double? _drawableStartSize;
  ValueState<double>? drawableStartSizeState;
  double? _drawableStartPadding;
  ValueState<double>? drawableStartPaddingState;
  Color? _drawableStartTint;
  ValueState<Color>? drawableStartTintState;
  bool drawableStartVisible = true;

  dynamic _drawableEnd;
  ValueState<dynamic>? drawableEndState;
  double? _drawableEndSize;
  ValueState<double>? drawableEndSizeState;
  double? _drawableEndPadding;
  ValueState<double>? drawableEndPaddingState;
  Color? _drawableEndTint;
  ValueState<Color>? drawableEndTintState;
  bool drawableEndVisible = true;

  set drawableStart(dynamic value) => _drawableStart = value;

  set drawableStartSize(double? value) => _drawableStartSize = value;

  set drawableStartPadding(double? value) => _drawableStartPadding = value;

  set drawableStartTint(Color? value) => _drawableStartTint = value;

  set drawableEnd(dynamic value) => _drawableEnd = value;

  set drawableEndSize(double? value) => _drawableEndSize = value;

  set drawableEndPadding(double? value) => _drawableEndPadding = value;

  set drawableEndTint(Color? value) => _drawableEndTint = value;

  dynamic get drawableStart {
    var value = drawableStartState?.fromController(this);
    return value ?? _drawableStart;
  }

  double? get drawableStartSize {
    var value = drawableStartSizeState?.fromController(this);
    return value ?? _drawableStartSize;
  }

  double? get drawableStartPadding {
    var value = drawableStartPaddingState?.fromController(this);
    return value ?? _drawableStartPadding;
  }

  Color? get drawableStartTint {
    var value = drawableStartTintState?.fromController(this);
    return value ?? _drawableStartTint;
  }

  dynamic get drawableEnd {
    var value = drawableEndState?.fromController(this);
    return value ?? _drawableEnd;
  }

  double? get drawableEndSize {
    var value = drawableEndSizeState?.fromController(this);
    return value ?? _drawableEndSize;
  }

  double? get drawableEndPadding {
    var value = drawableEndPaddingState?.fromController(this);
    return value ?? _drawableEndPadding;
  }

  Color? get drawableEndTint {
    var value = drawableEndTintState?.fromController(this);
    return value ?? _drawableEndTint;
  }

  void setDrawableStart(dynamic drawable) {
    onNotifyWithCallback(() => drawableStart = drawable);
  }

  void setDrawableStartState(ValueState<dynamic> drawableState) {
    onNotifyWithCallback(() => drawableStartState = drawableState);
  }

  void setDrawableStartSize(double? size) {
    onNotifyWithCallback(() => drawableStartSize = size);
  }

  void setDrawableStartSizeState(ValueState<double>? sizeState) {
    onNotifyWithCallback(() => drawableStartSizeState = sizeState);
  }

  void setDrawableStartPadding(double? padding) {
    onNotifyWithCallback(() => drawableStartPadding = padding);
  }

  void setDrawableStartPaddingState(ValueState<double>? paddingState) {
    onNotifyWithCallback(() => drawableStartPaddingState = paddingState);
  }

  void setDrawableStartTint(Color? tint) {
    onNotifyWithCallback(() => drawableStartTint = tint);
  }

  void setDrawableStartTintState(ValueState<Color>? tintState) {
    onNotifyWithCallback(() => drawableStartTintState = tintState);
  }

  void setDrawableEnd(dynamic drawable) {
    onNotifyWithCallback(() => drawableEnd = drawable);
  }

  void setDrawableEndState(ValueState<dynamic> drawableState) {
    onNotifyWithCallback(() => drawableEndState = drawableState);
  }

  void setDrawableEndSize(double? size) {
    onNotifyWithCallback(() => drawableEndSize = size);
  }

  void setDrawableEndSizeState(ValueState<double>? sizeState) {
    onNotifyWithCallback(() => drawableEndSizeState = sizeState);
  }

  void setDrawableEndPadding(double? padding) {
    onNotifyWithCallback(() => drawableEndPadding = padding);
  }

  void setDrawableEndPaddingState(ValueState<double>? paddingState) {
    onNotifyWithCallback(() => drawableEndPaddingState = paddingState);
  }

  void setDrawableEndTint(Color? tint) {
    onNotifyWithCallback(() => drawableEndTint = tint);
  }

  void setDrawableEndTintState(ValueState<Color>? tintState) {
    onNotifyWithCallback(() => drawableEndTintState = tintState);
  }

  /// INDICATOR PROPERTIES
  Widget? indicator;
  double indicatorSize = 24;
  double indicatorStroke = 2;
  Color? _indicatorStrokeColor;
  ValueState<Color>? indicatorStrokeColorState;
  Color? _indicatorStrokeBackground;
  ValueState<Color>? indicatorStrokeBackgroundState;
  bool indicatorVisible = false;

  set indicatorStrokeColor(Color? value) => _indicatorStrokeColor = value;

  set indicatorStrokeBackground(Color? value) =>
      _indicatorStrokeBackground = value;

  Color? get indicatorStrokeColor {
    var value = indicatorStrokeColorState?.fromController(this);
    return value ?? _indicatorStrokeColor;
  }

  Color? get indicatorStrokeBackground {
    var value = indicatorStrokeBackgroundState?.fromController(this);
    return value ?? _indicatorStrokeBackground;
  }

  void setIndicator(Widget? indicator) {
    onNotifyWithCallback(() => this.indicator = indicator);
  }

  void setIndicatorSize(double size) {
    onNotifyWithCallback(() => indicatorSize = size);
  }

  void setIndicatorStroke(double stroke) {
    onNotifyWithCallback(() => indicatorStroke = stroke);
  }

  void setIndicatorColor(Color? color) {
    onNotifyWithCallback(() => indicatorStrokeColor = color);
  }

  void setIndicatorColorState(ValueState<Color>? colorState) {
    onNotifyWithCallback(() => indicatorStrokeColorState = colorState);
  }

  void setIndicatorBackground(Color? color) {
    onNotifyWithCallback(() => indicatorStrokeBackground = color);
  }

  void setIndicatorBackgroundState(ValueState<Color>? colorState) {
    onNotifyWithCallback(() => indicatorStrokeBackgroundState = colorState);
  }

  void setIndicatorVisibility(bool visible) {
    onNotifyWithCallback(() => indicatorVisible = visible);
  }

  /// EDITING PROPERTIES
  bool autocorrect = true;
  List<String> autofillHints = [];
  bool autoFocus = false;
  Clip clipBehaviorText = Clip.hardEdge;
  Color? cursorColor;
  double? cursorHeight;
  bool cursorOpacityAnimates = false;
  Radius? cursorRadius;
  double cursorWidth = 2.0;
  ContentInsertionConfiguration? contentInsertionConfiguration;
  EditTextContextMenuBuilder? contextMenuBuilder;
  DragStartBehavior dragStartBehavior = DragStartBehavior.start;
  bool enableIMEPersonalizedLearning = true;
  bool? enableInteractiveSelection;
  bool enableSuggestions = true;
  bool expands = false;
  Brightness keyboardAppearance = Brightness.light;
  TextInputType? inputType;
  TextMagnifierConfiguration magnifierConfiguration =
      TextMagnifierConfiguration.disabled;
  int? minLines;
  MouseCursor? mouseCursor;
  bool? _obscureText;
  String obscuringCharacter = '•';
  bool readOnly = false;
  String? restorationId;
  bool scribbleEnabled = true;
  ScrollController? scrollControllerText;
  EdgeInsets scrollPaddingText = const EdgeInsets.all(20);
  ScrollPhysics? scrollPhysicsText;
  TextSelectionControls? selectionControls;
  BoxHeightStyle selectionHeightStyle = BoxHeightStyle.tight;
  BoxWidthStyle selectionWidthStyle = BoxWidthStyle.tight;
  bool? showCursor;
  SmartDashesType? smartDashesType;
  SmartQuotesType? smartQuotesType;
  SpellCheckConfiguration? spellCheckConfiguration;
  TextCapitalization textCapitalization = TextCapitalization.none;
  TextInputAction? textInputAction;
  UndoHistoryController? undoController;

  bool get obscureText =>
      _obscureText ?? inputType == TextInputType.visiblePassword;

  /// EDITING CALLBACK & LISTENERS
  EditTextPrivateCommandListener? onAppPrivateCommand;
  EditTextCheckingListener? onChecked;
  EditTextVoidListener? onEditingComplete;
  EditTextSubmitListener? onSubmitted;
  EditTextTapOutsideListener? onTapOutside;
}

enum DrawableState {
  focused,
  unfocused,
  disabled,
  error;
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
