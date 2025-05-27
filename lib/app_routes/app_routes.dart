import 'package:flutter/material.dart';
import 'package:realix_real_estate_app/views/home/home_page.dart';
import 'package:realix_real_estate_app/views/message/message_page.dart';
import 'package:realix_real_estate_app/views/notification/notification_page.dart';
import 'package:realix_real_estate_app/views/onboarding/onboarding_page.dart';
import 'package:realix_real_estate_app/views/onboarding/sign_in_page.dart';
import 'package:realix_real_estate_app/views/onboarding/sign_up_page.dart';
import 'package:realix_real_estate_app/views/root_page.dart';
import 'package:realix_real_estate_app/views/splash_page.dart';

class AppRoutes {
  static const String splashPage = '/';
  static const String onboardingPage = '/onboardingpage';
  static const String signInPage = '/signInPage';
  static const String signUpPage = '/signUpPage';
  static const String rootPage = '/rootPage';
  static const String homePage = '/homePage';
  static const String notificationPage = '/notificationPage';
  static const String messagePage = '/messagePage';

  static Map<String, WidgetBuilder> get routes => {
        splashPage: (_) => SplashPage(),
        onboardingPage: (_) => OnboardingPage(),
        signInPage: (_) => SignInPage(),
        signUpPage: (_) => SignUpPage(),
        rootPage: (_) => RootPage(),
        homePage: (_) => HomePage(),
        notificationPage: (_) => NotificationPage(),
        messagePage: (_) => MessagePage(),
      };
}
