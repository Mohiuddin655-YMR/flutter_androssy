part of '../widgets.dart';

typedef DropdownDrawableBuilder = Widget Function(BuildContext context);
typedef DropdownItemSelectedListener<T extends Object> = void Function(T? item);

class DropdownView<T extends Object>
    extends TextView<DropdownViewController<T>> {
  final int selectedIndex;
  final List<DropdownItem<T>> items;

  /// DRAWABLE PROPERTIES
  final dynamic leadingIcon;
  final ValueState<dynamic>? leadingIconState;
  final DropdownDrawableBuilder? leadingIconBuilder;
  final double? leadingIconSize;
  final ValueState<double>? leadingIconSizeState;
  final Color? leadingIconTint;
  final ValueState<Color>? leadingIconTintState;
  final bool leadingIconVisible;

  final dynamic trailingIcon;
  final ValueState<dynamic>? trailingIconState;
  final DropdownDrawableBuilder? trailingIconBuilder;
  final double? trailingIconSize;
  final ValueState<double>? trailingIconSizeState;
  final Color? trailingIconTint;
  final ValueState<Color>? trailingIconTintState;
  final bool trailingIconVisible;

  final dynamic trailingSelectedIcon;
  final ValueState<dynamic>? trailingSelectedIconState;
  final DropdownDrawableBuilder? trailingSelectedIconBuilder;
  final double? trailingSelectedIconSize;
  final ValueState<double>? trailingSelectedIconSizeState;
  final Color? trailingSelectedIconTint;
  final ValueState<Color>? trailingSelectedIconTintState;
  final bool trailingSelectedIconVisible;

  /// LISTENERS
  final DropdownItemSelectedListener<T>? onItemSelected;

  const DropdownView({
    /// BASE PROPERTIES
    super.key,
    super.controller,

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

    ///
    ///
    ///
    ///
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
    super.padding,
    super.paddingHorizontal,
    super.paddingVertical,
    super.paddingTop,
    super.paddingBottom,
    super.paddingStart,
    super.paddingEnd,
    super.position,
    super.positionType,
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

    /// TEXT SUPER PROPERTIES
    super.textStyle,
    this.selectedIndex = 0,
    required this.items,

    /// DRAWABLE PROPERTIES
    this.leadingIcon,
    this.leadingIconState,
    this.leadingIconBuilder,
    this.leadingIconSize,
    this.leadingIconSizeState,
    this.leadingIconTint,
    this.leadingIconTintState,
    this.leadingIconVisible = true,
    this.trailingIcon,
    this.trailingIconState,
    this.trailingIconBuilder,
    this.trailingIconSize,
    this.trailingIconSizeState,
    this.trailingIconTint,
    this.trailingIconTintState,
    this.trailingIconVisible = true,
    this.trailingSelectedIcon,
    this.trailingSelectedIconState,
    this.trailingSelectedIconBuilder,
    this.trailingSelectedIconSize,
    this.trailingSelectedIconSizeState,
    this.trailingSelectedIconTint,
    this.trailingSelectedIconTintState,
    this.trailingSelectedIconVisible = true,

    /// LISTENERS
    this.onItemSelected,
  }) : super(text: "");

  @override
  DropdownViewController<T> initController() => DropdownViewController();

  @override
  DropdownViewController<T> attachController(
    DropdownViewController<T> controller,
  ) {
    return controller.fromDropdownView(this);
  }

  @override
  Widget? attach(BuildContext context, DropdownViewController<T> controller) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return DropdownMenu<T>(
          width: constraints.maxWidth,
          initialSelection: controller.selectedItem,
          textStyle: controller.textStyle,
          leadingIcon: controller.leadingIconVisible
              ? Builder(
                  builder: (context) {
                    if (leadingIconBuilder != null) {
                      return leadingIconBuilder!(context);
                    } else {
                      return RawIconView(
                        icon: controller.leadingIcon,
                        tint: controller.leadingIconTint,
                        size: controller.leadingIconSize ?? 18,
                      );
                    }
                  },
                )
              : null,
          trailingIcon: controller.trailingIconVisible
              ? Builder(
                  builder: (context) {
                    if (trailingIconBuilder != null) {
                      return trailingIconBuilder!(context);
                    } else {
                      return RawIconView(
                        icon: controller.trailingIcon ??
                            Icons.keyboard_arrow_down,
                        tint: controller.trailingIconTint,
                        size: controller.trailingIconSize ?? 18,
                      );
                    }
                  },
                )
              : const SizedBox(),
          selectedTrailingIcon: controller.trailingSelectedIconVisible
              ? Builder(
                  builder: (context) {
                    if (trailingSelectedIconBuilder != null) {
                      return trailingSelectedIconBuilder!(context);
                    } else {
                      return RawIconView(
                        icon: controller.trailingSelectedIcon ??
                            Icons.keyboard_arrow_up,
                        tint: controller.trailingSelectedIconTint,
                        size: controller.trailingSelectedIconSize ?? 18,
                      );
                    }
                  },
                )
              : const SizedBox(),
          inputDecorationTheme: InputDecorationTheme(
            isDense: true,
            border: InputBorder.none,
            constraints: BoxConstraints(
              minWidth: constraints.minWidth,
              minHeight: constraints.minHeight,
              maxWidth: constraints.maxWidth,
              maxHeight: constraints.maxHeight,
            ),
            contentPadding: EdgeInsets.zero,
          ),
          menuStyle: MenuStyle(
            padding: MaterialStateProperty.all(EdgeInsets.zero),
          ),
          dropdownMenuEntries: items.map((e) {
            return DropdownMenuEntry<T>(
              value: e.value,
              label: e.name,
            );
          }).toList(),
          onSelected: onItemSelected,
        );
      },
    );
  }
}

class DropdownViewController<T extends Object> extends TextViewController {
  int _selectedIndex = 0;
  List<DropdownItem<T>> items = const [];

  set selectedIndex(int value) => _selectedIndex = value;

  int get selectedIndex => items.length > _selectedIndex ? _selectedIndex : 0;

  T? get selectedItem => items.isNotEmpty ? items[selectedIndex].value : null;

  DropdownViewController<T> fromDropdownView(DropdownView<T> view) {
    super.fromTextView(view);
    selectedIndex = view.selectedIndex;
    items = view.items;

    /// DRAWABLE PROPERTIES
    leadingIcon = view.leadingIcon;
    leadingIconState = view.leadingIconState;
    leadingIconSize = view.leadingIconSize;
    leadingIconSizeState = view.leadingIconSizeState;
    leadingIconTint = view.leadingIconTint;
    leadingIconTintState = view.leadingIconTintState;
    leadingIconVisible = view.leadingIconVisible;

    trailingIcon = view.trailingIcon;
    trailingIconState = view.trailingIconState;
    trailingIconSize = view.trailingIconSize;
    trailingIconSizeState = view.trailingIconSizeState;
    trailingIconTint = view.trailingIconTint;
    trailingIconTintState = view.trailingIconTintState;
    trailingIconVisible = view.trailingIconVisible;

    trailingSelectedIcon = view.trailingSelectedIcon;
    trailingSelectedIconState = view.trailingSelectedIconState;
    trailingSelectedIconSize = view.trailingSelectedIconSize;
    trailingSelectedIconSizeState = view.trailingSelectedIconSizeState;
    trailingSelectedIconTint = view.trailingSelectedIconTint;
    trailingSelectedIconTintState = view.trailingSelectedIconTintState;
    trailingSelectedIconVisible = view.trailingSelectedIconVisible;

    return this;
  }

  /// DRAWABLE PROPERTIES
  dynamic _leadingIcon;
  ValueState<dynamic>? leadingIconState;
  double? _leadingIconSize;
  ValueState<double>? leadingIconSizeState;
  Color? _leadingIconTint;
  ValueState<Color>? leadingIconTintState;
  bool leadingIconVisible = true;

  dynamic _trailingIcon;
  ValueState<dynamic>? trailingIconState;
  double? _trailingIconSize;
  ValueState<double>? trailingIconSizeState;
  Color? _trailingIconTint;
  ValueState<Color>? trailingIconTintState;
  bool trailingIconVisible = true;

  dynamic _trailingSelectedIcon;
  ValueState<dynamic>? trailingSelectedIconState;
  double? _trailingSelectedIconSize;
  ValueState<double>? trailingSelectedIconSizeState;
  Color? _trailingSelectedIconTint;
  ValueState<Color>? trailingSelectedIconTintState;
  bool trailingSelectedIconVisible = true;

  set leadingIcon(dynamic value) => _leadingIcon = value;

  set leadingIconSize(double? value) => _leadingIconSize = value;

  set leadingIconTint(Color? value) => _leadingIconTint = value;

  set trailingIcon(dynamic value) => _trailingIcon = value;

  set trailingIconSize(double? value) => _trailingIconSize = value;

  set trailingIconTint(Color? value) => _trailingIconTint = value;

  set trailingSelectedIcon(dynamic value) => _trailingSelectedIcon = value;

  set trailingSelectedIconSize(double? value) =>
      _trailingSelectedIconSize = value;

  set trailingSelectedIconTint(Color? value) =>
      _trailingSelectedIconTint = value;

  dynamic get leadingIcon {
    var value = leadingIconState?.fromController(this);
    return value ?? _leadingIcon;
  }

  double? get leadingIconSize {
    var value = leadingIconSizeState?.fromController(this);
    return value ?? _leadingIconSize;
  }

  Color? get leadingIconTint {
    var value = leadingIconTintState?.fromController(this);
    return value ?? _leadingIconTint;
  }

  dynamic get trailingIcon {
    var value = trailingIconState?.fromController(this);
    return value ?? _trailingIcon;
  }

  double? get trailingIconSize {
    var value = trailingIconSizeState?.fromController(this);
    return value ?? _trailingIconSize;
  }

  Color? get trailingIconTint {
    var value = trailingIconTintState?.fromController(this);
    return value ?? _trailingIconTint;
  }

  dynamic get trailingSelectedIcon {
    var value = trailingSelectedIconState?.fromController(this);
    return value ?? _trailingSelectedIcon;
  }

  double? get trailingSelectedIconSize {
    var value = trailingSelectedIconSizeState?.fromController(this);
    return value ?? _trailingSelectedIconSize;
  }

  Color? get trailingSelectedIconTint {
    var value = trailingSelectedIconTintState?.fromController(this);
    return value ?? _trailingSelectedIconTint;
  }

  void setLeadingIcon(dynamic icon) {
    onNotifyWithCallback(() => leadingIcon = icon);
  }

  void setLeadingIconState(ValueState<dynamic> iconState) {
    onNotifyWithCallback(() => leadingIconState = iconState);
  }

  void setLeadingIconSize(double? size) {
    onNotifyWithCallback(() => leadingIconSize = size);
  }

  void setLeadingIconSizeState(ValueState<double>? sizeState) {
    onNotifyWithCallback(() => leadingIconSizeState = sizeState);
  }

  void setLeadingIconTint(Color? tint) {
    onNotifyWithCallback(() => leadingIconTint = tint);
  }

  void setLeadingIconTintState(ValueState<Color>? tintState) {
    onNotifyWithCallback(() => leadingIconTintState = tintState);
  }

  void setTrailingIcon(dynamic icon) {
    onNotifyWithCallback(() => trailingIcon = icon);
  }

  void setTrailingIconState(ValueState<dynamic> iconState) {
    onNotifyWithCallback(() => trailingIconState = iconState);
  }

  void setTrailingIconSize(double? size) {
    onNotifyWithCallback(() => trailingIconSize = size);
  }

  void setTrailingIconSizeState(ValueState<double>? sizeState) {
    onNotifyWithCallback(() => trailingIconSizeState = sizeState);
  }

  void setTrailingIconTint(Color? tint) {
    onNotifyWithCallback(() => trailingIconTint = tint);
  }

  void setTrailingIconTintState(ValueState<Color>? tintState) {
    onNotifyWithCallback(() => trailingIconTintState = tintState);
  }

  void setTrailingSelectedIcon(dynamic icon) {
    onNotifyWithCallback(() => trailingSelectedIcon = icon);
  }

  void setTrailingSelectedIconState(ValueState<dynamic> iconState) {
    onNotifyWithCallback(() => trailingSelectedIconState = iconState);
  }

  void setTrailingSelectedIconSize(double? size) {
    onNotifyWithCallback(() => trailingSelectedIconSize = size);
  }

  void setTrailingSelectedIconSizeState(ValueState<double>? sizeState) {
    onNotifyWithCallback(() => trailingSelectedIconSizeState = sizeState);
  }

  void setTrailingSelectedIconTint(Color? tint) {
    onNotifyWithCallback(() => trailingSelectedIconTint = tint);
  }

  void setTrailingSelectedIconTintState(ValueState<Color>? tintState) {
    onNotifyWithCallback(() => trailingSelectedIconTintState = tintState);
  }
}

class DropdownItem<T> {
  final T value;
  final String name;
  final dynamic leadingIcon;
  final dynamic trailingIcon;

  const DropdownItem({
    required this.value,
    required this.name,
    this.leadingIcon,
    this.trailingIcon,
  });
}
