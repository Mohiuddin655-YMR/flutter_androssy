part of 'view.dart';

class EditTextController extends TextViewController {
  TextEditingController _editor = TextEditingController();

  FocusNode _node = FocusNode();

  EditTextController({
    TextEditingController? editor,
    FocusNode? focusNode,
  }) {
    _editor = editor ?? _editor;
    _node = focusNode ?? _node;
    addFocusListener();
  }

  void addFocusListener([VoidCallback? callback]) {
    _node.addListener(() {
      _handleFocusChange();
      if (callback != null) callback();
    });
  }

  void removeFocusListener([VoidCallback? callback]) {
    _node.removeListener(() {
      _handleFocusChange();
      if (callback != null) callback();
    });
  }

  bool autoDisposeMode = true;

  void setAutoDisposeMode(bool value) {
    onNotifyWithCallback(() => autoDisposeMode = value);
  }

  bool counterTextVisible = false;

  void setCounterTextVisible(bool value) {
    onNotifyWithCallback(() => counterTextVisible = value);
  }

  String characters = "";

  void setCharacters(String value) {
    onNotifyWithCallback(() => characters = value);
  }

  String ignorableCharacters = "";

  void setIgnorableCharacters(String value) {
    onNotifyWithCallback(() => ignorableCharacters = value);
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

  double _drawableEndSize = 24;

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

  bool drawableEndAsEye = false;

  void setDrawableEndAsEye(bool value) {
    onNotifyWithCallback(() => drawableEndAsEye = value);
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

  bool characterLimitMode = false;

  void setCharacterLimitMode(bool value) {
    onNotifyWithCallback(() => characterLimitMode = value);
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

  List<TextInputFormatter>? inputFormatters;

  void setInputFormatters(List<TextInputFormatter>? value) {
    onNotifyWithCallback(() => inputFormatters = value);
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
    autoDisposeMode = view.autoDisposeMode;
    characters = view.characters;
    hintText = view.hint;
    hintTextColor = view.hintColor;
    ignorableCharacters = view.ignorableCharacters;
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
    drawableEndAsEye = view.drawableEndAsEye;

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
    characterLimitMode = view.characterLimitMode;
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
    inputFormatters = view.inputFormatters;
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
    _editor.text = view.text ?? _editor.text;
    return this;
  }

  dynamic get drawableEnd {
    if (drawableEndAsEye) {
      return drawableEndState?.detect(obscureText);
    }
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
  String get text => _editor.text;

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
      return onValidator!(_editor.text);
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

  List<TextInputFormatter>? get _formatter {
    return [
      ...?inputFormatters,
      if (characters.isNotEmpty)
        FilteringTextInputFormatter.allow(RegExp("[$characters]")),
      if (ignorableCharacters.isNotEmpty)
        FilteringTextInputFormatter.deny(RegExp("[$ignorableCharacters]")),
    ];
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

  void onChangeEye(bool value) {
    if (drawableEndAsEye) {
      onNotifyWithCallback(() => obscureText = !obscureText);
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
    if (autoDisposeMode) dispose();
  }

  void dispose() {
    removeFocusListener();
    _editor.dispose();
    _node.dispose();
  }
}
