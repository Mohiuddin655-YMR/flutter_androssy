import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../icon/view.dart';
import '../text/view.dart';
import '../view/view.dart';

part 'controller.dart';

part 'drawable_state.dart';

part 'highlight_text.dart';

part 'typedefs.dart';

part 'underline.dart';

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
  final bool autoDisposeMode;
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
  final bool drawableEndAsEye;

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
    this.autoDisposeMode = true,
    this.digits = "",
    this.hint = "",
    this.hintColor,
    this.primary,
    this.minCharacters,

    /// DRAWABLE PROPERTIES
    this.drawableStart,
    this.drawableStartState,
    this.drawableStartBuilder,
    this.drawableStartSize = 24,
    this.drawableStartSizeState,
    this.drawableStartPadding,
    this.drawableStartPaddingState,
    this.drawableStartTint,
    this.drawableStartTintState,
    this.drawableStartVisible = true,
    this.drawableEnd,
    this.drawableEndState,
    this.drawableEndBuilder,
    this.drawableEndSize = 24,
    this.drawableEndSizeState,
    this.drawableEndPadding,
    this.drawableEndPaddingState,
    this.drawableEndTint,
    this.drawableEndTintState,
    this.drawableEndVisible = true,
    this.drawableEndAsEye = false,

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
  void onDispose(context, controller) {
    super.onDispose(context, controller);
    return controller._dispose();
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
    final theme = Theme.of(context);
    final themeStyle = theme.textTheme.bodyLarge ?? const TextStyle();
    final primaryColor = controller.primary ?? theme.primaryColor;
    const underlineColor = Color(0xffe1e1e1);
    const secondaryColor = Color(0xffbbbbbb);
    final errorColor = controller.errorTextColor ?? const Color(0xFFFF7769);
    final hasError = controller.hasError;

    var style = (controller.textStyle ?? themeStyle).copyWith(
      color: controller.textColor,
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
              onToggle:
                  controller.drawableEndAsEye ? controller.onChangeEye : null,
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
                  child: _HighlightText(
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
                Underline(
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
                      _HighlightText(
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
                      _HighlightText(
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
