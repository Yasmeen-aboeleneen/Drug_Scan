import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// ignore: depend_on_referenced_packages
import 'package:timezone/data/latest.dart' as tz;
// ignore: depend_on_referenced_packages
import 'package:timezone/timezone.dart' as tz;

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void initializeNotifications() async {
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('ic_launcher');
  const InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
  );
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  // تهيئة المنطقة الزمنية
  tz.initializeTimeZones();
  tz.setLocalLocation(
      tz.getLocation('Africa/Cairo')); 
}

void scheduleFollowUpNotification() async {
  const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
    'follow_up_channel', // ID القناة
    'Follow-up Notifications', // اسم القناة
    importance: Importance.max,
    priority: Priority.high,
  );

  const NotificationDetails platformDetails = NotificationDetails(
    android: androidDetails,
  );

  // استخدام TZDateTime بدلاً من DateTime
  final tz.TZDateTime scheduledDate =
      tz.TZDateTime.now(tz.local).add(const Duration(days: 14));

  await flutterLocalNotificationsPlugin.zonedSchedule(
    0,
    'Follow-Up Reminder',
    'It\'s time for your follow-up drug test.',
    scheduledDate,
    platformDetails,
    uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime,
    androidScheduleMode: AndroidScheduleMode.exact, 
  );
}
