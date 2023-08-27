part of '../widgets.dart';

class MaterialEditForm extends YMRView<MaterialEditFormController> {
  final List<EditText>? children;

  const MaterialEditForm({
    super.key,
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
    super.scrollingType,
    super.scrollController,
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
    super.onValid,
    this.children,
  });

  @override
  void onInit(MaterialEditFormController controller) {
    controller.init();
  }

  @override
  MaterialEditFormController initController() {
    return MaterialEditFormController();
  }

  @override
  MaterialEditFormController attachController(
    MaterialEditFormController controller,
  ) {
    return controller.fromMaterialEditGroup(this);
  }

  @override
  Widget? attach(
    BuildContext context,
    MaterialEditFormController controller,
  ) {
    return Column(
      children: controller.children.map((e) {
        final id = controller._id(e);
        if (e is MaterialEditText) {
          return MaterialEditText(
            controller: e.controller ?? MaterialEditTextController(),
            id: id,
            key: e.key,
            autoFocus: e.autoFocus,
            counterVisible: e.counterVisible,
            digits: e.digits,
            drawableStart: e.drawableStart,
            drawableEnd: e.drawableEnd,
            enabled: e.enabled,
            errorColor: e.errorColor,
            errorVisible: e.errorVisible,
            helperText: e.helperText,
            helperTextColor: e.helperTextColor,
            hint: e.hint,
            hintColor: e.hintColor,
            inputType: e.inputType,
            floatingLabelColor: e.floatingLabelColor,
            floatingLabelSize: e.floatingLabelSize,
            floatingLabelVisible: e.floatingLabelVisible,
            margin: e.margin,
            marginTop: e.marginTop,
            marginBottom: e.marginBottom,
            marginStart: e.marginStart,
            marginEnd: e.marginEnd,
            maxCharacters: e.maxCharacters,
            primary: e.primary,
            obscureText: e.obscureText,
            text: e.text,
            textAlign: e.textAlign,
            textColor: e.textColor,
            textSize: e.textSize,
            onValidator: e.onValidator,
            onChange: e.onChange,
            onError: e.onError,
            onExecute: e.onExecute,
            onChecked: (tag, value) {
              controller._checks[tag] = value;
              controller._checking;
            },
          );
        } else {
          return EditText(
            activated: e.activated,
            absorbMode: e.absorbMode,
            animation: e.animation,
            animationType: e.animationType,
            controller: e.controller,
            autocorrect: e.autocorrect,
            autofillHints: e.autofillHints,
            autoFocus: e.autoFocus,
            border: e.border,
            borderColor: e.borderColor,
            borderRadius: e.borderRadius,
            background: e.background,
            backgroundBlendMode: e.backgroundBlendMode,
            backgroundGradient: e.backgroundGradient,
            backgroundGradientState: e.backgroundGradientState,
            backgroundImage: e.backgroundImage,
            backgroundImageState: e.backgroundImageState,
            backgroundState: e.backgroundState,
            borderBottom: e.borderBottom,
            borderEnd: e.borderEnd,
            borderGradient: e.borderGradient,
            borderHorizontal: e.borderHorizontal,
            borderRadiusBL: e.borderRadiusBL,
            borderRadiusBR: e.borderRadiusBR,
            borderRadiusTL: e.borderRadiusTL,
            borderRadiusTR: e.borderRadiusTR,
            borderStart: e.borderStart,
            borderTop: e.borderTop,
            borderVertical: e.borderVertical,
            cursorOpacityAnimates: e.cursorOpacityAnimates,
            cursorRadius: e.cursorRadius,
            cursorWidth: e.cursorWidth,
            cursorHeight: e.cursorHeight,
            contentInsertionConfiguration: e.contentInsertionConfiguration,
            contextMenuBuilder: e.contextMenuBuilder,
            clipBehavior: e.clipBehavior,
            clipBehaviorText: e.clipBehaviorText,
            cursorColor: e.cursorColor,
            dragStartBehavior: e.dragStartBehavior,
            digits: e.digits,
            dimensionRatio: e.dimensionRatio,
            drawableEnd: e.drawableEnd,
            drawableEndState: e.drawableEndState,
            drawableEndBuilder: e.drawableEndBuilder,
            drawableEndPadding: e.drawableEndPadding,
            drawableEndPaddingState: e.drawableEndPaddingState,
            drawableEndSize: e.drawableEndSize,
            drawableEndSizeState: e.drawableEndSizeState,
            drawableEndTint: e.drawableEndTint,
            drawableEndTintState: e.drawableEndTintState,
            drawableEndVisible: e.drawableEndVisible,
            drawableStart: e.drawableStart,
            drawableStartState: e.drawableStartState,
            drawableStartBuilder: e.drawableStartBuilder,
            drawableStartPadding: e.drawableStartPadding,
            drawableStartPaddingState: e.drawableStartPaddingState,
            drawableStartSize: e.drawableStartSize,
            drawableStartSizeState: e.drawableStartSizeState,
            drawableStartTint: e.drawableStartTint,
            drawableStartTintState: e.drawableStartTintState,
            drawableStartVisible: e.drawableStartVisible,
            enableIMEPersonalizedLearning: e.enableIMEPersonalizedLearning,
            enableInteractiveSelection: e.enableInteractiveSelection,
            enableSuggestions: e.enableSuggestions,
            expands: e.expands,
            enabled: e.enabled,
            elevation: e.elevation,
            expandable: e.expandable,
            flex: e.flex,
            foreground: e.foreground,
            foregroundBlendMode: e.foregroundBlendMode,
            foregroundGradient: e.foregroundGradient,
            foregroundImage: e.foregroundImage,
            gravity: e.gravity,
            hint: e.hint,
            height: e.height,
            heightMax: e.heightMax,
            heightMin: e.heightMin,
            hintColor: e.hintColor,
            hoverColor: e.hoverColor,
            inputType: e.inputType,
            id: id,
            indicator: e.indicator,
            indicatorSize: e.indicatorSize,
            indicatorStroke: e.indicatorStroke,
            indicatorStrokeColor: e.indicatorStrokeColor,
            indicatorStrokeColorState: e.indicatorStrokeColorState,
            indicatorStrokeBackground: e.indicatorStrokeBackground,
            indicatorStrokeBackgroundState: e.indicatorStrokeBackgroundState,
            indicatorVisible: e.indicatorVisible,
            key: e.key,
            keyboardAppearance: e.keyboardAppearance,
            locale: e.locale,
            lineSpacingExtra: e.lineSpacingExtra,
            letterSpacing: e.letterSpacing,
            maxCharacters: e.maxCharacters,
            marginTop: e.marginTop,
            maxLines: e.maxLines,
            minLines: e.minLines,
            magnifierConfiguration: e.magnifierConfiguration,
            mouseCursor: e.mouseCursor,
            marginEnd: e.marginEnd,
            marginStart: e.marginStart,
            marginBottom: e.marginBottom,
            margin: e.margin,
            marginVertical: e.marginVertical,
            marginHorizontal: e.marginHorizontal,
            minCharacters: e.minCharacters,
            onValid: e.onValid,
            onSubmitted: e.onSubmitted,
            obscuringCharacter: e.obscuringCharacter,
            onAppPrivateCommand: e.onAppPrivateCommand,
            onEditingComplete: e.onEditingComplete,
            onTapOutside: e.onTapOutside,
            onError: e.onError,
            onValidator: e.onValidator,
            obscureText: e.obscureText,
            orientation: e.orientation,
            onChange: e.onChange,
            paddingHorizontal: e.paddingHorizontal,
            paddingVertical: e.paddingVertical,
            paddingStart: e.paddingStart,
            paddingEnd: e.paddingEnd,
            padding: e.padding,
            paddingTop: e.paddingTop,
            paddingBottom: e.paddingBottom,
            pressedColor: e.pressedColor,
            primary: e.primary,
            position: e.position,
            positionType: e.positionType,
            restorationId: e.restorationId,
            readOnly: e.readOnly,
            rippleColor: e.rippleColor,
            strutStyle: e.strutStyle,
            spellCheckConfiguration: e.spellCheckConfiguration,
            smartQuotesType: e.smartQuotesType,
            scrollable: e.scrollable,
            showCursor: e.showCursor,
            scrollController: e.scrollController,
            scribbleEnabled: e.scribbleEnabled,
            selectionWidthStyle: e.selectionWidthStyle,
            selectionHeightStyle: e.selectionHeightStyle,
            selectionControls: e.selectionControls,
            smartDashesType: e.smartDashesType,
            scrollingType: e.scrollingType,
            shape: e.shape,
            shadowColor: e.shadowColor,
            shadow: e.shadow,
            shadowBlurRadius: e.shadowBlurRadius,
            shadowType: e.shadowType,
            shadowBlurStyle: e.shadowBlurStyle,
            scrollControllerText: e.scrollControllerText,
            scrollPaddingText: e.scrollPaddingText,
            scrollPhysicsText: e.scrollPhysicsText,
            selectionColor: e.selectionColor,
            shadowBottom: e.shadowBottom,
            shadowEnd: e.shadowEnd,
            shadowHorizontal: e.shadowHorizontal,
            shadowSpreadRadius: e.shadowSpreadRadius,
            shadowStart: e.shadowStart,
            shadowTop: e.shadowTop,
            shadowVertical: e.shadowVertical,
            textScaleFactor: e.textScaleFactor,
            textWidthBasis: e.textWidthBasis,
            textHeightBehavior: e.textHeightBehavior,
            textInputAction: e.textInputAction,
            textAlign: e.textAlign,
            text: e.text,
            textCapitalization: e.textCapitalization,
            textSize: e.textSize,
            textColor: e.textColor,
            textFontFamily: e.textFontFamily,
            textFontStyle: e.textFontStyle,
            textFontWeight: e.textFontWeight,
            textOverflow: e.textOverflow,
            textStyle: e.textStyle,
            textAllCaps: e.textAllCaps,
            transform: e.transform,
            transformGravity: e.transformGravity,
            undoController: e.undoController,
            visibility: e.visibility,
            width: e.width,
            widthMax: e.widthMax,
            widthMin: e.widthMin,
            wordSpacing: e.wordSpacing,
            onChecked: (tag, value) {
              controller._checks[tag] = value;
              controller._checking;
            },
          );
        }
      }).toList(),
    );
  }
}

class MaterialEditFormController extends ViewController {
  List<EditText> children = [];

  MaterialEditFormController fromMaterialEditGroup(MaterialEditForm view) {
    super.fromView(view);
    children = view.children ?? [];
    return this;
  }

  String _id(EditText view) => view.id ?? view.hashCode.toString();

  final Map<String, bool> _checks = {};

  void get _checking {
    final list = [];
    for (bool check in _checks.values) {
      if (check) {
        list.add(true);
      }
    }
    onValid?.call(list.length == children.length);
  }

  void init() {
    for (var item in children) {
      final tag = _id(item);
      _checks[tag] = item.onValidator?.call(item.text ?? "") ?? false;
    }
  }
}
