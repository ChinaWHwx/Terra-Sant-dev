import 'dart:collection';

import 'package:table_calendar/table_calendar.dart';

/// Example event class.
class Event {
  final String title;

  const Event(this.title);

  @override
  String toString() => title;
}

/// Example events.
///
/// Using a [LinkedHashMap] is highly recommended if you decide to use a map.
final kEvents = LinkedHashMap<DateTime, List<Event>>(
  equals: isSameDay,
  hashCode: getHashCode,
)..addAll(eventSource);

final _kEventSource = {
  for (var item in List.generate(50, (index) => index))
    DateTime.utc(kFirstDay.year, kFirstDay.month, item * 5):
        List.generate(item % 4 + 1, (index) => Event(' $item | ${index + 1}'))
}..addAll({
    kToday: [
      const Event('Today\'s Event 1'),
      const Event('Today\'s Event 2'),
    ],
  });

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

/// Returns a list of [DateTime] objects from [first] to [last], inclusive.
List<DateTime> daysInRange(DateTime first, DateTime last) {
  final dayCount = last.difference(first).inDays + 1;
  return List.generate(
    dayCount,
    (index) => DateTime.utc(first.year, first.month, first.day + index),
  );
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);

Map<DateTime, List<Event>> eventSource = {
  DateTime.utc(kToday.year, kToday.month, kToday.day - 10): listEvents1,
  DateTime.utc(kToday.year, kToday.month, kToday.day): listEvents2
};
List<Event> listEvents1 = [
  const Event("20/07/2022 : 8h00 - 17h00"),
];

List<Event> listEvents2 = [
  const Event("22/07/2022 : 8h00 - 17h00"),
  const Event("22/07/2022 : 8h00 - 17h00"),
  const Event("22/07/2022 : 8h00 - 17h00"),
  const Event("22/07/2022 : 8h00 - 12h00"),
];
