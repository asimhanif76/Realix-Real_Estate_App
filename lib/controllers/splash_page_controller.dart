import 'dart:async';

import 'package:get/get.dart';
import 'package:realix_real_estate_app/views/onboarding/onboarding_page.dart';

class SplashPageController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Timer(
      Duration(seconds: 2),
      () {
        Get.to(OnboardingPage());
      },
    );
  }
}
