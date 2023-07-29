part of '../widgets.dart';

class MaterialEditForm extends YMRView<MaterialEditFormController> {
  final List<MaterialEditText>? children;

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
        return MaterialEditText(
          controller: e.controller ?? MaterialEditTextController(),
          id: id,
          key: e.key,
          autoFocus: e.autoFocus,
          counterVisible: e.counterVisible,
          digits: e.digits,
          drawableStart: e.drawableStart,
          drawableEnd: e.drawableEnd,
          drawablePadding: e.drawablePadding,
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
      }).toList(),
    );
  }
}

class MaterialEditFormController extends ViewController {
  List<MaterialEditText> children = [];

  MaterialEditFormController fromMaterialEditGroup(MaterialEditForm view) {
    super.fromView(view);
    children = view.children ?? [];
    return this;
  }

  String _id(MaterialEditText view) => view.id ?? view.hashCode.toString();

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
