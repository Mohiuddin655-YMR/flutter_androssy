part of '../widgets.dart';

class GraphView extends YMRView {
  final GraphMode mode;
  final bool toggle;
  final bool showGraph;
  final bool behindMode;
  final bool percentageMode;
  final bool showXLines;
  final bool showYLines;
  final double value;

  final int? lineX;
  final int? lineY;
  final double lineSize;
  final Color? lineColor;
  final Color? innerLineColor;

  const GraphView({
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
    super.child,
    this.mode = GraphMode.center,
    this.toggle = true,
    this.showGraph = true,
    this.behindMode = true,
    this.showXLines = true,
    this.showYLines = true,
    this.lineSize = 1,
    this.lineColor = Colors.black26,
    this.innerLineColor = Colors.black12,
    this.lineX,
    this.lineY,
    double pixel = 8,
  })  : percentageMode = false,
        value = pixel,
        super(activated: showGraph);

  const GraphView.scale({
    super.key,
    super.width,
    super.height,
    super.child,
    this.toggle = true,
    this.showGraph = true,
    this.behindMode = true,
    this.showXLines = true,
    this.showYLines = true,
    this.lineSize = 1,
    this.lineColor = Colors.black26,
    this.innerLineColor = Colors.black12,
    this.lineX,
    this.lineY,
  })  : mode = GraphMode._percentage,
        percentageMode = true,
        value = 0,
        super(activated: showGraph);

  @override
  Widget build(BuildContext context, ViewController controller, Widget parent) {
    if (toggle) {
      return GestureDetector(
        onTap: () => controller.onNotifyToggle(),
        child: parent,
      );
    } else {
      return parent;
    }
  }

  @override
  Widget? attach(BuildContext context, ViewController controller) {
    Widget? graph = child;
    if (controller.activated) {
      graph = CustomPaint(
        painter: _GraphPainter(
          mode: mode,
          percentageMode: percentageMode,
          showXLines: showXLines,
          showYLines: showYLines,
          value: value,
          linesX: lineX,
          linesY: lineY,
          lineSize: lineSize,
          lineColor: lineColor,
          innerLineColor: innerLineColor,
        ),
        child: behindMode ? child : null,
      );
      if (!behindMode && child != null) {
        graph = Stack(
          alignment: Alignment.center,
          children: [
            child!,
            Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: graph,
            ),
          ],
        );
      }
    }
    return graph;
  }
}

class _GraphPainter extends CustomPainter {
  final GraphMode mode;
  final bool percentageMode;
  final bool showXLines;
  final bool showYLines;
  final double value;

  final int? linesX;
  final int? linesY;
  final double lineSize;
  final Color? lineColor;
  final Color? innerLineColor;

  const _GraphPainter({
    this.mode = GraphMode.center,
    this.percentageMode = false,
    this.showXLines = true,
    this.showYLines = true,
    this.value = 8,
    this.linesX,
    this.linesY,
    this.lineSize = 1,
    this.lineColor,
    this.innerLineColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    drawXLine(canvas, size, mode.x);
    drawYLine(canvas, size, mode.y);
  }

  void drawXLine(Canvas canvas, Size size, DrawXType type) {
    if (showXLines) {
      if (type != DrawXType.percentage) {
        if (type == DrawXType.top || type == DrawXType.bottom) {
          int xL = linesX ?? (size.height / value).ceil();
          for (int i = 0; i < xL; i++) {
            double x = i * value;
            double a = type == DrawXType.bottom ? size.height - x : x;
            canvas.drawLine(
              Offset(0, a),
              Offset(size.width, a),
              linePainter(i),
            );
          }
        } else {
          double centerY = size.height / 2;
          int xL = linesX ?? (centerY / value).ceil() - 1;
          for (int i = -xL; i <= xL; i++) {
            double x = centerY + i * value;
            canvas.drawLine(
              Offset(0, x),
              Offset(size.width, x),
              linePainter(i),
            );
          }
        }
      } else {
        int xL = linesX ?? 10;
        for (int i = 1; i <= xL - 1; i++) {
          double y = i * (size.height / xL);
          canvas.drawLine(
            Offset(0, y),
            Offset(size.width, y),
            linePainter(i),
          );
        }
      }
    }
  }

  void drawYLine(Canvas canvas, Size size, DrawYType type) {
    if (showYLines) {
      if (type != DrawYType.percentage) {
        if (type == DrawYType.start || type == DrawYType.end) {
          int yL = linesY ?? (size.width / value).ceil();
          for (int i = 0; i < yL; i++) {
            double x = i * value;
            double a = type == DrawYType.end ? size.width - x : x;
            canvas.drawLine(
              Offset(a, 0),
              Offset(a, size.height),
              linePainter(i),
            );
          }
        } else {
          double centerX = size.width / 2;
          int yL = linesY ?? (centerX / value).ceil() - 1;
          for (int i = -yL; i <= yL; i++) {
            double x = centerX + i * value;
            canvas.drawLine(
              Offset(x, 0),
              Offset(x, size.height),
              linePainter(i),
            );
          }
        }
      } else {
        int yL = linesY ?? 10;
        for (int i = 1; i <= yL - 1; i++) {
          double x = i * (size.width / yL);
          canvas.drawLine(
            Offset(x, 0),
            Offset(x, size.height),
            linePainter(i),
          );
        }
      }
    }
  }

  Paint linePainter(int i) {
    Color p = lineColor ?? Colors.grey;
    Color s = innerLineColor ?? p;
    bool i5 = i % 5 == 0;
    bool i10 = i % 10 == 0;
    bool i20 = i % 20 == 0;
    return Paint()
      ..color = i20 || i10 || i5 ? p : s
      ..style = PaintingStyle.stroke
      ..strokeWidth = i20
          ? lineSize
          : i10
              ? lineSize / 2
              : lineSize / 4;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

enum GraphMode {
  _percentage._(
    DrawXType.percentage,
    DrawYType.percentage,
  ),
  center._(
    DrawXType.center,
    DrawYType.center,
  ),
  centerTop._(
    DrawXType.top,
    DrawYType.center,
  ),
  centerBottom._(
    DrawXType.bottom,
    DrawYType.center,
  ),
  centerStart._(
    DrawXType.center,
    DrawYType.start,
  ),
  centerEnd._(
    DrawXType.center,
    DrawYType.end,
  ),
  topStart._(
    DrawXType.top,
    DrawYType.start,
  ),
  topEnd._(
    DrawXType.top,
    DrawYType.end,
  ),
  bottomStart._(
    DrawXType.bottom,
    DrawYType.start,
  ),
  bottomEnd._(
    DrawXType.bottom,
    DrawYType.end,
  );

  final DrawXType x;
  final DrawYType y;

  const GraphMode._(this.x, this.y);
}

enum DrawXType {
  percentage,
  top,
  bottom,
  center,
}

enum DrawYType {
  percentage,
  start,
  end,
  center,
}
