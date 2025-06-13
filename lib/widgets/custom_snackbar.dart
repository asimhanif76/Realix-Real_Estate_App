// import 'package:flutter/material.dart';

// class CustomSnackbar extends StatelessWidget {
//   const CustomSnackbar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Get.snackbar(
//                   AppStrings.missingFields,
//                   AppStrings.fillAllFields,
//                   snackPosition: SnackPosition.TOP,
//                   backgroundColor: Colors.redAccent,
//                   colorText: Colors.white,
//                   dismissDirection: DismissDirection.startToEnd,
//                   isDismissible: true,
//                   duration: Duration(seconds: 2),
//                   margin: EdgeInsets.all(10),
//                   borderRadius: 8,
//                 );
//   }
// }


import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackbar {
  static void show({
    required String title,
    required String message,
    Color backgroundColor = Colors.redAccent,
    Color textColor = Colors.white,
    Duration duration = const Duration(seconds: 2),
  }) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: backgroundColor,
      colorText: textColor,
      dismissDirection: DismissDirection.startToEnd,
      isDismissible: true,
      duration: duration,
      margin: const EdgeInsets.all(10),
      borderRadius: 8,
    );
  }
}
