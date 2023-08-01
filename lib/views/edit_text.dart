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
  final Color? autocorrectionTextRectColor;
  final AutofillClient? autofillClient;
  final List<String> autofillHints;
  final bool autoFocus;
  final Color? backgroundCursorColor;
  final Clip clipBehaviorText;
  final Color? cursorColor;
  final double? cursorHeight;
  final Offset? cursorOffset;
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
  final bool forceLine;
  final TextInputType? inputType;
  final Brightness keyboardAppearance;
  final TextMagnifierConfiguration magnifierConfiguration;
  final int? minLines;
  final MouseCursor? mouseCursor;
  final bool obscureText;
  final String obscuringCharacter;
  final bool paintCursorAboveText;
  final bool readOnly;
  final bool rendererIgnoresPointer;
  final String? restorationId;
  final bool scribbleEnabled;
  final ScrollBehavior? scrollBehaviorText;
  final ScrollController? scrollControllerText;
  final EdgeInsets scrollPaddingText;
  final ScrollPhysics? scrollPhysicsText;
  final TextSelectionControls? selectionControls;
  final BoxHeightStyle selectionHeightStyle;
  final BoxWidthStyle selectionWidthStyle;
  final bool? showCursor;
  final bool showSelectionHandles;
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
  final EditTextSelectionChangeListener? onSelectionChanged;
  final EditTextVoidListener? onSelectionHandleTapped;
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
    this.autocorrectionTextRectColor,
    this.autofillClient,
    this.autofillHints = const [],
    this.autoFocus = false,
    this.backgroundCursorColor,
    this.clipBehaviorText = Clip.hardEdge,
    this.cursorColor,
    this.cursorHeight,
    this.cursorOffset,
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
    this.forceLine = true,
    this.inputType,
    this.keyboardAppearance = Brightness.light,
    this.magnifierConfiguration = TextMagnifierConfiguration.disabled,
    this.minLines,
    this.mouseCursor,
    this.obscureText = false,
    this.obscuringCharacter = '•',
    this.paintCursorAboveText = false,
    this.readOnly = false,
    this.rendererIgnoresPointer = false,
    this.restorationId,
    this.scribbleEnabled = true,
    this.scrollBehaviorText,
    this.scrollControllerText,
    this.scrollPaddingText = const EdgeInsets.all(20),
    this.scrollPhysicsText,
    this.selectionControls,
    this.selectionHeightStyle = BoxHeightStyle.tight,
    this.selectionWidthStyle = BoxWidthStyle.tight,
    this.showCursor,
    this.showSelectionHandles = false,
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
    this.onSelectionChanged,
    this.onSelectionHandleTapped,
    this.onSubmitted,
    this.onTapOutside,
  });

  @override
  ViewRoots initRootProperties() => const ViewRoots(observer: false);

  @override
  T initController() => EditTextController() as T;

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
    final primaryColor = controller.primary ?? context.primaryColor;
    const secondaryColor = Color(0xffbbbbbb);
    var style = TextStyle(
      color: controller.textColor ?? Colors.black,
      fontSize: controller.textSize ?? 18,
    );
    var colors = ValueState(
      primary: secondaryColor,
      secondary: primaryColor,
      disable: secondaryColor,
      ternary: secondaryColor,
      error: const Color(0xFFF44336),
    );

    var defaultColor = colors.fromController(controller);

    return Row(
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
          child: Stack(
            alignment: controller.gravity ?? Alignment.centerLeft,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 2),
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
                autocorrect: controller.autocorrect,
                autocorrectionTextRectColor:
                    controller.autocorrectionTextRectColor,
                autofillClient: controller.autofillClient,
                autofillHints: controller.autofillHints,
                autofocus: controller.autoFocus,
                backgroundCursorColor:
                    controller.backgroundCursorColor ?? primaryColor,
                clipBehavior: controller.clipBehaviorText,
                controller: controller._editable,
                cursorColor: controller.cursorColor ?? primaryColor,
                cursorHeight: controller.cursorHeight,
                cursorOffset: controller.cursorOffset,
                cursorOpacityAnimates: controller.cursorOpacityAnimates,
                cursorRadius: controller.cursorRadius,
                cursorWidth: controller.cursorWidth,
                contentInsertionConfiguration:
                    controller.contentInsertionConfiguration,
                contextMenuBuilder: controller.contextMenuBuilder,
                dragStartBehavior: controller.dragStartBehavior,
                enableIMEPersonalizedLearning:
                    controller.enableIMEPersonalizedLearning,
                enableInteractiveSelection:
                    controller.enableInteractiveSelection,
                enableSuggestions: controller.enableSuggestions,
                expands: controller.expands,
                focusNode: controller._node,
                forceLine: controller.forceLine,
                inputFormatters: controller.formatter,
                keyboardAppearance: controller.keyboardAppearance,
                keyboardType: controller.inputType,
                locale: controller.locale,
                maxLines: controller.maxLines,
                magnifierConfiguration: controller.magnifierConfiguration,
                minLines: controller.minLines,
                mouseCursor: controller.mouseCursor,
                obscureText: controller.obscureText,
                obscuringCharacter: controller.obscuringCharacter,
                onAppPrivateCommand: controller.onAppPrivateCommand,
                onChanged: controller._handleEditingChange,
                onEditingComplete: controller.onEditingComplete,
                onSelectionChanged: controller.onSelectionChanged,
                onSelectionHandleTapped: controller.onSelectionHandleTapped,
                onSubmitted: controller.onSubmitted,
                onTapOutside: controller.onTapOutside,
                paintCursorAboveText: controller.paintCursorAboveText,
                readOnly: controller.isReadMode,
                rendererIgnoresPointer: controller.rendererIgnoresPointer,
                restorationId: controller.restorationId,
                scribbleEnabled: controller.scribbleEnabled,
                scrollBehavior: controller.scrollBehaviorText,
                scrollController: controller.scrollControllerText,
                scrollPadding: controller.scrollPaddingText,
                scrollPhysics: controller.scrollPhysicsText,
                selectionColor: controller.selectionColor,
                selectionControls: controller.selectionControls,
                selectionHeightStyle: controller.selectionHeightStyle,
                selectionWidthStyle: controller.selectionWidthStyle,
                showCursor: controller.showCursor,
                showSelectionHandles: controller.showSelectionHandles,
                smartDashesType: controller.smartDashesType,
                smartQuotesType: controller.smartQuotesType,
                spellCheckConfiguration: controller.spellCheckConfiguration,
                strutStyle: controller.strutStyle,
                style: style,
                textAlign: controller.textAlign ?? TextAlign.start,
                textCapitalization: controller.textCapitalization,
                textDirection: controller.textDirection,
                textInputAction: controller.textInputAction,
                textHeightBehavior: controller.textHeightBehavior,
                textWidthBasis: controller.textWidthBasis,
                textScaleFactor: controller.textScaleFactor,
                undoController: controller.undoController,
              ),
            ],
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
    autocorrectionTextRectColor = view.autocorrectionTextRectColor;
    autofillClient = view.autofillClient;
    autofillHints = view.autofillHints;
    autoFocus = view.autoFocus;
    backgroundCursorColor = view.backgroundCursorColor;
    clipBehaviorText = view.clipBehaviorText;
    cursorColor = view.cursorColor;
    cursorHeight = view.cursorHeight;
    cursorOffset = view.cursorOffset;
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
    forceLine = view.forceLine;
    keyboardAppearance = view.keyboardAppearance;
    inputType = view.inputType;
    magnifierConfiguration = view.magnifierConfiguration;
    minLines = view.minLines;
    mouseCursor = view.mouseCursor;
    obscureText = view.obscureText;
    obscuringCharacter = view.obscuringCharacter;
    paintCursorAboveText = view.paintCursorAboveText;
    readOnly = view.readOnly;
    rendererIgnoresPointer = view.rendererIgnoresPointer;
    restorationId = view.restorationId;
    scribbleEnabled = view.scribbleEnabled;
    scrollBehaviorText = view.scrollBehaviorText;
    scrollControllerText = view.scrollControllerText;
    scrollPaddingText = view.scrollPaddingText;
    scrollPhysicsText = view.scrollPhysicsText;
    selectionControls = view.selectionControls;
    selectionHeightStyle = view.selectionHeightStyle;
    selectionWidthStyle = view.selectionWidthStyle;
    showCursor = view.showCursor;
    showSelectionHandles = view.showSelectionHandles;
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
    onSelectionChanged = view.onSelectionChanged;
    onSelectionHandleTapped = view.onSelectionHandleTapped;
    onSubmitted = view.onSubmitted;
    onTapOutside = view.onTapOutside;

    /// CUSTOMIZATIONS
    _editable.text = view.text ?? _editable.text;
    return this;
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
    var keyboard = WidgetsBinding.instance.window.viewInsets.bottom;
    if (_node.hasFocus && keyboard <= 0) {
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
  Color? autocorrectionTextRectColor;
  AutofillClient? autofillClient;
  List<String> autofillHints = [];
  bool autoFocus = false;
  Color? backgroundCursorColor;
  Clip clipBehaviorText = Clip.hardEdge;
  Color? cursorColor;
  double? cursorHeight;
  Offset? cursorOffset;
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
  bool forceLine = true;
  Brightness keyboardAppearance = Brightness.light;
  TextInputType? inputType;
  TextMagnifierConfiguration magnifierConfiguration =
      TextMagnifierConfiguration.disabled;
  int? minLines;
  MouseCursor? mouseCursor;
  bool obscureText = false;
  String obscuringCharacter = '•';
  bool paintCursorAboveText = false;
  bool readOnly = false;
  bool rendererIgnoresPointer = false;
  String? restorationId;
  bool scribbleEnabled = true;
  ScrollBehavior? scrollBehaviorText;
  ScrollController? scrollControllerText;
  EdgeInsets scrollPaddingText = const EdgeInsets.all(20);
  ScrollPhysics? scrollPhysicsText;
  TextSelectionControls? selectionControls;
  BoxHeightStyle selectionHeightStyle = BoxHeightStyle.tight;
  BoxWidthStyle selectionWidthStyle = BoxWidthStyle.tight;
  bool? showCursor;
  bool showSelectionHandles = false;
  SmartDashesType? smartDashesType;
  SmartQuotesType? smartQuotesType;
  SpellCheckConfiguration? spellCheckConfiguration;
  TextCapitalization textCapitalization = TextCapitalization.none;
  TextInputAction? textInputAction;
  UndoHistoryController? undoController;

  /// EDITING CALLBACK & LISTENERS
  EditTextPrivateCommandListener? onAppPrivateCommand;
  EditTextCheckingListener? onChecked;
  EditTextVoidListener? onEditingComplete;
  EditTextSelectionChangeListener? onSelectionChanged;
  EditTextVoidListener? onSelectionHandleTapped;
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
