import 'package:flutter/material.dart';
import 'package:flutter_androssy/extensions/theme.dart';

import '../view/view.dart';
import 'components/customization/calendar_style.dart';
import 'components/customization/header_style.dart';
import 'components/utils/utils.dart';
import 'raw.dart';

part 'controller.dart';

class CalendarView<T> extends YMRView<CalendarViewController> {
  final dynamic locale;
  final DateTime focusedDay;
  final DateTime firstDay;
  final DateTime lastDay;
  final DateTime currentDay;

  CalendarView({
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

    /// BASE PROPERTIES
    required this.focusedDay,
    required this.firstDay,
    required this.lastDay,
    DateTime? currentDay,
    this.locale,
  }) : currentDay = currentDay ?? DateTime.now();

  bool isSameDay(DateTime? a, DateTime? b) {
    if (a == null || b == null) {
      return false;
    }
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  @override
  CalendarViewController initController() => CalendarViewController();

  @override
  CalendarViewController attachController(CalendarViewController controller) {
    return controller.fromCalendarView(this);
  }

  @override
  Widget? attach(BuildContext context, CalendarViewController controller) {
    return RawCalendarView(
      currentDay: controller.currentDay,
      focusedDay: controller.focusedDay,
      firstDay: controller.firstDay,
      lastDay: controller.lastDay,
      headerStyle: const HeaderStyle(
        formatButtonVisible: false,
      ),
      onDaySelected: controller.onNotifyWithDate,
      availableGestures: AvailableGestures.all,
      selectedDayPredicate: (day) => isSameDay(day, controller.currentDay),
      calendarStyle: CalendarStyle(
        selectedDecoration: BoxDecoration(
          color: context.primaryColor,
          shape: BoxShape.circle,
        ),
        todayDecoration: BoxDecoration(
          color: context.primaryColor.withOpacity(0.5),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
