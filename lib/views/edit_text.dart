part of '../widgets.dart';

typedef ContextMenuBuilder = Widget Function(BuildContext, EditableTextState);
typedef OnAppPrivateCommandCallback = void Function(
  String,
  Map<String, dynamic>,
);
typedef OnCheckedCallback = Function(String tag, bool valid);
typedef OnEditingCompleteCallback = void Function();
typedef OnSelectionHandleTappedCallback = void Function();
typedef OnSelectionChangedCallback = void Function(
  TextSelection,
  SelectionChangedCause?,
);
typedef OnSubmittedCallback = void Function(String);
typedef OnTapOutsideCallback = void Function(PointerDownEvent);

class EditText<T extends EditTextController> extends TextView<T> {
  final bool? autocorrect;
  final Color? autocorrectionTextRectColor;
  final AutofillClient? autofillClient;
  final List<String>? autofillHints;
  final bool? autoFocus;
  final Color? backgroundCursorColor;
  final Clip? clipBehaviorText;
  final Color? cursorColor;
  final double? cursorHeight;
  final Offset? cursorOffset;
  final bool? cursorOpacityAnimates;
  final Radius? cursorRadius;
  final double? cursorWidth;
  final ContentInsertionConfiguration? contentInsertionConfiguration;
  final ContextMenuBuilder? contextMenuBuilder;
  final DragStartBehavior? dragStartBehavior;
  final bool? enableIMEPersonalizedLearning;
  final bool? enableInteractiveSelection;
  final bool? enableSuggestions;
  final bool? expands;
  final bool? forceLine;
  final TextInputType? inputType;
  final Brightness? keyboardAppearance;
  final Locale? locale;
  final TextMagnifierConfiguration? magnifierConfiguration;
  final int? minLines;
  final MouseCursor? mouseCursor;
  final bool? obscureText;
  final String? obscuringCharacter;
  final OnAppPrivateCommandCallback? onAppPrivateCommand;
  final OnCheckedCallback? onChecked;
  final OnSelectionHandleTappedCallback? onEditingComplete;
  final OnSelectionChangedCallback? onSelectionChanged;
  final OnSelectionHandleTappedCallback? onSelectionHandleTapped;
  final OnSubmittedCallback? onSubmitted;
  final OnTapOutsideCallback? onTapOutside;
  final bool? paintCursorAboveText;
  final bool? readOnly;
  final bool? rendererIgnoresPointer;
  final String? restorationId;
  final bool? scribbleEnabled;
  final ScrollBehavior? scrollBehaviorText;
  final ScrollController? scrollControllerText;
  final EdgeInsets? scrollPaddingText;
  final ScrollPhysics? scrollPhysicsText;
  final Color? selectionColor;
  final TextSelectionControls? selectionControls;
  final BoxHeightStyle? selectionHeightStyle;
  final BoxWidthStyle? selectionWidthStyle;
  final bool? showCursor;
  final bool? showSelectionHandles;
  final SmartDashesType? smartDashesType;
  final SmartQuotesType? smartQuotesType;
  final SpellCheckConfiguration? spellCheckConfiguration;
  final StrutStyle? strutStyle;
  final TextCapitalization? textCapitalization;
  final TextInputAction? textInputAction;
  final TextHeightBehavior? textHeightBehavior;
  final TextWidthBasis? textWidthBasis;
  final double? textScaleFactor;
  final UndoHistoryController? undoController;

  final String? id;
  final Color? primary;
  final String? hint;
  final Color? hintColor;
  final String? digits;
  final int? minCharacters;

  const EditText({
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
    super.ripple,
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
    super.wordSpacing,
    super.fontFamily,
    super.fontStyle,
    super.fontWeight,
    super.text,
    super.textAlign,
    super.textAllCaps,
    super.textColor,
    super.textOverflow,
    super.textSize,
    super.textStyle,
    super.onChange,
    super.onError,
    super.onValid,
    super.onValidator,
    this.autocorrect,
    this.autocorrectionTextRectColor,
    this.autofillClient,
    this.autofillHints,
    this.autoFocus,
    this.backgroundCursorColor,
    this.clipBehaviorText,
    this.cursorColor,
    this.cursorHeight,
    this.cursorOffset,
    this.cursorOpacityAnimates,
    this.cursorRadius,
    this.cursorWidth,
    this.contentInsertionConfiguration,
    this.contextMenuBuilder,
    this.dragStartBehavior,
    this.enableIMEPersonalizedLearning,
    this.enableInteractiveSelection,
    this.enableSuggestions,
    this.expands,
    this.forceLine,
    this.keyboardAppearance,
    this.inputType,
    this.locale,
    this.magnifierConfiguration,
    this.minLines,
    this.mouseCursor,
    this.obscureText,
    this.obscuringCharacter,
    this.onAppPrivateCommand,
    this.onEditingComplete,
    this.onChecked,
    this.onSelectionChanged,
    this.onSelectionHandleTapped,
    this.onSubmitted,
    this.onTapOutside,
    this.paintCursorAboveText,
    this.readOnly,
    this.rendererIgnoresPointer,
    this.restorationId,
    this.scribbleEnabled,
    this.scrollBehaviorText,
    this.scrollControllerText,
    this.scrollPaddingText,
    this.scrollPhysicsText,
    this.selectionColor,
    this.selectionControls,
    this.selectionHeightStyle,
    this.selectionWidthStyle,
    this.showCursor,
    this.showSelectionHandles,
    this.smartDashesType,
    this.smartQuotesType,
    this.spellCheckConfiguration,
    this.strutStyle,
    this.textCapitalization,
    this.textInputAction,
    this.textHeightBehavior,
    this.textWidthBasis,
    this.textScaleFactor,
    this.undoController,
    this.id,
    this.primary,
    this.hint,
    this.hintColor,
    this.digits,
    this.minCharacters,
  });

  @override
  ViewRoots initRootProperties() => const ViewRoots(padding: false);

  @override
  T initController() => EditTextController() as T;

  @override
  T attachController(T controller) => controller.fromEditText(this) as T;

  @override
  void onDispose(T controller) {
    controller._dispose();
  }

  @override
  Widget? attach(BuildContext context, T controller) {
    final hasError = controller.hasError;
    final theme = Theme.of(context);
    final primaryColor = controller.primary ?? theme.primaryColor;
    const secondaryColor = Color(0xffbbbbbb);
    const underlineColor = Color(0xffe1e1e1);
    var style = TextStyle(
      color: controller.textColor ?? Colors.black,
      fontSize: controller.textSize,
    );
    return GestureDetector(
      onTap: controller.showKeyboard,
      child: AbsorbPointer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              alignment: Alignment.centerLeft,
              padding: controller.padding,
              child: Stack(
                alignment: Alignment.topLeft,
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
                    readOnly: controller.readOnly,
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
                    textAlign: controller.textAlign,
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
            _ETUnderline(
              visible: controller.showUnderline,
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
    );
  }
}

class EditTextController extends TextViewController {
  late TextEditingController _editable;
  late FocusNode _node;
  bool? _focused;
  bool _initial = true;
  String _error = "";

  String? id;

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
  ContextMenuBuilder? contextMenuBuilder;
  DragStartBehavior dragStartBehavior = DragStartBehavior.start;
  bool enableIMEPersonalizedLearning = true;
  bool? enableInteractiveSelection;
  bool enableSuggestions = true;
  bool expands = false;
  bool forceLine = true;
  Brightness keyboardAppearance = Brightness.light;
  TextInputType? inputType;
  Locale? locale;
  TextMagnifierConfiguration magnifierConfiguration =
      TextMagnifierConfiguration.disabled;
  int? minLines;
  MouseCursor? mouseCursor;
  bool obscureText = false;
  String obscuringCharacter = '•';
  OnAppPrivateCommandCallback? onAppPrivateCommand;
  OnCheckedCallback? onChecked;
  OnSelectionHandleTappedCallback? onEditingComplete;
  OnSelectionChangedCallback? onSelectionChanged;
  OnSelectionHandleTappedCallback? onSelectionHandleTapped;
  OnSubmittedCallback? onSubmitted;
  OnTapOutsideCallback? onTapOutside;
  bool paintCursorAboveText = false;
  bool readOnly = false;
  bool rendererIgnoresPointer = false;
  String? restorationId;
  bool scribbleEnabled = true;
  ScrollBehavior? scrollBehaviorText;
  ScrollController? scrollControllerText;
  EdgeInsets scrollPaddingText = const EdgeInsets.all(20);
  ScrollPhysics? scrollPhysicsText;
  Color? selectionColor;
  TextSelectionControls? selectionControls;
  BoxHeightStyle selectionHeightStyle = BoxHeightStyle.tight;
  BoxWidthStyle selectionWidthStyle = BoxWidthStyle.tight;
  bool? showCursor;
  bool showSelectionHandles = false;
  SmartDashesType? smartDashesType;
  SmartQuotesType? smartQuotesType;
  SpellCheckConfiguration? spellCheckConfiguration;
  StrutStyle? strutStyle;
  TextCapitalization textCapitalization = TextCapitalization.none;
  TextInputAction? textInputAction;
  TextHeightBehavior? textHeightBehavior;
  TextWidthBasis textWidthBasis = TextWidthBasis.parent;
  double? textScaleFactor;
  UndoHistoryController? undoController;

  Color? primary;
  String hint = "";
  Color? hintColor;
  String helperText = "";
  Color? helperTextColor;
  Color? floatingLabelColor;
  double floatingLabelSize = 12;
  bool floatingLabelVisible = false;
  bool errorVisible = false;
  Color? errorColor = const Color(0xFFF44336);
  bool counterVisible = false;
  String? digits;
  int minCharacters = 0;

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

  EditTextController() {
    _editable = TextEditingController();
    _node = FocusNode();
    _node.addListener(_handleFocusChange);
  }

  EditTextController fromEditText(EditText view) {
    super.fromTextView(view);
    autocorrect = view.autocorrect ?? true;
    autocorrectionTextRectColor = view.autocorrectionTextRectColor;
    autofillClient = view.autofillClient;
    autofillHints = view.autofillHints ?? [];
    autoFocus = view.autoFocus ?? false;
    backgroundCursorColor = view.backgroundCursorColor;
    clipBehaviorText = view.clipBehaviorText ?? Clip.hardEdge;
    cursorColor = view.cursorColor;
    cursorHeight = view.cursorHeight;
    cursorOffset = view.cursorOffset;
    cursorOpacityAnimates = view.cursorOpacityAnimates ?? false;
    cursorRadius = view.cursorRadius;
    cursorWidth = view.cursorWidth ?? 2.0;
    contentInsertionConfiguration = view.contentInsertionConfiguration;
    contextMenuBuilder = view.contextMenuBuilder;
    dragStartBehavior = view.dragStartBehavior ?? DragStartBehavior.start;
    enableIMEPersonalizedLearning = view.enableIMEPersonalizedLearning ?? true;
    enableInteractiveSelection = view.enableInteractiveSelection;
    enableSuggestions = view.enableSuggestions ?? true;
    expands = view.expands ?? false;
    forceLine = view.forceLine ?? true;
    keyboardAppearance = view.keyboardAppearance ?? Brightness.light;
    inputType = view.inputType;
    locale = view.locale;
    magnifierConfiguration =
        view.magnifierConfiguration ?? TextMagnifierConfiguration.disabled;
    minLines = view.minLines;
    mouseCursor = view.mouseCursor;
    obscureText = view.obscureText ?? false;
    obscuringCharacter = view.obscuringCharacter ?? '•';
    onAppPrivateCommand = view.onAppPrivateCommand;
    onChecked = view.onChecked;
    onEditingComplete = view.onEditingComplete;
    onSelectionChanged = view.onSelectionChanged;
    onSelectionHandleTapped = view.onSelectionHandleTapped;
    onSubmitted = view.onSubmitted;
    onTapOutside = view.onTapOutside;
    paintCursorAboveText = view.paintCursorAboveText ?? false;
    readOnly = view.readOnly ?? false;
    rendererIgnoresPointer = view.rendererIgnoresPointer ?? false;
    restorationId = view.restorationId;
    scribbleEnabled = view.scribbleEnabled ?? true;
    scrollBehaviorText = view.scrollBehaviorText;
    scrollControllerText = view.scrollControllerText;
    scrollPaddingText = view.scrollPaddingText ?? const EdgeInsets.all(20);
    scrollPhysicsText = view.scrollPhysicsText;
    selectionColor = view.selectionColor;
    selectionControls = view.selectionControls;
    selectionHeightStyle = view.selectionHeightStyle ?? BoxHeightStyle.tight;
    selectionWidthStyle = view.selectionWidthStyle ?? BoxWidthStyle.tight;
    showCursor = view.showCursor;
    showSelectionHandles = view.showSelectionHandles ?? false;
    smartDashesType = view.smartDashesType;
    smartQuotesType = view.smartQuotesType;
    spellCheckConfiguration = view.spellCheckConfiguration;
    strutStyle = view.strutStyle;
    textCapitalization = view.textCapitalization ?? TextCapitalization.none;
    textInputAction = view.textInputAction;
    textHeightBehavior = view.textHeightBehavior;
    textWidthBasis = view.textWidthBasis ?? TextWidthBasis.parent;
    textScaleFactor = view.textScaleFactor;
    undoController = view.undoController;

    _editable.text = view.text ?? "";
    id = view.id;
    primary = view.primary;
    textSize = view.textSize ?? 18;
    textColor = view.textColor;
    hint = view.hint ?? "";
    hintColor = view.hintColor;
    textAlign = view.textAlign ?? TextAlign.start;
    digits = view.digits;
    maxCharacters = view.maxCharacters ?? 0;
    minCharacters = view.minCharacters ?? 0;
    onChange = view.onChange;
    return this;
  }

  bool get isValid {
    final v = onValidator?.call(_editable.text);
    onValid?.call(v ?? false);
    return v ?? true;
  }

  bool get hasError => !isValid && _error.isNotEmpty;

  bool get isFocused => _focused ?? false;

  @override
  set text(String? value) => _editable.text = value ?? "";

  @override
  String get text => _editable.text;

  @override
  TextAlign get textAlign => super.textAlign ?? TextAlign.start;

  @override
  TextStyle get textStyle => super.textStyle.copyWith(
        color: Colors.black,
        fontSize: 18,
      );

  List<TextInputFormatter>? get formatter {
    if ((digits ?? "").isNotEmpty) {
      return [
        FilteringTextInputFormatter.allow(RegExp("[$digits]")),
      ];
    }
    return null;
  }

  bool get showHint => _editable.text.isEmpty;

  bool get showUnderline => background == null && borderAll <= 0;

  @override
  EdgeInsets get padding =>
      super.padding ?? const EdgeInsets.symmetric(vertical: 8);

  void showKeyboard() async {
    if (_node.hasFocus) {
      _node.unfocus();
      await Future.delayed(const Duration(milliseconds: 100)).then((value) {
        FocusScope.of(context).requestFocus(_node);
      });
    } else {
      FocusScope.of(context).requestFocus(_node);
    }
  }

  void hideKeyboard() => _node.unfocus();

  void _handleFocusChange() {
    if (_node.hasFocus != _focused) {
      _focused = _node.hasFocus;
      _notify;
    }
  }

  void _handleEditingChange(String value) {
    _initial = false;
    onChange?.call(value);
    _error = onError?.call(_errorType(value)) ?? "";
    onChecked?.call(id ?? "$hashCode", isValid);
    _notify;
  }

  ViewError _errorType(String text) {
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

  void _dispose() {
    _editable.dispose();
    _node.dispose();
  }
}

class _ETUnderline extends StatelessWidget {
  final Color? primary;
  final bool visible;
  final bool enabled;
  final bool focused;
  final bool error;
  final double height;
  final ValueState<Color> colorState;

  const _ETUnderline({
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
      child: Column(
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
      ),
    );
  }
}
