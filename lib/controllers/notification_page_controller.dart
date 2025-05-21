import 'package:get/get.dart';
import 'package:realix_real_estate_app/model/notification_model.dart';
import 'package:intl/intl.dart';

class NotificationPageController extends GetxController {
  var notifications = <NotificationModel>[
    NotificationModel(
      title: 'There are good deals',
      message: 'Lots of great deals around New York that you should check out',
      date: DateTime.now(),
      iconPath: 'assets/images/svg/notif1.svg',
    ),
    NotificationModel(
      title: 'The house is being discounted',
      message: 'Lots of great deals around New York that you should check out',
      date: DateTime.now(),
      iconPath: 'assets/images/svg/notif2.svg',
    ),
    NotificationModel(
      title: 'The house is being discounted',
      message: 'Lots of great deals around New York that you should check out',
      date: DateTime.now().subtract(Duration(days: 1)),
      iconPath: 'assets/images/svg/notif2.svg',
    ),
    NotificationModel(
      title: 'There are good deals',
      message: 'Lots of great deals around New York that you should check out',
      date: DateTime.now().subtract(Duration(days: 5)),
      iconPath: 'assets/images/svg/notif1.svg',
    ),
    NotificationModel(
      title: 'The house with the best rating',
      message: 'There are several houses currently on sale that you can check',
      date: DateTime.now().subtract(Duration(days: 5)),
      iconPath: 'assets/images/svg/notif3.svg',
    ),
    NotificationModel(
      title: 'Payment Notification',
      message: 'Successfully paid!🥳',
      date: DateTime.now().subtract(Duration(days: 5)),
      iconPath: 'assets/images/svg/notif4.svg',
    ),
  ].obs;

  String formatDayMonth(DateTime date) {
    return DateFormat('d MMM').format(date);
  }

  String getGroupTitle(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date).inDays;

    if (difference == 0) {
      return 'Today';
    } else if (difference < 7) {
      return 'This Week';
    } else {
      return 'Earlier';
    }
  }

  // String getGroupLabel(DateTime date) {
  //   final now = DateTime.now();
  //   final today = DateTime(now.year, now.month, now.day);
  //   final notificationDate = DateTime(date.year, date.month, date.day);

  //   if (notificationDate == today) {
  //     return 'Today';
  //   } else if (notificationDate == today.subtract(Duration(days: 1))) {
  //     return 'Yesterday';
  //   } else {
  //     return DateFormat('d MMM').format(date);
  //   }
  // }
}
