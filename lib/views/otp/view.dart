import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_androssy/widgets.dart';

part '_item.dart';
part 'constants.dart';
part 'controller.dart';
part 'credential.dart';
part 'enums.dart';
part 'extensions.dart';
part 'raw.dart';
part 'raw_state.dart';
part 'selection_builder.dart';
part 'smart_auth.dart';
part 'sms_code_result.dart';
part 'theme.dart';
part 'utils_mixin.dart';
part 'widgets.dart';

typedef OnErrorBuilder = Widget Function(String? error, String pin);

class OtpView extends YMRView<OtpViewController> {
  final TextEditingController? inputController;

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

  final FocusNode? focusNode;

  final Widget? initialFilledWidget;

  final JustIndexedWidgetBuilder? separatorBuilder;

  final MainAxisAlignment mainAxisAlignment;

  final CrossAxisAlignment crossAxisAlignment;

  final Alignment inputContentAlignment;

  final Curve inputAnimationCurve;

  final Duration inputAnimationDuration;

  final InputAnimationType inputAnimationType;

  final Offset? slideTransitionBeginOffset;

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

  const OtpView({
    /// ROOT PROPERTIES
    super.key,
    super.controller,

    /// CALLBACK PROPERTIES
    super.onActivator,
    super.onChange,
    super.onError,
    super.onHover,
    super.onValid,
    super.onValidator,

    /// CLICK PROPERTIES
    super.clickEffect,
    super.onClick,
    super.onDoubleClick,
    super.onLongClick,
    super.onToggleClick,
    super.onClickHandler,
    super.onDoubleClickHandler,
    super.onLongClickHandler,

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
    super.visibility,
    super.width,
    super.widthState,
    super.widthMax,
    super.widthMin,

    /// ANIMATION PROPERTIES
    super.animation,
    super.animationType,

    /// BACKDROP PROPERTIES
    super.backdropFilter,
    super.backdropMode,

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

    /// INDICATOR PROPERTIES
    super.indicatorVisible,

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

    /// CHILD PROPERTIES
    this.inputController,
    this.inputSize = 4,
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
    this.focusNode,
    this.separatorBuilder,
    this.smsCodeMatcher = '\\d{4,7}',
    this.senderPhoneNumber,
    this.smsAutofillMethod = SmsAutofillMethod.none,
    this.listenForMultipleSms = false,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.initialFilledWidget,
    this.inputAnimationCurve = Curves.easeIn,
    this.inputAnimationDuration = const Duration(milliseconds: 180),
    this.inputAnimationType = InputAnimationType.scale,
    this.inputContentAlignment = Alignment.center,
    this.text,
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
    this.contextMenuBuilder,
    this.onTapOutside,
  });

  @override
  OtpViewController initController() => OtpViewController();

  @override
  OtpViewController attachController(OtpViewController controller) {
    return controller.fromOtpView(this);
  }

  @override
  Widget? attach(BuildContext context, OtpViewController controller) {
    return RawOtpView(
      autofillHints: controller.autofillHints,
      autofocus: controller.autofocus,
      autoValidateMode: controller.autoValidateMode,
      closeKeyboardWhenCompleted: controller.closeKeyboardWhenCompleted,
      contextMenuBuilder: controller.contextMenuBuilder,
      crossAxisAlignment: controller.crossAxisAlignment,
      cursor: controller.cursor,
      disabledInputTheme: controller.disabledInputTheme,
      enableIMEPersonalizedLearning: controller.enableIMEPersonalizedLearning,
      enableSuggestions: controller.enableSuggestions,
      errorBuilder: controller.errorBuilder,
      errorInputTheme: controller.errorInputTheme,
      errorText: controller.errorText,
      errorTextStyle: controller.errorTextStyle,
      focusedInputTheme: controller.focusedInputTheme,
      focusNode: controller.focusNode,
      followingInputTheme: controller.followingInputTheme,
      forceErrorState: controller.forceErrorState,
      hapticFeedbackType: controller.hapticFeedbackType,
      initialFilledWidget: controller.initialFilledWidget,
      inputAnimationCurve: controller.inputAnimationCurve,
      inputAnimationDuration: controller.inputAnimationDuration,
      inputAnimationType: controller.inputAnimationType,
      inputContentAlignment: controller.inputContentAlignment,
      inputController: controller.inputController,
      inputFormatters: controller.inputFormatters,
      inputSize: controller.inputSize,
      inputTheme: controller.inputTheme,
      inputType: controller.inputType,
      inputValidator: controller.inputValidator,
      isCursorAnimationEnabled: controller.isCursorAnimationEnabled,
      keyboardAppearance: controller.keyboardAppearance,
      listenForMultipleSms: controller.listenForMultipleSms,
      mainAxisAlignment: controller.mainAxisAlignment,
      mouseCursor: controller.mouseCursor,
      obscureText: controller.obscureText,
      obscuringCharacter: controller.obscuringCharacter,
      obscuringWidget: controller.obscuringWidget,
      onTap: controller.onTap,
      onChanged: controller.onChanged,
      onAppPrivateCommand: controller.onAppPrivateCommand,
      onClipboardFound: controller.onClipboardFound,
      onCompleted: controller.onCompleted,
      onLongPress: controller.onLongPress,
      onSubmitted: controller.onSubmitted,
      onTapOutside: controller.onTapOutside,
      readOnly: controller.readOnly,
      scrollPadding: controller.scrollPadding,
      selectionControls: controller.selectionControls,
      senderPhoneNumber: controller.senderPhoneNumber,
      separatorBuilder: controller.separatorBuilder,
      showCursor: controller.showCursor,
      slideTransitionBeginOffset: controller.slideTransitionBeginOffset,
      smsAutofillMethod: controller.smsAutofillMethod,
      smsCodeMatcher: controller.smsCodeMatcher,
      submittedInputTheme: controller.submittedInputTheme,
      text: controller.text,
      textCapitalization: controller.textCapitalization,
      textInputAction: controller.textInputAction,
      toolbarEnabled: controller.toolbarEnabled,
      useNativeKeyboard: controller.useNativeKeyboard,
    );
  }
}
