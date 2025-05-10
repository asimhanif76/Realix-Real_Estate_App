import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realix_real_estate_app/model/notification_model.dart';
import 'package:intl/intl.dart';

class NotificationPageController extends GetxController {
  List<NotificationModel> notifications = [
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
      date: DateTime.now(),
      iconPath: 'assets/images/svg/notif2.svg',
    ),
    NotificationModel(
      title: 'There are good deals',
      message: 'Lots of great deals around New York that you should check out',
      date: DateTime.now(),
      iconPath: 'assets/images/svg/notif1.svg',
    ),
    NotificationModel(
      title: 'The house with the best rating',
      message: 'There are several houses currently on sale that you can check',
      date: DateTime.now(),
      iconPath: 'assets/images/svg/notif3.svg',
    ),
    NotificationModel(
      title: 'Payment Notification',
      message: 'Successfully paid!🥳',
      date: DateTime.now(),
      iconPath: 'assets/images/svg/notif4.svg',
    ),
  ];

  String formatDayMonth(DateTime date) {
    return DateFormat('d MMM').format(date);
  }
}
