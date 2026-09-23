
import '../models/task.dart';
class RecurrenceEngine {
  static DateTime calculateNextDue(MaintenanceTask task, DateTime from) {
    switch (task.recurrence) {
      case RecurrenceType.monthly:
        return DateTime(from.year, from.month + task.interval, from.day);
      case RecurrenceType.yearly:
        return DateTime(from.year + task.interval, from.month, from.day);
      case RecurrenceType.customDays:
        return from.add(Duration(days: task.interval));
      case RecurrenceType.seasonal:
        return from.add(const Duration(days: 90));
      case RecurrenceType.oneTime:
        return from;
    }
  }
  static List<DateTime> generateUpcoming(MaintenanceTask task, int count) {
    final dates = <DateTime>[]; var cursor = task.nextDue;
    for (var i=0; i<count; i++) { dates.add(cursor); cursor = calculateNextDue(task, cursor); }
    return dates;
  }
}
