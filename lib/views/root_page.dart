import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:realix_real_estate_app/commons/app_images.dart';
import 'package:realix_real_estate_app/commons/app_strings.dart';
import 'package:realix_real_estate_app/controllers/bottom_bar_controller.dart';
import 'package:realix_real_estate_app/views/My%20Home/my_home_page.dart';
import 'package:realix_real_estate_app/views/Discover/discover_page.dart';
import 'package:realix_real_estate_app/views/home/home_page.dart';
import 'package:realix_real_estate_app/views/message/chat_page.dart';
import 'package:realix_real_estate_app/views/profile/profile_page.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RootPage extends StatelessWidget {
  RootPage({super.key});

  BottomBarController bottomBarController = Get.put(BottomBarController());

  List pageList = [
    HomePage(),
    ChatPage(),
    DiscoverPage(),
    MyHomePage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCFCFD),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
            backgroundColor: Color(0xFFFCFCFD),
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
            key: GlobalKey(),
            selectedLabelStyle:
                TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
            unselectedLabelStyle:
                TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
            onTap: (value) {
              bottomBarController.selectedIndex.value = value;
            },
            currentIndex: bottomBarController.selectedIndex.value,
            
            items: [
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    bottomBarController.selectedIndex.value == 0
                        ? AppImages.home
                        : AppImages.home_outline,
                    color: bottomBarController.selectedIndex.value == 0
                        ? Colors.black
                        : Color(0xFF777E90),
                  ),
                  label: AppStrings.home),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    bottomBarController.selectedIndex.value == 1
                        ? AppImages.message
                        : AppImages.message_outline,
                    color: bottomBarController.selectedIndex.value == 1
                        ? Colors.black
                        : Color(0xFF777E90),
                  ),
                  label: AppStrings.message),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    bottomBarController.selectedIndex.value == 2
                        ? AppImages.discover
                        : AppImages.discover_outline,
                    color: bottomBarController.selectedIndex.value == 2
                        ? Colors.black
                        : Color(0xFF777E90),
                  ),
                  label: AppStrings.discover),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    bottomBarController.selectedIndex.value == 3
                        ? AppImages.my_home
                        : AppImages.my_home_outline,
                    color: bottomBarController.selectedIndex.value == 3
                        ? Colors.black
                        : Color(0xFF777E90),
                  ),
                  label: AppStrings.myHome),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    bottomBarController.selectedIndex.value == 4
                        ? AppImages.profile
                        : AppImages.profile_outline,
                    color: bottomBarController.selectedIndex.value == 4
                        ? Colors.black
                        : Color(0xFF777E90),
                  ),
                  label: AppStrings.profile),
            ]),
      ),
      body: Obx(
        () => pageList[bottomBarController.selectedIndex.value],
      ),
    );
  }
}
