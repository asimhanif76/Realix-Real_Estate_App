import 'package:flutter/material.dart';
import 'package:realix_real_estate_app/views/Discover/constants/map_search_page.dart';
import 'package:realix_real_estate_app/views/Discover/constants/show_all_images.dart';
import 'package:realix_real_estate_app/views/Discover/pick_date_page.dart';
import 'package:realix_real_estate_app/views/Discover/product_detail_page.dart';
import 'package:realix_real_estate_app/views/My%20Home/add_new_property_details_page.dart';
import 'package:realix_real_estate_app/views/My%20Home/anp_address_page.dart';
import 'package:realix_real_estate_app/views/My%20Home/anp_contacts.dart';
import 'package:realix_real_estate_app/views/My%20Home/anp_discription.dart';
import 'package:realix_real_estate_app/views/My%20Home/anp_home_facts.dart';
import 'package:realix_real_estate_app/views/My%20Home/anp_meet_with_agent_page.dart';
import 'package:realix_real_estate_app/views/My%20Home/anp_reason_selling_home.dart';
import 'package:realix_real_estate_app/views/My%20Home/anp_select_amenities.dart';
import 'package:realix_real_estate_app/views/My%20Home/anp_time_to_sell.dart';
import 'package:realix_real_estate_app/views/My%20Home/my_home_page.dart';
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
  static const String myHomePage = '/myHomePage';
  static const String notificationPage = '/notificationPage';
  static const String messagePage = '/messagePage';
  static const String anpAddressPage = '/anpAddressPage';
  static const String anpMeetWithAgentPage = '/anpMeetWithAgentPage';
  static const String anpTimeToSell = '/anpTimeToSell';
  static const String anpReasonSellingHome = '/anpReasonSellingHome';
  static const String anpDiscription = '/anpDiscription';
  static const String anpHomeFacts = '/anpHomeFacts';
  static const String anpContacts = '/anpContacts';
  static const String anpSelectAmenities = '/anpSelectAmenities';
  static const String addNewPropertyDetailsPage = '/addNewPropertyDetailsPage';
  static const String mapSearchPage = '/mapSearchPage';
  static const String productDetailPage = '/productDetailPage';
  static const String showAllImages = '/showAllImages';
  static const String pickDatePage = '/pickDatePage';

  static Map<String, WidgetBuilder> get routes => {
        splashPage: (_) => SplashPage(),
        onboardingPage: (_) => OnboardingPage(),
        signInPage: (_) => SignInPage(),
        signUpPage: (_) => SignUpPage(),
        rootPage: (_) => RootPage(),
        homePage: (_) => HomePage(),
        myHomePage: (_) => MyHomePage(),
        notificationPage: (_) => NotificationPage(),
        messagePage: (_) => MessagePage(),
        anpAddressPage: (_) => AnpAddressPage(),
        anpMeetWithAgentPage: (_) => AnpMeetWithAgentPage(),
        anpTimeToSell: (_) => AnpTimeToSell(),
        anpReasonSellingHome: (_) => AnpReasonSellingHome(),
        anpDiscription: (_) => AnpDiscription(),
        anpHomeFacts: (_) => AnpHomeFacts(),
        anpContacts: (_) => AnpContacts(),
        anpSelectAmenities: (_) => AnpSelectAmenities(),
        addNewPropertyDetailsPage: (_) => AddNewPropertyDetailsPage(),
        mapSearchPage: (_) => MapSearchPage(),
        productDetailPage: (_) => ProductDetailPage(),
        showAllImages: (_) => ShowAllImages(),
        pickDatePage: (_) => PickDatePage(),
      };
}
