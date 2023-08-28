part of '../widgets.dart';

class AxisView extends YMRView {
  final double x, y;

  const AxisView({
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
    super.width,
    super.height,
    this.x = 0,
    this.y = 0,
    required super.child,
  });

  @override
  Widget? attach(
    BuildContext context,
    ViewController controller,
  ) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isPositiveX = x > 0;
        bool isPositiveY = y > 0;
        double mX = constraints.maxWidth * (x / 50);
        double mY = constraints.maxHeight * (y / 50);
        return Padding(
          padding: EdgeInsets.only(
            left: isPositiveX ? mX : 0,
            right: !isPositiveX ? mX * -1 : 0,
            top: !isPositiveY ? mY * -1 : 0,
            bottom: isPositiveY ? mY : 0,
          ),
          child: child,
        );
      },
    );
  }
}
