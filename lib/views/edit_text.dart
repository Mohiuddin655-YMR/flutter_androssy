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
typedef EditTextCheckListener = Function(String tag, bool valid);
typedef EditTextSelectionChangeListener = void Function(
  TextSelection selection,
  SelectionChangedCause? cause,
);
typedef EditTextSubmitListener = void Function(String value);
typedef EditTextTapOutsideListener = void Function(PointerDownEvent event);

class EditTextController extends TextViewController {
  late TextEditingController _editable;
  late FocusNode _node;

  EditTextController() {
    _editable = TextEditingController();
    _node = FocusNode();
    _node.addListener(_handleFocusChange);
  }

  bool counterTextVisible = false;

  void setCounterTextVisible(bool value) {
    onNotifyWithCallback(() => counterTextVisible = value);
  }

  String digits = "";

  void setDigits(String value) {
    onNotifyWithCallback(() => digits = value);
  }

  dynamic _drawableEnd;

  set drawableEnd(dynamic value) => _drawableEnd = value;

  void setDrawableEnd(dynamic value) {
    onNotifyWithCallback(() => drawableEnd = value);
  }

  ValueState<dynamic>? drawableEndState;

  void setDrawableEndState(ValueState<dynamic>? value) {
    onNotifyWithCallback(() => drawableEndState = value);
  }

  double _drawableEndSize = 18;

  set drawableEndSize(double value) => _drawableEndSize = value;

  void setDrawableEndSize(double value) {
    onNotifyWithCallback(() => drawableEndSize = value);
  }

  ValueState<double>? drawableEndSizeState;

  void setDrawableEndSizeState(ValueState<double>? value) {
    onNotifyWithCallback(() => drawableEndSizeState = value);
  }

  double? _drawableEndPadding;

  set drawableEndPadding(double? value) => _drawableEndPadding = value;

  void setDrawableEndPadding(double? value) {
    onNotifyWithCallback(() => drawableEndPadding = value);
  }

  ValueState<double>? drawableEndPaddingState;

  void setDrawableEndPaddingState(ValueState<double>? value) {
    onNotifyWithCallback(() => drawableEndPaddingState = value);
  }

  Color? _drawableEndTint;

  set drawableEndTint(Color? value) => _drawableEndTint = value;

  void setDrawableEndTint(Color? value) {
    onNotifyWithCallback(() => drawableEndTint = value);
  }

  ValueState<Color>? drawableEndTintState;

  void setDrawableEndTintState(ValueState<Color>? value) {
    onNotifyWithCallback(() => drawableEndTintState = value);
  }

  bool drawableEndVisible = true;

  void setDrawableEndVisible(bool value) {
    onNotifyWithCallback(() => drawableEndVisible = value);
  }

  dynamic _drawableStart;

  set drawableStart(dynamic value) => _drawableStart = value;

  void setDrawableStart(dynamic value) {
    onNotifyWithCallback(() => drawableStart = value);
  }

  ValueState<dynamic>? drawableStartState;

  void setDrawableStartState(ValueState<dynamic>? value) {
    onNotifyWithCallback(() => drawableStartState = value);
  }

  double _drawableStartSize = 18;

  set drawableStartSize(double value) => _drawableStartSize = value;

  void setDrawableStartSize(double value) {
    onNotifyWithCallback(() => drawableStartSize = value);
  }

  ValueState<double>? drawableStartSizeState;

  void setDrawableStartSizeState(dynamic value) {
    onNotifyWithCallback(() => drawableStartSizeState = value);
  }

  double? _drawableStartPadding;

  set drawableStartPadding(double? value) => _drawableStartPadding = value;

  void setDrawableStartPadding(double? value) {
    onNotifyWithCallback(() => drawableStartPadding = value);
  }

  ValueState<double>? drawableStartPaddingState;

  void setDrawableStartPaddingState(ValueState<double>? value) {
    onNotifyWithCallback(() => drawableStartPaddingState = value);
  }

  Color? _drawableStartTint;

  set drawableStartTint(Color? value) => _drawableStartTint = value;

  void setDrawableStartTint(Color? value) {
    onNotifyWithCallback(() => drawableStartTint = value);
  }

  ValueState<Color>? drawableStartTintState;

  void setDrawableStartTintState(ValueState<Color>? value) {
    onNotifyWithCallback(() => drawableStartTintState = value);
  }

  bool drawableStartVisible = true;

  void setDrawableStartVisible(bool value) {
    onNotifyWithCallback(() => drawableStartVisible = value);
  }

  String? _errorText;

  set errorText(String? value) => _errorText = value;

  void setErrorText(String? value) {
    onNotifyWithCallback(() => errorText = value);
  }

  ValueState<String>? errorTextState;

  void setErrorTextState(ValueState<String>? value) {
    onNotifyWithCallback(() => errorTextState = value);
  }

  Color? errorTextColor;

  void setErrorTextColor(Color? value) {
    onNotifyWithCallback(() => errorTextColor = value);
  }

  bool errorTextVisible = false;

  void setErrorTextVisible(bool value) {
    onNotifyWithCallback(() => errorTextVisible = value);
  }

  Color? floatingTextColor;

  void setFloatingTextColor(Color? value) {
    onNotifyWithCallback(() => floatingTextColor = value);
  }

  double floatingTextSize = 12;

  void setFloatingTextSize(double value) {
    onNotifyWithCallback(() => floatingTextSize = value);
  }

  bool floatingTextVisible = false;

  void setFloatingTextVisible(bool value) {
    onNotifyWithCallback(() => floatingTextVisible = value);
  }

  String helperText = "";

  void setHelperText(String value) {
    onNotifyWithCallback(() => helperText = value);
  }

  Color? helperTextColor;

  void setHelperTextColor(Color? value) {
    onNotifyWithCallback(() => helperTextColor = value);
  }

  String hintText = "";

  void setHintText(String value) {
    onNotifyWithCallback(() => hintText = value);
  }

  Color? hintTextColor;

  void setHintTextColor(Color? value) {
    onNotifyWithCallback(() => hintTextColor = value);
  }

  Widget? indicator;

  void setIndicator(Widget? value) {
    onNotifyWithCallback(() => indicator = value);
  }

  double indicatorSize = 24;

  void setIndicatorSize(double value) {
    onNotifyWithCallback(() => indicatorSize = value);
  }

  double indicatorStroke = 2;

  void setIndicatorStroke(double value) {
    onNotifyWithCallback(() => indicatorStroke = value);
  }

  Color? _indicatorStrokeColor;

  set indicatorStrokeColor(Color? value) => _indicatorStrokeColor = value;

  void setIndicatorStrokeColor(Color? value) {
    onNotifyWithCallback(() => indicatorStrokeColor = value);
  }

  ValueState<Color>? indicatorStrokeColorState;

  void setIndicatorStrokeColorState(ValueState<Color>? value) {
    onNotifyWithCallback(() => indicatorStrokeColorState = value);
  }

  Color? _indicatorStrokeBackground;

  set indicatorStrokeBackground(Color? value) {
    _indicatorStrokeBackground = value;
  }

  void setIndicatorStrokeBackground(Color? value) {
    onNotifyWithCallback(() => indicatorStrokeBackground = value);
  }

  ValueState<Color>? indicatorStrokeBackgroundState;

  void setIndicatorStrokeBackgroundState(ValueState<Color>? value) {
    onNotifyWithCallback(() => indicatorStrokeBackgroundState = value);
  }

  void setIndicatorVisibility(bool visible) {
    onNotifyWithCallback(() => indicatorVisible = visible);
  }

  int? minCharacters;

  void setMinCharacters(int? value) {
    onNotifyWithCallback(() => minCharacters = value);
  }

  Color? primary;

  void setPrimary(Color? value) {
    onNotifyWithCallback(() => primary = value);
  }

  // EDITING PROPERTIES
  bool autocorrect = true;

  void setAutocorrect(bool value) {
    onNotifyWithCallback(() => autocorrect = value);
  }

  List<String> autofillHints = const [];

  void setAutofillHints(List<String> value) {
    onNotifyWithCallback(() => autofillHints = value);
  }

  bool autoFocus = false;

  void setAutoFocus(bool value) {
    onNotifyWithCallback(() => autoFocus = value);
  }

  Clip clipBehaviorText = Clip.hardEdge;

  void setClipBehaviorText(Clip value) {
    onNotifyWithCallback(() => clipBehaviorText = value);
  }

  Color? cursorColor;

  void setCursorColor(Color? value) {
    onNotifyWithCallback(() => cursorColor = value);
  }

  double? cursorHeight;

  void setCursorHeight(double? value) {
    onNotifyWithCallback(() => cursorHeight = value);
  }

  bool cursorOpacityAnimates = false;

  void setCursorOpacityAnimates(bool value) {
    onNotifyWithCallback(() => cursorOpacityAnimates = value);
  }

  Radius? cursorRadius;

  void setCursorRadius(Radius? value) {
    onNotifyWithCallback(() => cursorRadius = value);
  }

  double cursorWidth = 2.0;

  void setCursorWidth(double value) {
    onNotifyWithCallback(() => cursorWidth = value);
  }

  ContentInsertionConfiguration? contentInsertionConfiguration;

  void setContentInsertionConfiguration(ContentInsertionConfiguration? value) {
    onNotifyWithCallback(() => contentInsertionConfiguration = value);
  }

  EditTextContextMenuBuilder? contextMenuBuilder;

  void setContextMenuBuilder(EditTextContextMenuBuilder? value) {
    onNotifyWithCallback(() => contextMenuBuilder = value);
  }

  DragStartBehavior dragStartBehavior = DragStartBehavior.start;

  void setDragStartBehavior(DragStartBehavior value) {
    onNotifyWithCallback(() => dragStartBehavior = value);
  }

  bool enableIMEPersonalizedLearning = true;

  void setEnableIMEPersonalizedLearning(bool value) {
    onNotifyWithCallback(() => enableIMEPersonalizedLearning = value);
  }

  bool? enableInteractiveSelection;

  void setEnableInteractiveSelection(bool? value) {
    onNotifyWithCallback(() => enableInteractiveSelection = value);
  }

  bool enableSuggestions = true;

  void setEnableSuggestions(bool value) {
    onNotifyWithCallback(() => enableSuggestions = value);
  }

  bool expands = false;

  void setExpands(bool value) {
    onNotifyWithCallback(() => expands = value);
  }

  Brightness keyboardAppearance = Brightness.light;

  void setKeyboardAppearance(Brightness value) {
    onNotifyWithCallback(() => keyboardAppearance = value);
  }

  TextInputType? inputType;

  void setInputType(TextInputType? value) {
    onNotifyWithCallback(() => inputType = value);
  }

  TextMagnifierConfiguration magnifierConfiguration =
      TextMagnifierConfiguration.disabled;

  void setMagnifierConfiguration(TextMagnifierConfiguration value) {
    onNotifyWithCallback(() => magnifierConfiguration = value);
  }

  int? minLines;

  void setMinLines(int? value) {
    onNotifyWithCallback(() => minLines = value);
  }

  MouseCursor? mouseCursor;

  void setMouseCursor(MouseCursor? value) {
    onNotifyWithCallback(() => mouseCursor = value);
  }

  bool? _obscureText;

  set obscureText(bool? value) => _obscureText = value;

  void setObscureText(bool? value) {
    onNotifyWithCallback(() => obscureText = value);
  }

  String obscuringCharacter = '•';

  void setObscuringCharacter(String value) {
    onNotifyWithCallback(() => obscuringCharacter = value);
  }

  bool readOnly = false;

  void setReadOnly(bool value) {
    onNotifyWithCallback(() => readOnly = value);
  }

  String? restorationId;

  void setRestorationId(String? value) {
    onNotifyWithCallback(() => restorationId = value);
  }

  bool scribbleEnabled = true;

  void setScribbleEnabled(bool value) {
    onNotifyWithCallback(() => scribbleEnabled = value);
  }

  ScrollController? scrollControllerText;

  void setScrollControllerText(ScrollController? value) {
    onNotifyWithCallback(() => scrollControllerText = value);
  }

  EdgeInsets textScrollPadding = const EdgeInsets.all(20);

  void setTextScrollPadding(EdgeInsets value) {
    onNotifyWithCallback(() => textScrollPadding = value);
  }

  ScrollPhysics? textScrollPhysics;

  void setTextScrollPhysics(ScrollPhysics? value) {
    onNotifyWithCallback(() => textScrollPhysics = value);
  }

  TextSelectionControls? selectionControls;

  void setSelectionControls(TextSelectionControls? value) {
    onNotifyWithCallback(() => selectionControls = value);
  }

  BoxHeightStyle selectionHeightStyle = BoxHeightStyle.tight;

  void setSelectionHeightStyle(BoxHeightStyle value) {
    onNotifyWithCallback(() => selectionHeightStyle = value);
  }

  BoxWidthStyle selectionWidthStyle = BoxWidthStyle.tight;

  void setSelectionWidthStyle(BoxWidthStyle value) {
    onNotifyWithCallback(() => selectionWidthStyle = value);
  }

  bool? showCursor;

  void setShowCursor(bool? value) {
    onNotifyWithCallback(() => showCursor = value);
  }

  SmartDashesType? smartDashesType;

  void setSmartDashesType(SmartDashesType? value) {
    onNotifyWithCallback(() => smartDashesType = value);
  }

  SmartQuotesType? smartQuotesType;

  void setSmartQuotesType(SmartQuotesType? value) {
    onNotifyWithCallback(() => smartQuotesType = value);
  }

  SpellCheckConfiguration? spellCheckConfiguration;

  void setSpellCheckConfiguration(SpellCheckConfiguration? value) {
    onNotifyWithCallback(() => spellCheckConfiguration = value);
  }

  TextCapitalization textCapitalization = TextCapitalization.none;

  void setTextCapitalization(TextCapitalization value) {
    onNotifyWithCallback(() => textCapitalization = value);
  }

  TextInputAction? textInputAction;

  void setTextInputAction(TextInputAction? value) {
    onNotifyWithCallback(() => textInputAction = value);
  }

  UndoHistoryController? undoController;

  void setUndoController(UndoHistoryController? value) {
    onNotifyWithCallback(() => undoController = value);
  }

  // CALLBACK & LISTENERS

  EditTextPrivateCommandListener? _onAppPrivateCommand;

  set onAppPrivateCommand(EditTextPrivateCommandListener? listener) =>
      _onAppPrivateCommand = listener;

  void setOnEditTextPrivateCommandListener(
          EditTextPrivateCommandListener listener) =>
      onAppPrivateCommand = listener;

  EditTextVoidListener? _onEditingComplete;

  set onEditingComplete(EditTextVoidListener? listener) =>
      _onEditingComplete = listener;

  void setOnEditTextVoidListener(EditTextVoidListener listener) =>
      onEditingComplete = listener;

  EditTextSubmitListener? _onSubmitted;

  set onSubmitted(EditTextSubmitListener? listener) => _onSubmitted = listener;

  void setOnEditTextSubmitListener(EditTextSubmitListener listener) =>
      onSubmitted = listener;

  EditTextTapOutsideListener? _onTapOutside;

  set onTapOutside(EditTextTapOutsideListener? listener) =>
      _onTapOutside = listener;

  void setOnEditTextTapOutsideListener(EditTextTapOutsideListener listener) =>
      onTapOutside = listener;

  EditTextController fromEditText(EditText view) {
    super.fromTextView(view);

    helperText = view.helperText;
    helperTextColor = view.helperTextColor;
    floatingTextColor = view.floatingTextColor;
    floatingTextSize = view.floatingTextSize;
    floatingTextVisible = view.floatingTextVisible;
    errorTextVisible = view.errorTextVisible;
    errorTextColor = view.errorTextColor;
    counterTextVisible = view.counterTextVisible;
    onChange = view.onChange;
    onError = view.onError;
    onValidator = view.onValidator;

    /// BASE PROPERTIES
    digits = view.digits;
    hintText = view.hint;
    hintTextColor = view.hintColor;
    primary = view.primary;
    maxCharacters = view.maxCharacters;
    minCharacters = view.minCharacters;

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
    obscureText = view.obscureText;
    obscuringCharacter = view.obscuringCharacter;
    readOnly = view.readOnly;
    restorationId = view.restorationId;
    scribbleEnabled = view.scribbleEnabled;
    scrollControllerText = view.scrollControllerText;
    textScrollPadding = view.scrollPaddingText;
    textScrollPhysics = view.scrollPhysicsText;
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
    onEditingComplete = view.onEditingComplete;
    onSubmitted = view.onSubmitted;
    onTapOutside = view.onTapOutside;

    /// CUSTOMIZATIONS
    _editable.text = view.text ?? _editable.text;
    return this;
  }

  dynamic get drawableEnd {
    var value = drawableEndState?.fromController(this);
    return value ?? _drawableEnd;
  }

  double get drawableEndSize {
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

  dynamic get drawableStart {
    var value = drawableStartState?.fromController(this);
    return value ?? _drawableStart;
  }

  double get drawableStartSize {
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

  String? get errorText => errorTextState?.fromController(this) ?? _errorText;

  bool get hasError => !isValid && (errorText ?? "").isNotEmpty;

  Color? get indicatorStrokeColor {
    var value = indicatorStrokeColorState?.fromController(this);
    return value ?? _indicatorStrokeColor;
  }

  Color? get indicatorStrokeBackground {
    var value = indicatorStrokeBackgroundState?.fromController(this);
    return value ?? _indicatorStrokeBackground;
  }

  bool get obscureText {
    return _obscureText ?? (inputType == TextInputType.visiblePassword);
  }

  @override
  bool get activated => isFocused;

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

  @override
  double? get paddingVertical => super.paddingVertical ?? 8;

  @override
  String get text => _editable.text;

  /// CALLBACK & LISTENERS
  EditTextPrivateCommandListener? get onAppPrivateCommand =>
      enabled ? _onAppPrivateCommand : null;

  EditTextVoidListener? get onEditingComplete =>
      enabled ? _onEditingComplete : null;

  EditTextSubmitListener? get onSubmitted => enabled ? _onSubmitted : null;

  EditTextTapOutsideListener? get onTapOutside =>
      enabled ? _onTapOutside : null;

  /// CUSTOMIZATIONS
  bool _initial = true;

  bool _focused = false;

  bool get isInitial => _initial;

  bool get isFocused => _focused;

  bool get isReadMode => !enabled && readOnly;

  bool get isUnderlineHide => background != null || borderAll > 0;

  bool get isValid {
    if (onValidator != null) {
      return onValidator!(_editable.text);
    } else {
      return true;
    }
  }

  dynamic get iEnd => drawableEnd?.drawable(isFocused);

  dynamic get iStart => drawableStart?.drawable(isFocused);

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
    if (digits.isNotEmpty) {
      return [
        FilteringTextInputFormatter.allow(RegExp("[$digits]")),
      ];
    }
    return null;
  }

  ViewError errorType(String text, [bool? valid]) {
    if (text.isEmpty && !_initial) {
      return ViewError.empty;
    } else if (!(valid ?? isValid)) {
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
      if (onChange != null) onChange!(value);
      if (onValid != null || onError != null) {
        final valid = isValid;
        if (onValid != null) onValid!(valid);
        if (onError != null) {
          errorText = onError!(errorType(value, valid)) ?? "";
        }
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
}

class EditText<T extends EditTextController> extends TextView<T> {
  /// HELPER TEXT PROPERTIES
  final String helperText;
  final Color? helperTextColor;

  /// FLOATING TEXT PROPERTIES
  final Color? floatingTextColor;
  final double floatingTextSize;
  final bool floatingTextVisible;

  /// ERROR TEXT PROPERTIES
  final bool errorTextVisible;
  final Color? errorTextColor;

  /// COUNTER TEXT PROPERTIES
  final bool counterTextVisible;

  /// BASE PROPERTIES
  final String digits;
  final String hint;
  final Color? hintColor;
  final Color? primary;
  final int? minCharacters;

  /// DRAWABLE PROPERTIES
  final dynamic drawableStart;
  final ValueState<dynamic>? drawableStartState;
  final EditTextDrawableBuilder<T>? drawableStartBuilder;
  final double drawableStartSize;
  final ValueState<double>? drawableStartSizeState;
  final double? drawableStartPadding;
  final ValueState<double>? drawableStartPaddingState;
  final Color? drawableStartTint;
  final ValueState<Color>? drawableStartTintState;
  final bool drawableStartVisible;
  final dynamic drawableEnd;
  final ValueState<dynamic>? drawableEndState;
  final EditTextDrawableBuilder<T>? drawableEndBuilder;
  final double drawableEndSize;
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
  final EditTextVoidListener? onEditingComplete;
  final EditTextSubmitListener? onSubmitted;
  final EditTextTapOutsideListener? onTapOutside;

  const EditText({
    /// ROOT PROPERTIES
    super.key,
    super.controller,

    ///BASE PROPERTIES
    super.absorbMode,
    super.activated,
    super.background,
    super.backgroundState,
    super.backgroundBlendMode,
    super.backgroundGradient,
    super.backgroundGradientState,
    super.backgroundImage,
    super.backgroundImageState,
    super.clipBehavior,
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
    super.heightState,
    super.heightMax,
    super.heightMin,
    super.hoverColor,
    super.orientation,
    super.position,
    super.positionType,
    super.pressedColor,
    super.rippleColor,
    super.scrollable,
    super.scrollController,
    super.scrollingType,
    super.shape,
    super.transform,
    super.transformGravity,
    super.width,
    super.widthState,
    super.widthMax,
    super.widthMin,
    super.visibility,

    /// ANIMATION PROPERTIES
    super.animation,
    super.animationType,

    /// BORDER PROPERTIES
    super.borderColor,
    super.borderColorState,
    super.borderSize,
    super.borderSizeState,
    super.borderHorizontal,
    super.borderHorizontalState,
    super.borderVertical,
    super.borderVerticalState,
    super.borderTop,
    super.borderTopState,
    super.borderBottom,
    super.borderBottomState,
    super.borderStart,
    super.borderStartState,
    super.borderEnd,
    super.borderEndState,
    super.borderStrokeAlign,

    /// BORDER RADIUS PROPERTIES
    super.borderRadius,
    super.borderRadiusState,
    super.borderRadiusBL,
    super.borderRadiusBLState,
    super.borderRadiusBR,
    super.borderRadiusBRState,
    super.borderRadiusTL,
    super.borderRadiusTLState,
    super.borderRadiusTR,
    super.borderRadiusTRState,

    /// MARGIN PROPERTIES
    super.margin,
    super.marginHorizontal,
    super.marginVertical,
    super.marginTop,
    super.marginBottom,
    super.marginStart,
    super.marginEnd,

    /// PADDING PROPERTIES
    super.padding,
    super.paddingHorizontal,
    super.paddingVertical,
    super.paddingTop,
    super.paddingBottom,
    super.paddingStart,
    super.paddingEnd,

    /// SHADOW PROPERTIES
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

    /// LISTENER PROPERTIES
    super.onClick,
    super.onDoubleClick,
    super.onLongClick,
    super.onHover,
    super.onToggle,

    /// SUPER TEXT PROPERTIES
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
    this.floatingTextColor,
    this.floatingTextSize = 12,
    this.floatingTextVisible = false,

    /// ERROR TEXT PROPERTIES
    this.errorTextColor = const Color(0xFFFF7769),
    this.errorTextVisible = true,
    this.counterTextVisible = false,

    /// BASE PROPERTIES
    this.digits = "",
    this.hint = "",
    this.hintColor,
    this.primary,
    this.minCharacters,

    /// DRAWABLE PROPERTIES
    this.drawableStart,
    this.drawableStartState,
    this.drawableStartBuilder,
    this.drawableStartSize = 18,
    this.drawableStartSizeState,
    this.drawableStartPadding,
    this.drawableStartPaddingState,
    this.drawableStartTint,
    this.drawableStartTintState,
    this.drawableStartVisible = true,
    this.drawableEnd,
    this.drawableEndState,
    this.drawableEndBuilder,
    this.drawableEndSize = 18,
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
    this.onEditingComplete,
    this.onSubmitted,
    this.onTapOutside,
  });

  @override
  ViewRoots initRootProperties() {
    return const ViewRoots(
      observer: false,
      padding: false,
    );
  }

  @override
  T initController() => EditTextController() as T;

  @override
  T attachController(T controller) => controller.fromEditText(this) as T;

  @override
  void onDispose(context, controller) => controller._dispose();

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
    final errorColor = controller.errorTextColor ?? const Color(0xFFFF7769);
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
      error: errorColor,
    );

    var defaultColor = colors.fromController(controller);

    Widget child = Container(
      color: Colors.transparent,
      padding: controller.padding ?? EdgeInsets.zero,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (drawableStartBuilder != null)
            drawableStartBuilder!(context, controller)
          else
            IconView(
              visibility: controller.drawableStart != null,
              icon: controller.drawableStart,
              size: controller.drawableStartSize,
              tint: controller.drawableStartTint ?? defaultColor,
              marginEnd: controller.drawableStartPadding ?? 12,
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
                hintText: controller.hintText,
                hintStyle: style.copyWith(
                  color: controller.text.isNotEmpty
                      ? Colors.transparent
                      : controller.hintTextColor ?? secondaryColor,
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
              scrollPadding: controller.textScrollPadding,
              scrollPhysics: controller.textScrollPhysics,
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
          if (controller.indicatorVisible)
            Container(
              width: controller.indicatorSize,
              height: controller.indicatorSize,
              padding: EdgeInsets.all(controller.indicatorSize * 0.05),
              child: CircularProgressIndicator(
                strokeWidth: controller.indicatorStroke,
                color: controller.indicatorStrokeColor ?? defaultColor,
                backgroundColor: controller.indicatorStrokeBackground ??
                    defaultColor?.withOpacity(0.1),
              ),
            )
          else if (drawableEndBuilder != null)
            drawableEndBuilder!(context, controller)
          else
            IconView(
              visibility: controller.drawableEnd != null,
              icon: controller.drawableEnd,
              size: controller.drawableEndSize,
              tint: controller.drawableEndTint ?? defaultColor,
              marginStart: controller.drawableEndPadding ?? 4,
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
                    visible: controller.floatingTextVisible,
                    valid: controller.text.isNotEmpty,
                    text: controller.hintText,
                    textAlign: controller.textAlign,
                    textSize: controller.floatingTextSize,
                    textColor: controller.isFocused
                        ? primaryColor
                        : controller.floatingTextColor ?? secondaryColor,
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
                    error: errorColor,
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
                            ? controller.errorText
                            : controller.helperText,
                        textAlign: TextAlign.start,
                        textSize: controller.floatingTextSize,
                        textColor: !hasError
                            ? controller.helperTextColor ?? secondaryColor
                            : controller.errorTextColor,
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
                        textSize: controller.floatingTextSize,
                        textColor: hasError
                            ? controller.errorTextColor
                            : secondaryColor,
                        valid: controller.counterTextVisible &&
                            controller.isFocused,
                        visible: controller.counterTextVisible,
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
  final String? text;
  final TextAlign? textAlign;
  final Color? textColor;
  final double textSize;
  final EdgeInsetsGeometry? padding;

  const _EditTextHighlightText({
    required this.text,
    this.textAlign,
    this.textColor,
    this.textSize = 12,
    this.valid = false,
    this.visible = true,
    this.padding,
  });

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
          text ?? "",
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
    super.key,
    this.primary,
    this.visible = true,
    this.enabled = true,
    this.focused = false,
    this.error = false,
    required this.colorState,
    this.height = 1,
  });

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
