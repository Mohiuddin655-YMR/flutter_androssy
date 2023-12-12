part of 'view.dart';

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
