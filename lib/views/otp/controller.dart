part of 'view.dart';

class OtpViewController extends ViewController {
  OtpViewController fromOtpView(OtpView view) {
    super.fromView(view);
    _init(view);
    return this;
  }

  void _init(OtpView view) {
    autofillHints = view.autofillHints;
    autofocus = view.autofocus;
    autoValidateMode = view.autoValidateMode;
    closeKeyboardWhenCompleted = view.closeKeyboardWhenCompleted;
    contextMenuBuilder = view.contextMenuBuilder;
    crossAxisAlignment = view.crossAxisAlignment;
    cursor = view.cursor;
    disabledInputTheme = view.disabledInputTheme;
    enableIMEPersonalizedLearning = view.enableIMEPersonalizedLearning;
    enableSuggestions = view.enableSuggestions;
    errorBuilder = view.errorBuilder;
    errorInputTheme = view.errorInputTheme;
    errorText = view.errorText;
    errorTextStyle = view.errorTextStyle;
    focusedInputTheme = view.focusedInputTheme;
    focusNode = view.focusNode;
    followingInputTheme = view.followingInputTheme;
    forceErrorState = view.forceErrorState;
    hapticFeedbackType = view.hapticFeedbackType;
    initialFilledWidget = view.initialFilledWidget;
    inputAnimationCurve = view.inputAnimationCurve;
    inputAnimationDuration = view.inputAnimationDuration;
    inputAnimationType = view.inputAnimationType;
    inputContentAlignment = view.inputContentAlignment;
    inputController = view.inputController;
    inputFormatters = view.inputFormatters;
    inputSize = view.inputSize;
    text = view.text;
    inputTheme = view.inputTheme;
    inputType = view.inputType;
    inputValidator = view.inputValidator;
    isCursorAnimationEnabled = view.isCursorAnimationEnabled;
    keyboardAppearance = view.keyboardAppearance;
    listenForMultipleSms = view.listenForMultipleSms;
    mainAxisAlignment = view.mainAxisAlignment;
    mouseCursor = view.mouseCursor;
    obscureText = view.obscureText;
    obscuringCharacter = view.obscuringCharacter;
    obscuringWidget = view.obscuringWidget;
    onTap = view.onTap;
    onChanged = view.onChanged;
    onAppPrivateCommand = view.onAppPrivateCommand;
    onClipboardFound = view.onClipboardFound;
    onCompleted = view.onCompleted;
    onLongPress = view.onLongPress;
    onSubmitted = view.onSubmitted;
    onTapOutside = view.onTapOutside;
    readOnly = view.readOnly;
    scrollPadding = view.scrollPadding;
    selectionControls = view.selectionControls;
    senderPhoneNumber = view.senderPhoneNumber;
    separatorBuilder = view.separatorBuilder;
    showCursor = view.showCursor;
    slideTransitionBeginOffset = view.slideTransitionBeginOffset;
    smsAutofillMethod = view.smsAutofillMethod;
    smsCodeMatcher = view.smsCodeMatcher;
    submittedInputTheme = view.submittedInputTheme;
    textCapitalization = view.textCapitalization;
    textInputAction = view.textInputAction;
    toolbarEnabled = view.toolbarEnabled;
    useNativeKeyboard = view.useNativeKeyboard;
  }

  TextEditingController? inputController;

  void setInputController(TextEditingController? value) {
    onNotifyWithCallback(() => inputController = value);
  }

  String? text;

  void setText(String value) {
    onNotifyWithCallback(() => text = value);
  }

  InputTheme? inputTheme;

  void setInputTheme(InputTheme? value) {
    onNotifyWithCallback(() => inputTheme = value);
  }

  InputTheme? focusedInputTheme;

  void setFocusedInputTheme(InputTheme? value) {
    onNotifyWithCallback(() => focusedInputTheme = value);
  }

  InputTheme? submittedInputTheme;

  void setSubmittedInputTheme(InputTheme? value) {
    onNotifyWithCallback(() => submittedInputTheme = value);
  }

  InputTheme? followingInputTheme;

  void setFollowingInputTheme(InputTheme? value) {
    onNotifyWithCallback(() => followingInputTheme = value);
  }

  InputTheme? disabledInputTheme;

  void setDisabledInputTheme(InputTheme? value) {
    onNotifyWithCallback(() => disabledInputTheme = value);
  }

  InputTheme? errorInputTheme;

  void setErrorInputTheme(InputTheme? value) {
    onNotifyWithCallback(() => errorInputTheme = value);
  }

  bool closeKeyboardWhenCompleted = true;

  void setCloseKeyboardWhenCompleted(bool value) {
    onNotifyWithCallback(() => closeKeyboardWhenCompleted = value);
  }

  int inputSize = 4;

  void setInputSize(int value) {
    onNotifyWithCallback(() => inputSize = value);
  }

  SmsAutofillMethod smsAutofillMethod = SmsAutofillMethod.none;

  void setSmsAutofillMethod(SmsAutofillMethod value) {
    onNotifyWithCallback(() => smsAutofillMethod = value);
  }

  bool listenForMultipleSms = false;

  void setListenForMultipleSms(bool value) {
    onNotifyWithCallback(() => listenForMultipleSms = value);
  }

  String smsCodeMatcher = '\\d{4,7}';

  void setSmsCodeMatcher(String value) {
    onNotifyWithCallback(() => smsCodeMatcher = value);
  }

  ValueChanged<String>? onCompleted;

  void setOnCompleted(ValueChanged<String>? value) {
    onNotifyWithCallback(() => onCompleted = value);
  }

  ValueChanged<String>? onChanged;

  void setOnChanged(ValueChanged<String>? value) {
    onNotifyWithCallback(() => onChanged = value);
  }

  ValueChanged<String>? onSubmitted;

  void setOnSubmitted(ValueChanged<String>? value) {
    onNotifyWithCallback(() => onSubmitted = value);
  }

  VoidCallback? onTap;

  void setOnTap(VoidCallback? value) {
    onNotifyWithCallback(() => onTap = value);
  }

  VoidCallback? onLongPress;

  void setOnLongPress(VoidCallback? value) {
    onNotifyWithCallback(() => onLongPress = value);
  }

  FocusNode? focusNode;

  void setFocusNode(FocusNode? value) {
    onNotifyWithCallback(() => focusNode = value);
  }

  Widget? initialFilledWidget;

  void setInitialFilledWidget(Widget? value) {
    onNotifyWithCallback(() => initialFilledWidget = value);
  }

  JustIndexedWidgetBuilder? separatorBuilder;

  void setSeparatorBuilder(JustIndexedWidgetBuilder? value) {
    onNotifyWithCallback(() => separatorBuilder = value);
  }

  MainAxisAlignment mainAxisAlignment = MainAxisAlignment.center;

  void setMainAxisAlignment(MainAxisAlignment value) {
    onNotifyWithCallback(() => mainAxisAlignment = value);
  }

  CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center;

  void setCrossAxisAlignment(CrossAxisAlignment value) {
    onNotifyWithCallback(() => crossAxisAlignment = value);
  }

  Alignment inputContentAlignment = Alignment.center;

  void setInputContentAlignment(Alignment value) {
    onNotifyWithCallback(() => inputContentAlignment = value);
  }

  Curve inputAnimationCurve = Curves.easeIn;

  void setInputAnimationCurve(Curve value) {
    onNotifyWithCallback(() => inputAnimationCurve = value);
  }

  Duration inputAnimationDuration = Duration(milliseconds: 180);

  void setInputAnimationDuration(Duration value) {
    onNotifyWithCallback(() => inputAnimationDuration = value);
  }

  InputAnimationType inputAnimationType = InputAnimationType.scale;

  void setInputAnimationType(InputAnimationType value) {
    onNotifyWithCallback(() => inputAnimationType = value);
  }

  Offset? slideTransitionBeginOffset;

  void setSlideTransitionBeginOffset(Offset? value) {
    onNotifyWithCallback(() => slideTransitionBeginOffset = value);
  }

  bool readOnly = true;

  void setReadOnly(bool value) {
    onNotifyWithCallback(() => readOnly = value);
  }

  bool autofocus = false;

  void setAutofocus(bool value) {
    onNotifyWithCallback(() => autofocus = value);
  }

  bool useNativeKeyboard = true;

  void setUseNativeKeyboard(bool value) {
    onNotifyWithCallback(() => useNativeKeyboard = value);
  }

  bool toolbarEnabled = true;

  void setToolbarEnabled(bool value) {
    onNotifyWithCallback(() => toolbarEnabled = value);
  }

  bool showCursor = false;

  void setShowCursor(bool value) {
    onNotifyWithCallback(() => showCursor = value);
  }

  bool isCursorAnimationEnabled = true;

  void setIsCursorAnimationEnabled(bool value) {
    onNotifyWithCallback(() => isCursorAnimationEnabled = value);
  }

  bool enableIMEPersonalizedLearning = false;

  void setEnableIMEPersonalizedLearning(bool value) {
    onNotifyWithCallback(() => enableIMEPersonalizedLearning = value);
  }

  Widget? cursor;

  void setCursor(Widget? value) {
    onNotifyWithCallback(() => cursor = value);
  }

  Brightness? keyboardAppearance;

  void setKeyboardAppearance(Brightness? value) {
    onNotifyWithCallback(() => keyboardAppearance = value);
  }

  List<TextInputFormatter> inputFormatters = const [];

  void setInputFormatters(List<TextInputFormatter> value) {
    onNotifyWithCallback(() => inputFormatters = value);
  }

  TextInputType inputType = TextInputType.number;

  void setInputType(TextInputType value) {
    onNotifyWithCallback(() => inputType = value);
  }

  String obscuringCharacter = '•';

  void setObscuringCharacter(String value) {
    onNotifyWithCallback(() => obscuringCharacter = value);
  }

  Widget? obscuringWidget;

  void setObscuringWidget(Widget? value) {
    onNotifyWithCallback(() => obscuringWidget = value);
  }

  bool obscureText = false;

  void setObscureText(bool value) {
    onNotifyWithCallback(() => obscureText = value);
  }

  TextCapitalization textCapitalization = TextCapitalization.none;

  void setTextCapitalization(TextCapitalization value) {
    onNotifyWithCallback(() => textCapitalization = value);
  }

  TextInputAction? textInputAction;

  void setTextInputAction(TextInputAction? value) {
    onNotifyWithCallback(() => textInputAction = value);
  }

  Iterable<String>? autofillHints;

  void setAutofillHints(Iterable<String>? value) {
    onNotifyWithCallback(() => autofillHints = value);
  }

  bool enableSuggestions = true;

  void setEnableSuggestions(bool value) {
    onNotifyWithCallback(() => enableSuggestions = value);
  }

  TextSelectionControls? selectionControls;

  void setSelectionControls(TextSelectionControls? value) {
    onNotifyWithCallback(() => selectionControls = value);
  }

  String? restorationId;

  void setRestorationId(String? value) {
    onNotifyWithCallback(() => restorationId = value);
  }

  ValueChanged<String>? onClipboardFound;

  void setOnClipboardFound(ValueChanged<String>? value) {
    onNotifyWithCallback(() => onClipboardFound = value);
  }

  HapticFeedbackType hapticFeedbackType = HapticFeedbackType.disabled;

  void setHapticFeedbackType(HapticFeedbackType value) {
    onNotifyWithCallback(() => hapticFeedbackType = value);
  }

  AppPrivateCommandCallback? onAppPrivateCommand;

  void setOnAppPrivateCommand(AppPrivateCommandCallback? value) {
    onNotifyWithCallback(() => onAppPrivateCommand = value);
  }

  MouseCursor? mouseCursor;

  void setMouseCursor(MouseCursor? value) {
    onNotifyWithCallback(() => mouseCursor = value);
  }

  bool forceErrorState = false;

  void setForceErrorState(bool value) {
    onNotifyWithCallback(() => forceErrorState = value);
  }

  String? errorText;

  void setErrorText(String? value) {
    onNotifyWithCallback(() => errorText = value);
  }

  TextStyle? errorTextStyle;

  void setErrorTextStyle(TextStyle? value) {
    onNotifyWithCallback(() => errorTextStyle = value);
  }

  OnErrorBuilder? errorBuilder;

  void setErrorBuilder(OnErrorBuilder? value) {
    onNotifyWithCallback(() => errorBuilder = value);
  }

  FormFieldValidator<String>? inputValidator;

  void setInputValidator(FormFieldValidator<String>? value) {
    onNotifyWithCallback(() => inputValidator = value);
  }

  AutoValidateMode autoValidateMode = AutoValidateMode.onSubmit;

  void setAutoValidateMode(AutoValidateMode value) {
    onNotifyWithCallback(() => autoValidateMode = value);
  }

  EdgeInsets scrollPadding = const EdgeInsets.all(20);

  void setScrollPadding(EdgeInsets value) {
    onNotifyWithCallback(() => scrollPadding = value);
  }

  String? senderPhoneNumber;

  void setSenderPhoneNumber(String? value) {
    onNotifyWithCallback(() => senderPhoneNumber = value);
  }

  EditableTextContextMenuBuilder? contextMenuBuilder;

  void setContextMenuBuilder(EditableTextContextMenuBuilder? value) {
    onNotifyWithCallback(() => contextMenuBuilder = value);
  }

  TapRegionCallback? onTapOutside;

  void setOnTapOutside(TapRegionCallback? value) {
    onNotifyWithCallback(() => onTapOutside = value);
  }
}
