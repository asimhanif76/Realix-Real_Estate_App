import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingPageControllers extends GetxController {
  List<String> settingItems = [
    'Notification',
    'Dark Mode',
    'Language',
    'Country',
    'Terms of use',
    'Privacy Policy',
    'About',
    'FAQs',
  ];

  RxBool isNotificationOn = true.obs;
  RxBool isDarkMode = false.obs;

  TextEditingController searchFAQsControllers = TextEditingController();

  RxInt expandedFaqIndex = (-1).obs;
  RxBool isExpanded = true.obs;

  RxString selectedCountry = 'US'.obs;
  RxString selectedLanguage = 'English'.obs;
  List<String> language = [
    'English',
    'Arabic',
    'German',
    'Russian',
    'Chinese',
    'Japanies',
    'Turkish'
  ];

  RxInt faqsItemsShow = 3.obs;

  List faqsItems = [
    {
      'question': 'How does Realix work?',
      'answer':
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Laoreet nulla lorem eget praesent arcu. Nam tellus faucibus blandit dis est ultrices pretium. Dui faucibus malesuada viverra suspendisse at dictumst aenean eget dolor. Orci ornare morbi ut nibh ultricies at lobortis.",
    },
    {
      'question': 'Who can buy a home?',
      'answer':
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Laoreet nulla lorem eget praesent arcu. Nam tellus faucibus blandit dis est ultrices pretium. Dui faucibus malesuada viverra suspendisse at dictumst aenean eget dolor. Orci ornare morbi ut nibh ultricies at lobortis.",
    },
    {
      'question': 'How can I sell my home?',
      'answer':
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Laoreet nulla lorem eget praesent arcu. Nam tellus faucibus blandit dis est ultrices pretium. Dui faucibus malesuada viverra suspendisse at dictumst aenean eget dolor. Orci ornare morbi ut nibh ultricies at lobortis.",
    },
    {
      'question': 'How do I contact a local agent?',
      'answer':
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Laoreet nulla lorem eget praesent arcu. Nam tellus faucibus blandit dis est ultrices pretium. Dui faucibus malesuada viverra suspendisse at dictumst aenean eget dolor. Orci ornare morbi ut nibh ultricies at lobortis.",
    },
    {
      'question': 'How does Realix work?',
      'answer':
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Laoreet nulla lorem eget praesent arcu. Nam tellus faucibus blandit dis est ultrices pretium. Dui faucibus malesuada viverra suspendisse at dictumst aenean eget dolor. Orci ornare morbi ut nibh ultricies at lobortis.",
    },
    {
      'question': 'Who can buy a home?',
      'answer':
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Laoreet nulla lorem eget praesent arcu. Nam tellus faucibus blandit dis est ultrices pretium. Dui faucibus malesuada viverra suspendisse at dictumst aenean eget dolor. Orci ornare morbi ut nibh ultricies at lobortis.",
    },
    {
      'question': 'How can I sell my home?',
      'answer':
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Laoreet nulla lorem eget praesent arcu. Nam tellus faucibus blandit dis est ultrices pretium. Dui faucibus malesuada viverra suspendisse at dictumst aenean eget dolor. Orci ornare morbi ut nibh ultricies at lobortis.",
    },
    {
      'question': 'How do I contact a local agent?',
      'answer':
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Laoreet nulla lorem eget praesent arcu. Nam tellus faucibus blandit dis est ultrices pretium. Dui faucibus malesuada viverra suspendisse at dictumst aenean eget dolor. Orci ornare morbi ut nibh ultricies at lobortis.",
    },
  ];
}
