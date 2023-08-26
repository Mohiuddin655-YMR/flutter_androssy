part of '../core.dart';

class AndrossyScreenConfig {
  final Color? backgroundColor;
  final double? drawerEdgeDragWidth;
  final bool drawerEnableOpenDragGesture;
  final DragStartBehavior drawerDragStartBehavior;
  final Color? drawerScrimColor;
  final bool endDrawerEnableOpenDragGesture;
  final bool extendBody;
  final bool extendBodyBehindAppBar;
  final FloatingActionButtonAnimator? floatingActionButtonAnimator;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final bool primary;
  final AlignmentDirectional persistentFooterAlignment;
  final String? restorationId;
  final bool? resizeToAvoidBottomInset;

  const AndrossyScreenConfig({
    this.backgroundColor,
    this.drawerEdgeDragWidth,
    this.drawerEnableOpenDragGesture = true,
    this.drawerDragStartBehavior = DragStartBehavior.start,
    this.drawerScrimColor,
    this.endDrawerEnableOpenDragGesture = true,
    this.extendBody = false,
    this.extendBodyBehindAppBar = false,
    this.floatingActionButtonAnimator,
    this.floatingActionButtonLocation,
    this.primary = true,
    this.persistentFooterAlignment = AlignmentDirectional.centerEnd,
    this.restorationId,
    this.resizeToAvoidBottomInset,
  });

  AndrossyScreenConfig copyWith({
    Color? backgroundColor,
    double? drawerEdgeDragWidth,
    bool? drawerEnableOpenDragGesture,
    DragStartBehavior? drawerDragStartBehavior,
    Color? drawerScrimColor,
    bool? endDrawerEnableOpenDragGesture,
    bool? extendBody,
    bool? extendBodyBehindAppBar,
    FloatingActionButtonAnimator? floatingActionButtonAnimator,
    FloatingActionButtonLocation? floatingActionButtonLocation,
    bool? primary,
    AlignmentDirectional? persistentFooterAlignment,
    String? restorationId,
    bool? resizeToAvoidBottomInset,
  }) {
    return AndrossyScreenConfig(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      drawerEdgeDragWidth: drawerEdgeDragWidth ?? this.drawerEdgeDragWidth,
      drawerEnableOpenDragGesture:
          drawerEnableOpenDragGesture ?? this.drawerEnableOpenDragGesture,
      drawerDragStartBehavior:
          drawerDragStartBehavior ?? this.drawerDragStartBehavior,
      drawerScrimColor: drawerScrimColor ?? this.drawerScrimColor,
      endDrawerEnableOpenDragGesture:
          endDrawerEnableOpenDragGesture ?? this.endDrawerEnableOpenDragGesture,
      extendBody: extendBody ?? this.extendBody,
      extendBodyBehindAppBar:
          extendBodyBehindAppBar ?? this.extendBodyBehindAppBar,
      floatingActionButtonAnimator:
          floatingActionButtonAnimator ?? this.floatingActionButtonAnimator,
      floatingActionButtonLocation:
          floatingActionButtonLocation ?? this.floatingActionButtonLocation,
      primary: primary ?? this.primary,
      persistentFooterAlignment:
          persistentFooterAlignment ?? this.persistentFooterAlignment,
      restorationId: restorationId ?? this.restorationId,
      resizeToAvoidBottomInset:
          resizeToAvoidBottomInset ?? this.resizeToAvoidBottomInset,
    );
  }
}

class AndrossyAppbarConfig {
  final Key? appbarKey;
  final IconThemeData? actionsIconTheme;
  final bool automaticallyImplyLeading;
  final Color? backgroundColor;
  final double bottomOpacity;
  final Clip? clipBehavior;
  final double? elevation;
  final bool excludeHeaderSemantics;
  final Color? foregroundColor;
  final bool forceMaterialTransparency;
  final IconThemeData? iconTheme;
  final double? leadingWidth;
  final bool primary;
  final double? scrolledUnderElevation;
  final Color? shadowColor;
  final ShapeBorder? shape;
  final Color? surfaceTintColor;
  final SystemUiOverlayStyle? systemOverlayStyle;
  final bool? titleCenter;
  final double? titleSpacing;
  final TextStyle? titleTextStyle;
  final double? toolbarHeight;
  final double toolbarOpacity;
  final TextStyle? toolbarTextStyle;

  const AndrossyAppbarConfig({
    this.appbarKey,
    this.automaticallyImplyLeading = true,
    this.backgroundColor,
    this.bottomOpacity = 1,
    this.clipBehavior,
    this.elevation,
    this.excludeHeaderSemantics = false,
    this.foregroundColor,
    this.forceMaterialTransparency = false,
    this.leadingWidth,
    this.primary = true,
    this.scrolledUnderElevation,
    this.shadowColor,
    this.shape,
    this.surfaceTintColor,
    this.titleCenter,
    this.titleSpacing,
    this.titleTextStyle,
    this.toolbarHeight,
    this.toolbarOpacity = 1,
    this.toolbarTextStyle,
    this.actionsIconTheme,
    this.iconTheme,
    this.systemOverlayStyle,
  });

  AndrossyAppbarConfig copyWith({
    Key? appbarKey,
    IconThemeData? actionsIconTheme,
    bool? automaticallyImplyLeading,
    Color? backgroundColor,
    double? bottomOpacity,
    Clip? clipBehavior,
    double? elevation,
    bool? excludeHeaderSemantics,
    Color? foregroundColor,
    bool? forceMaterialTransparency,
    IconThemeData? iconTheme,
    double? leadingWidth,
    bool? primary,
    double? scrolledUnderElevation,
    Color? shadowColor,
    ShapeBorder? shape,
    Color? surfaceTintColor,
    SystemUiOverlayStyle? systemOverlayStyle,
    bool? titleCenter,
    double? titleSpacing,
    TextStyle? titleTextStyle,
    double? toolbarHeight,
    double? toolbarOpacity,
    TextStyle? toolbarTextStyle,
  }) {
    return AndrossyAppbarConfig(
      appbarKey: appbarKey ?? this.appbarKey,
      actionsIconTheme: actionsIconTheme ?? this.actionsIconTheme,
      automaticallyImplyLeading:
          automaticallyImplyLeading ?? this.automaticallyImplyLeading,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      bottomOpacity: bottomOpacity ?? this.bottomOpacity,
      clipBehavior: clipBehavior ?? this.clipBehavior,
      elevation: elevation ?? this.elevation,
      excludeHeaderSemantics:
          excludeHeaderSemantics ?? this.excludeHeaderSemantics,
      foregroundColor: foregroundColor ?? this.foregroundColor,
      forceMaterialTransparency:
          forceMaterialTransparency ?? this.forceMaterialTransparency,
      iconTheme: iconTheme ?? this.iconTheme,
      leadingWidth: leadingWidth ?? this.leadingWidth,
      primary: primary ?? this.primary,
      scrolledUnderElevation:
          scrolledUnderElevation ?? this.scrolledUnderElevation,
      shadowColor: shadowColor ?? this.shadowColor,
      shape: shape ?? this.shape,
      surfaceTintColor: surfaceTintColor ?? this.surfaceTintColor,
      systemOverlayStyle: systemOverlayStyle ?? this.systemOverlayStyle,
      titleCenter: titleCenter ?? this.titleCenter,
      titleSpacing: titleSpacing ?? this.titleSpacing,
      titleTextStyle: titleTextStyle ?? this.titleTextStyle,
      toolbarHeight: toolbarHeight ?? this.toolbarHeight,
      toolbarOpacity: toolbarOpacity ?? this.toolbarOpacity,
      toolbarTextStyle: toolbarTextStyle ?? this.toolbarTextStyle,
    );
  }
}
