part of '../widgets.dart';

class AxisView extends YMRView {
  final double x, y;

  const AxisView({
    super.key,
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
