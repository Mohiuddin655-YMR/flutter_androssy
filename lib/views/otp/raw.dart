part of 'view.dart';

class RawOtpView extends StatefulWidget {
  const RawOtpView({
    super.key,
    this.inputSize = _Constants._defaultLength,
    this.text,
    this.inputTheme,
    this.focusedInputTheme,
    this.submittedInputTheme,
    this.followingInputTheme,
    this.disabledInputTheme,
    this.errorInputTheme,
    this.onChanged,
    this.onCompleted,
    this.onSubmitted,
    this.onTap,
    this.onLongPress,
    this.inputController,
    this.focusNode,
    this.initialFilledWidget,
    this.separatorBuilder,
    this.smsCodeMatcher = _Constants.defaultSmsCodeMatcher,
    this.senderPhoneNumber,
    this.smsAutofillMethod = SmsAutofillMethod.none,
    this.listenForMultipleSms = false,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.inputContentAlignment = Alignment.center,
    this.inputAnimationCurve = Curves.easeIn,
    this.inputAnimationDuration = _Constants._animationDuration,
    this.inputAnimationType = InputAnimationType.scale,
    this.enabled = true,
    this.readOnly = false,
    this.useNativeKeyboard = true,
    this.toolbarEnabled = true,
    this.autofocus = false,
    this.obscureText = false,
    this.showCursor = true,
    this.isCursorAnimationEnabled = true,
    this.enableIMEPersonalizedLearning = false,
    this.enableSuggestions = true,
    this.hapticFeedbackType = HapticFeedbackType.disabled,
    this.closeKeyboardWhenCompleted = true,
    this.inputType = TextInputType.number,
    this.textCapitalization = TextCapitalization.none,
    this.slideTransitionBeginOffset,
    this.cursor,
    this.keyboardAppearance,
    this.inputFormatters = const [],
    this.textInputAction,
    this.autofillHints,
    this.obscuringCharacter = '•',
    this.obscuringWidget,
    this.selectionControls,
    this.restorationId,
    this.onClipboardFound,
    this.onAppPrivateCommand,
    this.mouseCursor,
    this.forceErrorState = false,
    this.errorText,
    this.inputValidator,
    this.errorBuilder,
    this.errorTextStyle,
    this.autoValidateMode = AutoValidateMode.onSubmit,
    this.scrollPadding = const EdgeInsets.all(20),
    this.contextMenuBuilder = _defaultContextMenuBuilder,
    this.onTapOutside,
  })  : assert(obscuringCharacter.length == 1),
        assert(inputSize > 0),
        assert(
          textInputAction != TextInputAction.newline,
          'Inputs are not multiline',
        );

  final String? text;

  final InputTheme? inputTheme;

  final InputTheme? focusedInputTheme;

  final InputTheme? submittedInputTheme;

  final InputTheme? followingInputTheme;

  final InputTheme? disabledInputTheme;

  final InputTheme? errorInputTheme;

  final bool closeKeyboardWhenCompleted;

  final int inputSize;

  final SmsAutofillMethod smsAutofillMethod;

  final bool listenForMultipleSms;

  final String smsCodeMatcher;

  final ValueChanged<String>? onCompleted;

  final ValueChanged<String>? onChanged;

  final ValueChanged<String>? onSubmitted;

  final VoidCallback? onTap;

  final VoidCallback? onLongPress;

  final TextEditingController? inputController;

  final FocusNode? focusNode;

  final Widget? initialFilledWidget;

  final JustIndexedWidgetBuilder? separatorBuilder;

  final MainAxisAlignment mainAxisAlignment;

  final CrossAxisAlignment crossAxisAlignment;

  final AlignmentGeometry inputContentAlignment;

  final Curve inputAnimationCurve;

  final Duration inputAnimationDuration;

  final InputAnimationType inputAnimationType;

  final Offset? slideTransitionBeginOffset;

  final bool enabled;

  final bool readOnly;

  final bool autofocus;

  final bool useNativeKeyboard;

  final bool toolbarEnabled;

  final bool showCursor;

  final bool isCursorAnimationEnabled;

  final bool enableIMEPersonalizedLearning;

  final Widget? cursor;

  final Brightness? keyboardAppearance;

  final List<TextInputFormatter> inputFormatters;

  final TextInputType inputType;

  final String obscuringCharacter;

  final Widget? obscuringWidget;

  final bool obscureText;

  final TextCapitalization textCapitalization;

  final TextInputAction? textInputAction;

  final Iterable<String>? autofillHints;

  final bool enableSuggestions;

  final TextSelectionControls? selectionControls;

  final String? restorationId;

  final ValueChanged<String>? onClipboardFound;

  final HapticFeedbackType hapticFeedbackType;

  final AppPrivateCommandCallback? onAppPrivateCommand;

  final MouseCursor? mouseCursor;

  final bool forceErrorState;

  final String? errorText;

  final TextStyle? errorTextStyle;

  final OnErrorBuilder? errorBuilder;

  final FormFieldValidator<String>? inputValidator;

  final AutoValidateMode autoValidateMode;

  final EdgeInsets scrollPadding;

  final String? senderPhoneNumber;

  final EditableTextContextMenuBuilder? contextMenuBuilder;

  final TapRegionCallback? onTapOutside;

  static Widget _defaultContextMenuBuilder(
    BuildContext context,
    EditableTextState editableTextState,
  ) {
    return AdaptiveTextSelectionToolbar.editableText(
      editableTextState: editableTextState,
    );
  }

  @override
  State<RawOtpView> createState() => _RawOtpViewState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<InputTheme>(
        'defaultPinTheme',
        inputTheme,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<InputTheme>(
        'focusedPinTheme',
        focusedInputTheme,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<InputTheme>(
        'submittedPinTheme',
        submittedInputTheme,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<InputTheme>(
        'followingPinTheme',
        followingInputTheme,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<InputTheme>(
        'disabledPinTheme',
        disabledInputTheme,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<InputTheme>(
        'errorPinTheme',
        errorInputTheme,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<TextEditingController>(
        'controller',
        inputController,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<FocusNode>(
        'focusNode',
        focusNode,
        defaultValue: null,
      ),
    );
    properties
        .add(DiagnosticsProperty<bool>('enabled', enabled, defaultValue: true));
    properties.add(
      DiagnosticsProperty<bool>(
        'closeKeyboardWhenCompleted',
        closeKeyboardWhenCompleted,
        defaultValue: true,
      ),
    );
    properties.add(
      DiagnosticsProperty<TextInputType>(
        'keyboardType',
        inputType,
        defaultValue: TextInputType.number,
      ),
    );
    properties.add(
      DiagnosticsProperty<int>(
        'length',
        inputSize,
        defaultValue: _Constants._defaultLength,
      ),
    );
    properties.add(
      DiagnosticsProperty<String>(
        'text',
        text,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<ValueChanged<String>?>(
        'onCompleted',
        onCompleted,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<ValueChanged<String>?>(
        'onChanged',
        onChanged,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<ValueChanged<String>?>(
        'onClipboardFound',
        onClipboardFound,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<VoidCallback?>('onTap', onTap, defaultValue: null),
    );
    properties.add(
      DiagnosticsProperty<VoidCallback?>(
        'onLongPress',
        onLongPress,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<Widget?>(
        'preFilledWidget',
        initialFilledWidget,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<Widget?>('cursor', cursor, defaultValue: null),
    );
    properties.add(
      DiagnosticsProperty<JustIndexedWidgetBuilder?>(
        'separatorBuilder',
        separatorBuilder,
        defaultValue: _Constants._defaultSeparator,
      ),
    );
    properties.add(
      DiagnosticsProperty<Widget?>(
        'obscuringWidget',
        obscuringWidget,
        defaultValue: null,
      ),
    );

    properties.add(
      DiagnosticsProperty<MainAxisAlignment>(
        'mainAxisAlignment',
        mainAxisAlignment,
        defaultValue: MainAxisAlignment.center,
      ),
    );
    properties.add(
      DiagnosticsProperty<AlignmentGeometry>(
        'pinContentAlignment',
        inputContentAlignment,
        defaultValue: Alignment.center,
      ),
    );
    properties.add(
      DiagnosticsProperty<Curve>(
        'animationCurve',
        inputAnimationCurve,
        defaultValue: Curves.easeIn,
      ),
    );
    properties.add(
      DiagnosticsProperty<Duration>(
        'animationDuration',
        inputAnimationDuration,
        defaultValue: _Constants._animationDuration,
      ),
    );
    properties.add(
      DiagnosticsProperty<InputAnimationType>(
        'pinAnimationType',
        inputAnimationType,
        defaultValue: InputAnimationType.scale,
      ),
    );
    properties.add(
      DiagnosticsProperty<Offset?>(
        'slideTransitionBeginOffset',
        slideTransitionBeginOffset,
        defaultValue: null,
      ),
    );
    properties
        .add(DiagnosticsProperty<bool>('enabled', enabled, defaultValue: true));
    properties.add(
      DiagnosticsProperty<bool>('readOnly', readOnly, defaultValue: false),
    );
    properties.add(
      DiagnosticsProperty<bool>(
        'obscureText',
        obscureText,
        defaultValue: false,
      ),
    );
    properties.add(
      DiagnosticsProperty<bool>('autofocus', autofocus, defaultValue: false),
    );
    properties.add(
      DiagnosticsProperty<bool>(
        'useNativeKeyboard',
        useNativeKeyboard,
        defaultValue: false,
      ),
    );
    properties.add(
      DiagnosticsProperty<bool>(
        'toolbarEnabled',
        toolbarEnabled,
        defaultValue: true,
      ),
    );
    properties.add(
      DiagnosticsProperty<bool>(
        'showCursor',
        showCursor,
        defaultValue: true,
      ),
    );
    properties.add(
      DiagnosticsProperty<String>(
        'obscuringCharacter',
        obscuringCharacter,
        defaultValue: '•',
      ),
    );
    properties.add(
      DiagnosticsProperty<bool>(
        'obscureText',
        obscureText,
        defaultValue: false,
      ),
    );
    properties.add(
      DiagnosticsProperty<bool>(
        'enableSuggestions',
        enableSuggestions,
        defaultValue: true,
      ),
    );
    properties.add(
      DiagnosticsProperty<List<TextInputFormatter>>(
        'inputFormatters',
        inputFormatters,
        defaultValue: const <TextInputFormatter>[],
      ),
    );
    properties.add(
      EnumProperty<TextInputAction>(
        'textInputAction',
        textInputAction,
        defaultValue: TextInputAction.done,
      ),
    );
    properties.add(
      EnumProperty<TextCapitalization>(
        'textCapitalization',
        textCapitalization,
        defaultValue: TextCapitalization.none,
      ),
    );
    properties.add(
      DiagnosticsProperty<Brightness>(
        'keyboardAppearance',
        keyboardAppearance,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<TextInputType>(
        'keyboardType',
        inputType,
        defaultValue: TextInputType.number,
      ),
    );
    properties.add(
      DiagnosticsProperty<Iterable<String>?>(
        'autofillHints',
        autofillHints,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<TextSelectionControls?>(
        'selectionControls',
        selectionControls,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<String?>(
        'restorationId',
        restorationId,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<AppPrivateCommandCallback?>(
        'onAppPrivateCommand',
        onAppPrivateCommand,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<MouseCursor?>(
        'mouseCursor',
        mouseCursor,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<TextStyle?>(
        'errorTextStyle',
        errorTextStyle,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<OnErrorBuilder?>(
        'errorBuilder',
        errorBuilder,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<FormFieldValidator<String>?>(
        'validator',
        inputValidator,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<AutoValidateMode>(
        'pinputAutovalidateMode',
        autoValidateMode,
        defaultValue: AutoValidateMode.onSubmit,
      ),
    );
    properties.add(
      DiagnosticsProperty<HapticFeedbackType>(
        'hapticFeedbackType',
        hapticFeedbackType,
        defaultValue: HapticFeedbackType.disabled,
      ),
    );
    properties.add(
      DiagnosticsProperty<String?>(
        'senderPhoneNumber',
        senderPhoneNumber,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<EditableTextContextMenuBuilder?>(
        'contextMenuBuilder',
        contextMenuBuilder,
        defaultValue: _defaultContextMenuBuilder,
      ),
    );
  }
}
