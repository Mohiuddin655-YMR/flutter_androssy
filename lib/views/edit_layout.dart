part of '../widgets.dart';

class EditLayoutController extends LinearLayoutController {
  int initialCheckTime = 500;

  EditLayoutController fromMaterialEditGroup(EditLayout view) {
    super.fromLinearLayout(view);
    initialCheckTime = view.initialCheckTime;
    return this;
  }

  bool _initial = true;

  Iterable _items = const [];

  Set _checks = const {};

  bool get isValid => _validations.length == _items.length;

  Iterable get _validations {
    return _checks.where((i) {
      if (i is EditTextController) {
        return i.isValid;
      } else if (i is EditLayoutController) {
        return i.isValid;
      }
      return false;
    });
  }

  void _config() {
    _items = children.where((e) {
      if (e is EditText) {
        return e.controller is EditTextController &&
            e.controller!.onValidator != null;
      } else if (e is EditLayout) {
        return e.controller is EditLayoutController;
      } else {
        return false;
      }
    });
    _checks = _items.map((e) {
      if (e is EditText) {
        return e.controller!;
      }
      if (e is EditLayout) {
        return e.controller!;
      }
    }).toSet();
    if (_initial && onValid != null) {
      Future.delayed(Duration(milliseconds: initialCheckTime)).whenComplete(() {
        _initial = false;
        return onValid!(isValid);
      });
    }
    for (var i in _items) {
      i.controller?.setOnValidListener((value) {
        _checks.add(i.controller!);
        if (onValid != null) onValid!(isValid);
      });
    }
  }
}

class EditLayout<T extends EditLayoutController> extends LinearLayout<T> {
  final int initialCheckTime;

  const EditLayout({
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
    super.onValid,

    /// LINEAR LAYOUT PROPERTIES
    super.layoutGravity,
    super.mainGravity,
    super.mainAxisSize = MainAxisSize.min,
    super.crossGravity,
    super.textBaseline,
    super.textDirection,
    super.verticalDirection = VerticalDirection.down,
    super.onPaging,
    super.children,

    /// CHILD PROPERTIES
    this.initialCheckTime = 500,
  });

  @override
  void onReady(context, controller) => controller._config();

  @override
  T initController() => EditLayoutController() as T;

  @override
  T attachController(T controller) {
    return controller.fromMaterialEditGroup(this) as T;
  }
}
