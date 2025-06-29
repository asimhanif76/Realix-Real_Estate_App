import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SheduleTourController extends GetxController {
  RxBool inPerson = true.obs;

  TextEditingController otpController = TextEditingController();

  RxBool isPinComplete = false.obs;

  RxString selectedState = ''.obs;
  RxInt selectedMonth = 8.obs;
  RxBool animateRight = false.obs;
  RxInt selectedDateIndex = 2.obs;
  RxInt selectedTimeIndex = 1.obs;

  RxString month = 'January'.obs;

  List<String> months = [  
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  RxList<DateTime> daysOfMonth = <DateTime>[].obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    _generateDaysOfMonth();
    ever(selectedMonth, (_) {
      _generateDaysOfMonth();
      update(); // if using GetBuilder
    });
  }

  void _generateDaysOfMonth() {
    DateTime now = DateTime.now();
    int totalDays = DateUtils.getDaysInMonth(now.year, now.month);

    daysOfMonth.value = List.generate(totalDays, (index) {
      return DateTime(now.year, selectedMonth.value + 1, index + 1);
    });
  }

  List time = [
    '12:00 AM',
    '12:30 AM',
    '01:00 AM',
    '01:30 AM',
    '02:00 AM',
    '02:30 AM',
    '03:00 AM',
    '03:30 AM',
    '04:00 AM',
    '04:30 AM',
    '05:00 AM',
    '05:30 AM',
    '06:00 AM',
    '06:30 AM',
    '07:00 AM',
    '07:30 AM',
    '08:00 AM',
    '08:30 AM',
    '09:00 AM',
    '09:30 AM',
    '10:00 AM',
    '10:30 AM',
    '11:00 AM',
    '11:30 AM',
    '12:00 PM',
    '12:30 PM',
    '01:00 PM',
    '01:30 PM',
    '02:00 PM',
    '02:30 PM',
    '03:00 PM',
    '03:30 PM',
    '04:00 PM',
    '04:30 PM',
    '05:00 PM',
    '05:30 PM',
    '06:00 PM',
    '06:30 PM',
    '07:30 PM',
    '07:30 PM',
    '08:00 PM',
    '08:30 PM',
    '09:00 PM',
    '09:30 PM',
    '10:00 PM',
    '10:30 PM',
    '11:00 PM',
    '11:30 PM',
  ];

  // Virtual app Page
  RxInt selectedVirtualAppIndex = 1.obs;
  TextEditingController emailController = TextEditingController();

  //selected property index of product page
  RxInt selectedPropertyIndex = 0.obs;
}
