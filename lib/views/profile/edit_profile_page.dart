import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realix_real_estate_app/controllers/profile_page_controllers/profile_page_controller.dart';
import 'package:realix_real_estate_app/controllers/profile_page_controllers/setting_page_controllers.dart';
import 'package:realix_real_estate_app/widgets/page_heading_row.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class EditProfilePage extends StatelessWidget {
  EditProfilePage({super.key});

  SettingPageControllers settingPageControllers =
      Get.put(SettingPageControllers());

  ProfilePageController profilePageController =
      Get.put(ProfilePageController());

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Color(0xFFFDFDFD),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.05,
              ),
              PageHeadingRow(pageHeadingText: 'Edit Profile'),
              SizedBox(
                height: height * 0.04,
              ),
              Center (
                child: InkWell(
                  onTap: () {
                    
                  },
                  child: CircleAvatar(
                    radius: 26.sp,
                    backgroundImage:
                        AssetImage(profilePageController.user.value.userImage),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
