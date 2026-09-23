
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tzdata;
import '../models/task.dart';

class NotificationService {
  static final _plugin = FlutterLocalNotificationsPlugin();
  static Future<void> init() async {
    tzdata.initializeTimeZones();
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const win = DarwinInitializationSettings();
    const init = InitializationSettings(android: android, iOS: win, macOS: win);
    await _plugin.initialize(init);
  }
  static Future<void> scheduleForTask(MaintenanceTask task) async {
    if (task.isArchived) return;
    await _plugin.zonedSchedule(
      task.id.hashCode,
      'Maintenance Due: ${task.title}',
      '${task.category} - Due ${task.nextDue}',
      tz.TZDateTime.from(task.nextDue.subtract(const Duration(hours: 9)), tz.local),
      const NotificationDetails(android: AndroidNotificationDetails('homecare_tasks', 'Maintenance Tasks', importance: Importance.high)),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
    );
  }
}
