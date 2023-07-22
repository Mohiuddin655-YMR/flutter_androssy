part of '../widgets.dart';

class ToolbarView extends YMRView<ToolbarViewController> {
  final List<Widget>? actions;
  final Color? elevationColor;
  final IconThemeData? iconTheme;

  ///LEADING
  final Widget? leading;
  final bool? leadingAutoImply;
  final dynamic leadingIcon;
  final Color? leadingIconColor;
  final double? leadingIconSize;
  final double? leadingSize;
  final bool? leadingVisible;
  final OnViewClickListener? onLeadingClick;

  ///STATUS BAR
  final Color? statusBarColor;
  final Brightness? statusBarBrightness;
  final Brightness? statusBarIconBrightness;

  ///TITLE
  final String? title;
  final bool? titleCenter;
  final Color? titleColor;
  final Widget? titleCustom;
  final double? titleSize;
  final double? titleSpacing;
  final TextStyle? titleStyle;

  const ToolbarView({
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
    super.enabled,
    super.elevation,
    super.expandable,
    super.foreground,
    super.foregroundBlendMode,
    super.foregroundGradient,
    super.foregroundImage,
    super.flex,
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
    this.actions,
    this.elevationColor,
    this.iconTheme,

    ///LEADING
    this.leading,
    this.leadingAutoImply,
    this.leadingIcon,
    this.leadingIconColor,
    this.leadingIconSize,
    this.leadingSize,
    this.leadingVisible,
    this.onLeadingClick,

    ///STATUS BAR
    this.statusBarColor,
    this.statusBarBrightness,
    this.statusBarIconBrightness,

    ///TITLE
    this.title,
    this.titleCenter,
    this.titleColor,
    this.titleCustom,
    this.titleSize,
    this.titleSpacing,
    this.titleStyle,
  });

  @override
  void onInit(ToolbarViewController controller) => controller.changeStatusBar();

  @override
  void onUpdateWidget(ToolbarViewController controller, oldWidget) =>
      controller.changeStatusBar();

  @override
  ToolbarViewController initController() => ToolbarViewController();

  @override
  ToolbarViewController attachController(ToolbarViewController controller) {
    return controller.fromToolbarView(this);
  }

  @override
  Widget root(
    BuildContext context,
    ToolbarViewController controller,
    Widget parent,
  ) {
    if (controller.isElevated) {
      return Column(
        children: [
          parent,
          Container(
            width: double.infinity,
            height: controller.elevation,
            color: controller.elevationColor,
          )
        ],
      );
    } else {
      return parent;
    }
  }

  @override
  Widget? attach(BuildContext context, ToolbarViewController controller) {
    return AppBar(
      actions: controller.actions,
      actionsIconTheme: controller.iconTheme,
      automaticallyImplyLeading: controller.leadingAutoImply,
      backgroundColor: Colors.transparent,
      centerTitle: controller.titleCenter,
      elevation: 0,
      iconTheme: controller.iconTheme,
      leading: controller.leading == null
          ? null
          : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  width: controller.leadingSize,
                  child: controller.leading,
                ),
              ],
            ),
      leadingWidth: controller.leadingSize,
      title: controller.titleCustom != null
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [controller.titleCustom!],
            )
          : RawTextView(
              text: controller.title,
              textSize: controller.titleSize,
              textColor: controller.titleColor,
              textFontWeight: FontWeight.w500,
            ),
      titleSpacing: controller.titleSpacing,
      titleTextStyle: controller.titleStyle,
    );
  }
}

class ToolbarViewController extends ViewController {
  List<Widget>? actions;
  Color? elevationColor;
  IconThemeData? iconTheme;

  bool get isElevated => elevation > 0 && elevationColor != null;

  ///LEADING
  Widget? leading;
  bool leadingAutoImply = true;
  dynamic leadingIcon = Icons.arrow_back;
  Color leadingIconColor = Colors.black;
  double leadingIconSize = 24;
  double? leadingSize;
  bool leadingVisible = true;
  OnViewClickListener? onLeadingClick;

  ///STATUS BAR
  Color? _statusBarColor;
  Brightness statusBarBrightness = Brightness.dark;
  Brightness? _statusBarIconBrightness;

  Color? get statusBarColor => _statusBarColor ?? background;

  set statusBarColor(Color? value) => _statusBarColor = value;

  Brightness get statusBarIconBrightness =>
      _statusBarIconBrightness ?? statusBarBrightness;

  set statusBarIconBrightness(Brightness? value) =>
      _statusBarIconBrightness = value;

  SystemUiOverlayStyle get statusBarStyle {
    return SystemUiOverlayStyle(
      statusBarBrightness: statusBarBrightness,
      statusBarIconBrightness: statusBarIconBrightness,
      statusBarColor: statusBarColor,
    );
  }

  void changeStatusBarColor(Color? color) {
    changeStatusBar(statusBarStyle.copyWith(statusBarColor: color));
  }

  void changeStatusBarBrightness(Brightness? brightness) {
    changeStatusBar(statusBarStyle.copyWith(
      statusBarBrightness: brightness,
    ));
  }

  void changeStatusBarIconBrightness(Brightness? brightness) {
    changeStatusBar(statusBarStyle.copyWith(
      statusBarIconBrightness: brightness,
    ));
  }

  void changeStatusBar([SystemUiOverlayStyle? style]) =>
      SystemChrome.setSystemUIOverlayStyle(style ?? statusBarStyle);

  ///TITLE
  String? title;
  bool? titleCenter;
  Color titleColor = Colors.black;
  Widget? titleCustom;
  double titleSize = 16;
  double? titleSpacing;
  TextStyle? titleStyle;

  ToolbarViewController fromToolbarView(ToolbarView view) {
    super.fromView(view);
    actions = view.actions;
    elevationColor = view.elevationColor;
    iconTheme = view.iconTheme;

    ///LEADING
    leading = view.leading;
    leadingAutoImply = view.leadingAutoImply ?? true;
    leadingIcon = view.leadingIcon;
    leadingIconColor = view.leadingIconColor ?? Colors.black;
    leadingIconSize = view.leadingIconSize ?? 24;
    leadingSize = view.leadingSize;
    leadingVisible = view.leadingVisible ?? true;
    onLeadingClick = view.onLeadingClick;

    ///STATUS BAR
    statusBarColor = view.statusBarColor;
    statusBarBrightness = view.statusBarBrightness ?? Brightness.dark;
    statusBarIconBrightness = view.statusBarIconBrightness;

    ///TITLE
    title = view.title;
    titleCenter = view.titleCenter;
    titleColor = view.titleColor ?? Colors.black;
    titleCustom = view.titleCustom;
    titleSize = view.titleSize ?? 16;
    titleSpacing = view.titleSpacing;
    titleStyle = view.titleStyle;

    return this;
  }
}
