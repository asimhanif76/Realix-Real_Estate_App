import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realix_real_estate_app/model/onboarding_page_model.dart';

class OnboardingPageController extends GetxController {
  PageController pageController = PageController();

  RxInt currentIndex = 0.obs;

  List<OnboardingPageModel> onboardingPages = [
    OnboardingPageModel(
        imagePath: 'assets/images/onboarding_img.png',
        text_1: 'Enjoy the beautiful world',
        text_2:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. '),
    OnboardingPageModel(
        imagePath: 'assets/images/onboarding_img.png',
        text_1: 'Enjoy the beautiful world',
        text_2:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. ')
  ];
}
