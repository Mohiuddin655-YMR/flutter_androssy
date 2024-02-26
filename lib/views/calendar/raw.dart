import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../widgets/simple_gesture_detector.dart';
import 'components/customization/calendar_builders.dart';
import 'components/customization/calendar_style.dart';
import 'components/customization/days_of_week_style.dart';
import 'components/customization/header_style.dart';
import 'components/utils/utils.dart';
import 'components/widgets/calendar_core.dart';
import 'components/widgets/calendar_header.dart';
import 'components/widgets/cell_content.dart';

typedef OnDaySelected = void Function(
  DateTime selectedDay,
  DateTime focusedDay,
);

typedef OnRangeSelected = void Function(
  DateTime? start,
  DateTime? end,
  DateTime focusedDay,
);

enum RangeSelectionMode {
  disabled,
  toggledOff,
  toggledOn,
  enforced,
}

class RawCalendarView<T> extends StatefulWidget {
  final dynamic locale;

  final DateTime? rangeStartDay;

  final DateTime? rangeEndDay;

  final DateTime focusedDay;

  final DateTime firstDay;

  final DateTime lastDay;

  final DateTime? currentDay;

  final List<int> weekendDays;

  final CalendarFormat calendarFormat;

  final Map<CalendarFormat, String> availableCalendarFormats;

  final bool headerVisible;

  final bool daysOfWeekVisible;

  final bool pageJumpingEnabled;

  final bool pageAnimationEnabled;

  final bool sixWeekMonthsEnforced;

  final bool shouldFillViewport;

  final bool weekNumbersVisible;

  final double rowHeight;

  final double daysOfWeekHeight;

  final Duration formatAnimationDuration;

  final Curve formatAnimationCurve;

  final Duration pageAnimationDuration;

  final Curve pageAnimationCurve;

  final StartingDayOfWeek startingDayOfWeek;

  final HitTestBehavior dayHitTestBehavior;

  final AvailableGestures availableGestures;

  final SimpleSwipeConfig simpleSwipeConfig;

  final HeaderStyle headerStyle;

  final DaysOfWeekStyle daysOfWeekStyle;

  final CalendarStyle calendarStyle;

  final CalendarBuilders<T> calendarBuilders;

  final RangeSelectionMode rangeSelectionMode;

  final List<T> Function(DateTime day)? eventLoader;

  final bool Function(DateTime day)? enabledDayPredicate;

  final bool Function(DateTime day)? selectedDayPredicate;

  final bool Function(DateTime day)? holidayPredicate;

  final OnRangeSelected? onRangeSelected;

  final OnDaySelected? onDaySelected;

  final OnDaySelected? onDayLongPressed;

  final void Function(DateTime day)? onDisabledDayTapped;

  final void Function(DateTime day)? onDisabledDayLongPressed;

  final void Function(DateTime focusedDay)? onHeaderTapped;

  final void Function(DateTime focusedDay)? onHeaderLongPressed;

  final void Function(DateTime focusedDay)? onPageChanged;

  final void Function(CalendarFormat format)? onFormatChanged;

  final void Function(PageController pageController)? onCalendarCreated;

  RawCalendarView({
    super.key,
    required DateTime focusedDay,
    required DateTime firstDay,
    required DateTime lastDay,
    DateTime? currentDay,
    this.locale,
    this.rangeStartDay,
    this.rangeEndDay,
    this.weekendDays = const [DateTime.saturday, DateTime.sunday],
    this.calendarFormat = CalendarFormat.month,
    this.availableCalendarFormats = const {
      CalendarFormat.month: 'Month',
      CalendarFormat.twoWeeks: '2 weeks',
      CalendarFormat.week: 'Week',
    },
    this.headerVisible = true,
    this.daysOfWeekVisible = true,
    this.pageJumpingEnabled = false,
    this.pageAnimationEnabled = true,
    this.sixWeekMonthsEnforced = false,
    this.shouldFillViewport = false,
    this.weekNumbersVisible = false,
    this.rowHeight = 52.0,
    this.daysOfWeekHeight = 16.0,
    this.formatAnimationDuration = const Duration(milliseconds: 200),
    this.formatAnimationCurve = Curves.linear,
    this.pageAnimationDuration = const Duration(milliseconds: 300),
    this.pageAnimationCurve = Curves.easeOut,
    this.startingDayOfWeek = StartingDayOfWeek.sunday,
    this.dayHitTestBehavior = HitTestBehavior.opaque,
    this.availableGestures = AvailableGestures.all,
    this.simpleSwipeConfig = const SimpleSwipeConfig(
      verticalThreshold: 25.0,
      swipeDetectionBehavior: SwipeDetectionBehavior.continuousDistinct,
    ),
    this.headerStyle = const HeaderStyle(),
    this.daysOfWeekStyle = const DaysOfWeekStyle(),
    this.calendarStyle = const CalendarStyle(),
    this.calendarBuilders = const CalendarBuilders(),
    this.rangeSelectionMode = RangeSelectionMode.toggledOff,
    this.eventLoader,
    this.enabledDayPredicate,
    this.selectedDayPredicate,
    this.holidayPredicate,
    this.onRangeSelected,
    this.onDaySelected,
    this.onDayLongPressed,
    this.onDisabledDayTapped,
    this.onDisabledDayLongPressed,
    this.onHeaderTapped,
    this.onHeaderLongPressed,
    this.onPageChanged,
    this.onFormatChanged,
    this.onCalendarCreated,
  })  : assert(availableCalendarFormats.keys.contains(calendarFormat)),
        assert(availableCalendarFormats.length <= CalendarFormat.values.length),
        assert(weekendDays.isNotEmpty
            ? weekendDays.every(
                (day) => day >= DateTime.monday && day <= DateTime.sunday)
            : true),
        focusedDay = normalizeDate(focusedDay),
        firstDay = normalizeDate(firstDay),
        lastDay = normalizeDate(lastDay),
        currentDay = currentDay ?? DateTime.now();

  @override
  State<RawCalendarView<T>> createState() => _RawCalendarViewState<T>();
}

class _RawCalendarViewState<T> extends State<RawCalendarView<T>> {
  late final PageController _pageController;
  late final ValueNotifier<DateTime> _focusedDay;
  late RangeSelectionMode _rangeSelectionMode;
  DateTime? _firstSelectedDay;

  @override
  void initState() {
    super.initState();
    _focusedDay = ValueNotifier(widget.focusedDay);
    _rangeSelectionMode = widget.rangeSelectionMode;
  }

  @override
  void didUpdateWidget(RawCalendarView<T> oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (_focusedDay.value != widget.focusedDay) {
      _focusedDay.value = widget.focusedDay;
    }

    if (_rangeSelectionMode != widget.rangeSelectionMode) {
      _rangeSelectionMode = widget.rangeSelectionMode;
    }

    if (widget.rangeStartDay == null && widget.rangeEndDay == null) {
      _firstSelectedDay = null;
    }
  }

  @override
  void dispose() {
    _focusedDay.dispose();
    super.dispose();
  }

  bool get _isRangeSelectionToggleable =>
      _rangeSelectionMode == RangeSelectionMode.toggledOn ||
      _rangeSelectionMode == RangeSelectionMode.toggledOff;

  bool get _isRangeSelectionOn =>
      _rangeSelectionMode == RangeSelectionMode.toggledOn ||
      _rangeSelectionMode == RangeSelectionMode.enforced;

  bool get _shouldBlockOutsideDays =>
      !widget.calendarStyle.outsideDaysVisible &&
      widget.calendarFormat == CalendarFormat.month;

  void _swipeCalendarFormat(SwipeDirection direction) {
    if (widget.onFormatChanged != null) {
      final formats = widget.availableCalendarFormats.keys.toList();

      final isSwipeUp = direction == SwipeDirection.up;
      int id = formats.indexOf(widget.calendarFormat);

      if (isSwipeUp) {
        id = min(formats.length - 1, id + 1);
      } else {
        id = max(0, id - 1);
      }

      widget.onFormatChanged!(formats[id]);
    }
  }

  void _onDayTapped(DateTime day) {
    final isOutside = day.month != _focusedDay.value.month;
    if (isOutside && _shouldBlockOutsideDays) {
      return;
    }

    if (_isDayDisabled(day)) {
      return widget.onDisabledDayTapped?.call(day);
    }

    _updateFocusOnTap(day);

    if (_isRangeSelectionOn && widget.onRangeSelected != null) {
      if (_firstSelectedDay == null) {
        _firstSelectedDay = day;
        widget.onRangeSelected!(_firstSelectedDay, null, _focusedDay.value);
      } else {
        if (day.isAfter(_firstSelectedDay!)) {
          widget.onRangeSelected!(_firstSelectedDay, day, _focusedDay.value);
          _firstSelectedDay = null;
        } else if (day.isBefore(_firstSelectedDay!)) {
          widget.onRangeSelected!(day, _firstSelectedDay, _focusedDay.value);
          _firstSelectedDay = null;
        }
      }
    } else {
      widget.onDaySelected?.call(day, _focusedDay.value);
    }
  }

  void _onDayLongPressed(DateTime day) {
    final isOutside = day.month != _focusedDay.value.month;
    if (isOutside && _shouldBlockOutsideDays) {
      return;
    }

    if (_isDayDisabled(day)) {
      return widget.onDisabledDayLongPressed?.call(day);
    }

    if (widget.onDayLongPressed != null) {
      _updateFocusOnTap(day);
      return widget.onDayLongPressed!(day, _focusedDay.value);
    }

    if (widget.onRangeSelected != null) {
      if (_isRangeSelectionToggleable) {
        _updateFocusOnTap(day);
        _toggleRangeSelection();

        if (_isRangeSelectionOn) {
          _firstSelectedDay = day;
          widget.onRangeSelected!(_firstSelectedDay, null, _focusedDay.value);
        } else {
          _firstSelectedDay = null;
          widget.onDaySelected?.call(day, _focusedDay.value);
        }
      }
    }
  }

  void _updateFocusOnTap(DateTime day) {
    if (widget.pageJumpingEnabled) {
      _focusedDay.value = day;
      return;
    }

    if (widget.calendarFormat == CalendarFormat.month) {
      if (_isBeforeMonth(day, _focusedDay.value)) {
        _focusedDay.value = _firstDayOfMonth(_focusedDay.value);
      } else if (_isAfterMonth(day, _focusedDay.value)) {
        _focusedDay.value = _lastDayOfMonth(_focusedDay.value);
      } else {
        _focusedDay.value = day;
      }
    } else {
      _focusedDay.value = day;
    }
  }

  void _toggleRangeSelection() {
    if (_rangeSelectionMode == RangeSelectionMode.toggledOn) {
      _rangeSelectionMode = RangeSelectionMode.toggledOff;
    } else {
      _rangeSelectionMode = RangeSelectionMode.toggledOn;
    }
  }

  void _onLeftChevronTap() {
    _pageController.previousPage(
      duration: widget.pageAnimationDuration,
      curve: widget.pageAnimationCurve,
    );
  }

  void _onRightChevronTap() {
    _pageController.nextPage(
      duration: widget.pageAnimationDuration,
      curve: widget.pageAnimationCurve,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.headerVisible)
          ValueListenableBuilder<DateTime>(
            valueListenable: _focusedDay,
            builder: (context, value, _) {
              return CalendarHeader(
                headerTitleBuilder: widget.calendarBuilders.headerTitleBuilder,
                focusedMonth: value,
                onLeftChevronTap: _onLeftChevronTap,
                onRightChevronTap: _onRightChevronTap,
                onHeaderTap: () => widget.onHeaderTapped?.call(value),
                onHeaderLongPress: () =>
                    widget.onHeaderLongPressed?.call(value),
                headerStyle: widget.headerStyle,
                availableCalendarFormats: widget.availableCalendarFormats,
                calendarFormat: widget.calendarFormat,
                locale: widget.locale,
                onFormatButtonTap: (format) {
                  assert(
                    widget.onFormatChanged != null,
                    'Using `FormatButton` without providing `onFormatChanged` will have no effect.',
                  );

                  widget.onFormatChanged?.call(format);
                },
              );
            },
          ),
        Flexible(
          flex: widget.shouldFillViewport ? 1 : 0,
          child: RawCalendarBase(
            onCalendarCreated: (pageController) {
              _pageController = pageController;
              widget.onCalendarCreated?.call(pageController);
            },
            focusedDay: _focusedDay.value,
            calendarFormat: widget.calendarFormat,
            availableGestures: widget.availableGestures,
            firstDay: widget.firstDay,
            lastDay: widget.lastDay,
            startingDayOfWeek: widget.startingDayOfWeek,
            dowDecoration: widget.daysOfWeekStyle.decoration,
            rowDecoration: widget.calendarStyle.rowDecoration,
            tableBorder: widget.calendarStyle.tableBorder,
            tablePadding: widget.calendarStyle.tablePadding,
            dowVisible: widget.daysOfWeekVisible,
            dowHeight: widget.daysOfWeekHeight,
            rowHeight: widget.rowHeight,
            formatAnimationDuration: widget.formatAnimationDuration,
            formatAnimationCurve: widget.formatAnimationCurve,
            pageAnimationEnabled: widget.pageAnimationEnabled,
            pageAnimationDuration: widget.pageAnimationDuration,
            pageAnimationCurve: widget.pageAnimationCurve,
            availableCalendarFormats: widget.availableCalendarFormats,
            simpleSwipeConfig: widget.simpleSwipeConfig,
            sixWeekMonthsEnforced: widget.sixWeekMonthsEnforced,
            onVerticalSwipe: _swipeCalendarFormat,
            onPageChanged: (focusedDay) {
              _focusedDay.value = focusedDay;
              widget.onPageChanged?.call(focusedDay);
            },
            weekNumbersVisible: widget.weekNumbersVisible,
            weekNumberBuilder: (BuildContext context, DateTime day) {
              final weekNumber = _calculateWeekNumber(day);
              Widget? cell = widget.calendarBuilders.weekNumberBuilder
                  ?.call(context, weekNumber);

              cell ??= Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Center(
                  child: Text(
                    weekNumber.toString(),
                    style: widget.calendarStyle.weekNumberTextStyle,
                  ),
                ),
              );

              return cell;
            },
            dowBuilder: (BuildContext context, DateTime day) {
              Widget? dowCell =
                  widget.calendarBuilders.dowBuilder?.call(context, day);

              if (dowCell == null) {
                final weekdayString = widget.daysOfWeekStyle.dowTextFormatter
                        ?.call(day, widget.locale) ??
                    DateFormat.E(widget.locale).format(day);

                final isWeekend =
                    _isWeekend(day, weekendDays: widget.weekendDays);

                dowCell = Center(
                  child: ExcludeSemantics(
                    child: Text(
                      weekdayString,
                      style: isWeekend
                          ? widget.daysOfWeekStyle.weekendStyle
                          : widget.daysOfWeekStyle.weekdayStyle,
                    ),
                  ),
                );
              }

              return dowCell;
            },
            dayBuilder: (context, day, focusedMonth) {
              return GestureDetector(
                behavior: widget.dayHitTestBehavior,
                onTap: () => _onDayTapped(day),
                onLongPress: () => _onDayLongPressed(day),
                child: _buildCell(day, focusedMonth),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCell(DateTime day, DateTime focusedDay) {
    final isOutside = day.month != focusedDay.month;

    if (isOutside && _shouldBlockOutsideDays) {
      return Container();
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final shorterSide = constraints.maxHeight > constraints.maxWidth
            ? constraints.maxWidth
            : constraints.maxHeight;

        final children = <Widget>[];

        final isWithinRange = widget.rangeStartDay != null &&
            widget.rangeEndDay != null &&
            _isWithinRange(day, widget.rangeStartDay!, widget.rangeEndDay!);

        final isRangeStart = isSameDay(day, widget.rangeStartDay);
        final isRangeEnd = isSameDay(day, widget.rangeEndDay);

        Widget? rangeHighlight = widget.calendarBuilders.rangeHighlightBuilder
            ?.call(context, day, isWithinRange);

        if (rangeHighlight == null) {
          if (isWithinRange) {
            rangeHighlight = Center(
              child: Container(
                margin: EdgeInsetsDirectional.only(
                  start: isRangeStart ? constraints.maxWidth * 0.5 : 0.0,
                  end: isRangeEnd ? constraints.maxWidth * 0.5 : 0.0,
                ),
                height:
                    (shorterSide - widget.calendarStyle.cellMargin.vertical) *
                        widget.calendarStyle.rangeHighlightScale,
                color: widget.calendarStyle.rangeHighlightColor,
              ),
            );
          }
        }

        if (rangeHighlight != null) {
          children.add(rangeHighlight);
        }

        final isToday = isSameDay(day, widget.currentDay);
        final isDisabled = _isDayDisabled(day);
        final isWeekend = _isWeekend(day, weekendDays: widget.weekendDays);

        Widget content = CellContent(
          key: ValueKey('CellContent-${day.year}-${day.month}-${day.day}'),
          day: day,
          focusedDay: focusedDay,
          calendarStyle: widget.calendarStyle,
          calendarBuilders: widget.calendarBuilders,
          isTodayHighlighted: widget.calendarStyle.isTodayHighlighted,
          isToday: isToday,
          isSelected: widget.selectedDayPredicate?.call(day) ?? false,
          isRangeStart: isRangeStart,
          isRangeEnd: isRangeEnd,
          isWithinRange: isWithinRange,
          isOutside: isOutside,
          isDisabled: isDisabled,
          isWeekend: isWeekend,
          isHoliday: widget.holidayPredicate?.call(day) ?? false,
          locale: widget.locale,
        );

        children.add(content);

        if (!isDisabled) {
          final events = widget.eventLoader?.call(day) ?? [];
          Widget? markerWidget =
              widget.calendarBuilders.markerBuilder?.call(context, day, events);

          if (events.isNotEmpty && markerWidget == null) {
            final center = constraints.maxHeight / 2;

            final markerSize = widget.calendarStyle.markerSize ??
                (shorterSide - widget.calendarStyle.cellMargin.vertical) *
                    widget.calendarStyle.markerSizeScale;

            final markerAutoAlignmentTop = center +
                (shorterSide - widget.calendarStyle.cellMargin.vertical) / 2 -
                (markerSize * widget.calendarStyle.markersAnchor);

            markerWidget = PositionedDirectional(
              top: widget.calendarStyle.markersAutoAligned
                  ? markerAutoAlignmentTop
                  : widget.calendarStyle.markersOffset.top,
              bottom: widget.calendarStyle.markersAutoAligned
                  ? null
                  : widget.calendarStyle.markersOffset.bottom,
              start: widget.calendarStyle.markersAutoAligned
                  ? null
                  : widget.calendarStyle.markersOffset.start,
              end: widget.calendarStyle.markersAutoAligned
                  ? null
                  : widget.calendarStyle.markersOffset.end,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: events
                    .take(widget.calendarStyle.markersMaxCount)
                    .map((event) => _buildSingleMarker(day, event, markerSize))
                    .toList(),
              ),
            );
          }

          if (markerWidget != null) {
            children.add(markerWidget);
          }
        }

        return Stack(
          alignment: widget.calendarStyle.markersAlignment,
          clipBehavior: widget.calendarStyle.canMarkersOverflow
              ? Clip.none
              : Clip.hardEdge,
          children: children,
        );
      },
    );
  }

  Widget _buildSingleMarker(DateTime day, T event, double markerSize) {
    return widget.calendarBuilders.singleMarkerBuilder
            ?.call(context, day, event) ??
        Container(
          width: markerSize,
          height: markerSize,
          margin: widget.calendarStyle.markerMargin,
          decoration: widget.calendarStyle.markerDecoration,
        );
  }

  int _calculateWeekNumber(DateTime date) {
    final middleDay = date.add(const Duration(days: 3));
    final dayOfYear = _dayOfYear(middleDay);

    return 1 + ((dayOfYear - 1) / 7).floor();
  }

  int _dayOfYear(DateTime date) {
    return normalizeDate(date)
            .difference(DateTime.utc(date.year, 1, 1))
            .inDays +
        1;
  }

  bool _isWithinRange(DateTime day, DateTime start, DateTime end) {
    if (isSameDay(day, start) || isSameDay(day, end)) {
      return true;
    }

    if (day.isAfter(start) && day.isBefore(end)) {
      return true;
    }

    return false;
  }

  bool _isDayDisabled(DateTime day) {
    return day.isBefore(widget.firstDay) ||
        day.isAfter(widget.lastDay) ||
        !_isDayAvailable(day);
  }

  bool _isDayAvailable(DateTime day) {
    return widget.enabledDayPredicate == null
        ? true
        : widget.enabledDayPredicate!(day);
  }

  DateTime _firstDayOfMonth(DateTime month) {
    return DateTime.utc(month.year, month.month, 1);
  }

  DateTime _lastDayOfMonth(DateTime month) {
    final date = month.month < 12
        ? DateTime.utc(month.year, month.month + 1, 1)
        : DateTime.utc(month.year + 1, 1, 1);
    return date.subtract(const Duration(days: 1));
  }

  bool _isBeforeMonth(DateTime day, DateTime month) {
    if (day.year == month.year) {
      return day.month < month.month;
    } else {
      return day.isBefore(month);
    }
  }

  bool _isAfterMonth(DateTime day, DateTime month) {
    if (day.year == month.year) {
      return day.month > month.month;
    } else {
      return day.isAfter(month);
    }
  }

  bool _isWeekend(
    DateTime day, {
    List<int> weekendDays = const [DateTime.saturday, DateTime.sunday],
  }) {
    return weekendDays.contains(day.weekday);
  }
}

class RawCalendarBase extends StatefulWidget {
  final DateTime firstDay;
  final DateTime lastDay;
  final DateTime focusedDay;
  final CalendarFormat calendarFormat;
  final DayBuilder? dowBuilder;
  final DayBuilder? weekNumberBuilder;
  final FocusedDayBuilder dayBuilder;
  final double? dowHeight;
  final double rowHeight;
  final bool sixWeekMonthsEnforced;
  final bool dowVisible;
  final bool weekNumbersVisible;
  final Decoration? dowDecoration;
  final Decoration? rowDecoration;
  final TableBorder? tableBorder;
  final EdgeInsets? tablePadding;
  final Duration formatAnimationDuration;
  final Curve formatAnimationCurve;
  final bool pageAnimationEnabled;
  final Duration pageAnimationDuration;
  final Curve pageAnimationCurve;
  final StartingDayOfWeek startingDayOfWeek;
  final AvailableGestures availableGestures;
  final SimpleSwipeConfig simpleSwipeConfig;
  final Map<CalendarFormat, String> availableCalendarFormats;
  final SwipeCallback? onVerticalSwipe;
  final void Function(DateTime focusedDay)? onPageChanged;
  final void Function(PageController pageController)? onCalendarCreated;

  RawCalendarBase({
    super.key,
    required this.firstDay,
    required this.lastDay,
    required this.focusedDay,
    this.calendarFormat = CalendarFormat.month,
    this.dowBuilder,
    required this.dayBuilder,
    this.dowHeight,
    required this.rowHeight,
    this.sixWeekMonthsEnforced = false,
    this.dowVisible = true,
    this.weekNumberBuilder,
    this.weekNumbersVisible = false,
    this.dowDecoration,
    this.rowDecoration,
    this.tableBorder,
    this.tablePadding,
    this.formatAnimationDuration = const Duration(milliseconds: 200),
    this.formatAnimationCurve = Curves.linear,
    this.pageAnimationEnabled = true,
    this.pageAnimationDuration = const Duration(milliseconds: 300),
    this.pageAnimationCurve = Curves.easeOut,
    this.startingDayOfWeek = StartingDayOfWeek.sunday,
    this.availableGestures = AvailableGestures.all,
    this.simpleSwipeConfig = const SimpleSwipeConfig(
      verticalThreshold: 25.0,
      swipeDetectionBehavior: SwipeDetectionBehavior.continuousDistinct,
    ),
    this.availableCalendarFormats = const {
      CalendarFormat.month: 'Month',
      CalendarFormat.twoWeeks: '2 weeks',
      CalendarFormat.week: 'Week',
    },
    this.onVerticalSwipe,
    this.onPageChanged,
    this.onCalendarCreated,
  })  : assert(!dowVisible || (dowHeight != null && dowBuilder != null)),
        assert(isSameDay(focusedDay, firstDay) || focusedDay.isAfter(firstDay)),
        assert(isSameDay(focusedDay, lastDay) || focusedDay.isBefore(lastDay));

  @override
  State<RawCalendarBase> createState() => _RawCalendarBaseState();
}

class _RawCalendarBaseState extends State<RawCalendarBase> {
  late final ValueNotifier<double> _pageHeight;
  late final PageController _pageController;
  late DateTime _focusedDay;
  late int _previousIndex;
  late bool _pageCallbackDisabled;

  @override
  void initState() {
    super.initState();
    _focusedDay = widget.focusedDay;

    final rowCount = _getRowCount(widget.calendarFormat, _focusedDay);
    _pageHeight = ValueNotifier(_getPageHeight(rowCount));

    final initialPage = _calculateFocusedPage(
        widget.calendarFormat, widget.firstDay, _focusedDay);

    _pageController = PageController(initialPage: initialPage);
    widget.onCalendarCreated?.call(_pageController);

    _previousIndex = initialPage;
    _pageCallbackDisabled = false;
  }

  @override
  void didUpdateWidget(RawCalendarBase oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (_focusedDay != widget.focusedDay ||
        widget.calendarFormat != oldWidget.calendarFormat ||
        widget.startingDayOfWeek != oldWidget.startingDayOfWeek) {
      final shouldAnimate = _focusedDay != widget.focusedDay;

      _focusedDay = widget.focusedDay;
      _updatePage(shouldAnimate: shouldAnimate);
    }

    if (widget.rowHeight != oldWidget.rowHeight ||
        widget.dowHeight != oldWidget.dowHeight ||
        widget.dowVisible != oldWidget.dowVisible ||
        widget.sixWeekMonthsEnforced != oldWidget.sixWeekMonthsEnforced) {
      final rowCount = _getRowCount(widget.calendarFormat, _focusedDay);
      _pageHeight.value = _getPageHeight(rowCount);
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    _pageHeight.dispose();
    super.dispose();
  }

  bool get _canScrollHorizontally =>
      widget.availableGestures == AvailableGestures.all ||
      widget.availableGestures == AvailableGestures.horizontalSwipe;

  bool get _canScrollVertically =>
      widget.availableGestures == AvailableGestures.all ||
      widget.availableGestures == AvailableGestures.verticalSwipe;

  void _updatePage({bool shouldAnimate = false}) {
    final currentIndex = _calculateFocusedPage(
        widget.calendarFormat, widget.firstDay, _focusedDay);

    final endIndex = _calculateFocusedPage(
        widget.calendarFormat, widget.firstDay, widget.lastDay);

    if (currentIndex != _previousIndex ||
        currentIndex == 0 ||
        currentIndex == endIndex) {
      _pageCallbackDisabled = true;
    }

    if (shouldAnimate && widget.pageAnimationEnabled) {
      if ((currentIndex - _previousIndex).abs() > 1) {
        final jumpIndex =
            currentIndex > _previousIndex ? currentIndex - 1 : currentIndex + 1;

        _pageController.jumpToPage(jumpIndex);
      }

      _pageController.animateToPage(
        currentIndex,
        duration: widget.pageAnimationDuration,
        curve: widget.pageAnimationCurve,
      );
    } else {
      _pageController.jumpToPage(currentIndex);
    }

    _previousIndex = currentIndex;
    final rowCount = _getRowCount(widget.calendarFormat, _focusedDay);
    _pageHeight.value = _getPageHeight(rowCount);

    _pageCallbackDisabled = false;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SimpleGestureDetector(
          onVerticalSwipe: _canScrollVertically ? widget.onVerticalSwipe : null,
          swipeConfig: widget.simpleSwipeConfig,
          child: ValueListenableBuilder<double>(
            valueListenable: _pageHeight,
            builder: (context, value, child) {
              final height =
                  constraints.hasBoundedHeight ? constraints.maxHeight : value;

              return AnimatedSize(
                duration: widget.formatAnimationDuration,
                curve: widget.formatAnimationCurve,
                alignment: Alignment.topCenter,
                child: SizedBox(
                  height: height,
                  child: child,
                ),
              );
            },
            child: CalendarCore(
              constraints: constraints,
              pageController: _pageController,
              scrollPhysics: _canScrollHorizontally
                  ? const PageScrollPhysics()
                  : const NeverScrollableScrollPhysics(),
              firstDay: widget.firstDay,
              lastDay: widget.lastDay,
              startingDayOfWeek: widget.startingDayOfWeek,
              calendarFormat: widget.calendarFormat,
              previousIndex: _previousIndex,
              focusedDay: _focusedDay,
              sixWeekMonthsEnforced: widget.sixWeekMonthsEnforced,
              dowVisible: widget.dowVisible,
              dowHeight: widget.dowHeight,
              rowHeight: widget.rowHeight,
              weekNumbersVisible: widget.weekNumbersVisible,
              weekNumberBuilder: widget.weekNumberBuilder,
              dowDecoration: widget.dowDecoration,
              rowDecoration: widget.rowDecoration,
              tableBorder: widget.tableBorder,
              tablePadding: widget.tablePadding,
              onPageChanged: (index, focusedMonth) {
                if (!_pageCallbackDisabled) {
                  if (!isSameDay(_focusedDay, focusedMonth)) {
                    _focusedDay = focusedMonth;
                  }

                  if (widget.calendarFormat == CalendarFormat.month &&
                      !widget.sixWeekMonthsEnforced &&
                      !constraints.hasBoundedHeight) {
                    final rowCount = _getRowCount(
                      widget.calendarFormat,
                      focusedMonth,
                    );
                    _pageHeight.value = _getPageHeight(rowCount);
                  }

                  _previousIndex = index;
                  widget.onPageChanged?.call(focusedMonth);
                }

                _pageCallbackDisabled = false;
              },
              dowBuilder: widget.dowBuilder,
              dayBuilder: widget.dayBuilder,
            ),
          ),
        );
      },
    );
  }

  double _getPageHeight(int rowCount) {
    final tablePaddingHeight = widget.tablePadding?.vertical ?? 0.0;
    final dowHeight = widget.dowVisible ? widget.dowHeight! : 0.0;
    return dowHeight + rowCount * widget.rowHeight + tablePaddingHeight;
  }

  int _calculateFocusedPage(
      CalendarFormat format, DateTime startDay, DateTime focusedDay) {
    switch (format) {
      case CalendarFormat.month:
        return _getMonthCount(startDay, focusedDay);
      case CalendarFormat.twoWeeks:
        return _getTwoWeekCount(startDay, focusedDay);
      case CalendarFormat.week:
        return _getWeekCount(startDay, focusedDay);
      default:
        return _getMonthCount(startDay, focusedDay);
    }
  }

  int _getMonthCount(DateTime first, DateTime last) {
    final yearDif = last.year - first.year;
    final monthDif = last.month - first.month;

    return yearDif * 12 + monthDif;
  }

  int _getWeekCount(DateTime first, DateTime last) {
    return last.difference(_firstDayOfWeek(first)).inDays ~/ 7;
  }

  int _getTwoWeekCount(DateTime first, DateTime last) {
    return last.difference(_firstDayOfWeek(first)).inDays ~/ 14;
  }

  int _getRowCount(CalendarFormat format, DateTime focusedDay) {
    if (format == CalendarFormat.twoWeeks) {
      return 2;
    } else if (format == CalendarFormat.week) {
      return 1;
    } else if (widget.sixWeekMonthsEnforced) {
      return 6;
    }

    final first = _firstDayOfMonth(focusedDay);
    final daysBefore = _getDaysBefore(first);
    final firstToDisplay = first.subtract(Duration(days: daysBefore));

    final last = _lastDayOfMonth(focusedDay);
    final daysAfter = _getDaysAfter(last);
    final lastToDisplay = last.add(Duration(days: daysAfter));

    return (lastToDisplay.difference(firstToDisplay).inDays + 1) ~/ 7;
  }

  int _getDaysBefore(DateTime firstDay) {
    return (firstDay.weekday + 7 - getWeekdayNumber(widget.startingDayOfWeek)) %
        7;
  }

  int _getDaysAfter(DateTime lastDay) {
    int invertedStartingWeekday =
        8 - getWeekdayNumber(widget.startingDayOfWeek);

    int daysAfter = 7 - ((lastDay.weekday + invertedStartingWeekday) % 7);
    if (daysAfter == 7) {
      daysAfter = 0;
    }

    return daysAfter;
  }

  DateTime _firstDayOfWeek(DateTime week) {
    final daysBefore = _getDaysBefore(week);
    return week.subtract(Duration(days: daysBefore));
  }

  DateTime _firstDayOfMonth(DateTime month) {
    return DateTime.utc(month.year, month.month, 1);
  }

  DateTime _lastDayOfMonth(DateTime month) {
    final date = month.month < 12
        ? DateTime.utc(month.year, month.month + 1, 1)
        : DateTime.utc(month.year + 1, 1, 1);
    return date.subtract(const Duration(days: 1));
  }
}
