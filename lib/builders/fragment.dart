part of '../widgets.dart';

abstract class Fragment extends Activity {
  const Fragment({
    super.key,
    super.background = Colors.transparent,
    super.drawerDragStartBehavior,
    super.drawerEdgeDragWidth,
    super.drawerEnableOpenDragGesture,
    super.drawerScrimColor,
    super.drawerType = DrawerType.start,
    super.floatingActionButtonAnimator,
    super.floatingActionButtonLocation,
    super.persistentFooterAlignment,
    super.primary,
    super.resizeToAvoidBottomInset,
    super.restorationId,
  });
}
