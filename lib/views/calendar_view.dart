part of '../widgets.dart';

class CalendarView<T> extends YMRView<CalendarViewController> {
  final dynamic locale;
  final DateTime focusedDay;
  final DateTime firstDay;
  final DateTime lastDay;
  final DateTime currentDay;

  CalendarView({
    /// SUPER PROPERTIES
    super.key,
    super.activated,
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
    return RawCalendar(
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

class CalendarViewController extends ViewController {
  DateTime _currentDay = DateTime.now();
  DateTime _oldDate = DateTime.now();
  DateTime _firstDay = DateTime.now();
  DateTime _lastDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  DateTime get currentDay => normalizeDate(_currentDay);

  set currentDay(DateTime value) => _currentDay = value;

  DateTime get oldDay => normalizeDate(_oldDate);

  set oldDay(DateTime value) => _oldDate = value;

  DateTime get firstDay => normalizeDate(_firstDay);

  set firstDay(DateTime value) => _firstDay = value;

  DateTime get lastDay => normalizeDate(_lastDay);

  set lastDay(DateTime value) => _lastDay = value;

  DateTime get focusedDay => normalizeDate(_focusedDay);

  set focusedDay(DateTime value) => _focusedDay = value;

  DateTime normalizeDate(DateTime date) {
    return DateTime.utc(date.year, date.month, date.day);
  }

  void setCurrentDate(DateTime date) {
    onNotifyWithCallback(() => currentDay = date);
  }

  void onNotifyWithDate(DateTime current, [DateTime? old]) {
    onNotifyWithCallback(() {
      currentDay = current;
      oldDay = old ?? current;
    });
  }

  CalendarViewController fromCalendarView(CalendarView view) {
    super.fromView(view);
    currentDay = view.currentDay;
    oldDay = view.focusedDay;
    focusedDay = view.focusedDay;
    firstDay = view.firstDay;
    lastDay = view.lastDay;
    return this;
  }
}
