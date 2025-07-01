import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:realix_real_estate_app/commons/app_images.dart';
import 'package:realix_real_estate_app/commons/app_strings.dart';
import 'package:realix_real_estate_app/controllers/profile_page_controllers/profile_page_controller.dart';
import 'package:realix_real_estate_app/widgets/full_image_view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  ProfilePageController profilePageController =
      Get.put(ProfilePageController());

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFFFDFDFD),
      body: Column(
        children: [
          SizedBox(
            height: height * 0.05,
          ),
          Text(
            AppStrings.profile,
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w800),
          ),
          SizedBox(
            height: height * 0.05,
          ),
          _userProfileContainer(
            width,
            onTapImage: () {
              Get.to(FullImageView(
                  imagePath: profilePageController.user.value.userImage));
            },
            onTapEdit: () {
              Navigator.pushNamed(context, '/editProfilePage');
            },
          ),
          ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: width * 0.05),
            shrinkWrap: true,
            itemCount: profilePageController.settingOptions.length,
            itemBuilder: (context, index) {
              final item = profilePageController.settingOptions[index];

              return index == 0
                  ? Column(
                      children: [
                        _buildProfileOptionHeading(
                            width, AppStrings.homeSearch),
                        _buildProfileTile(
                          item,
                          height,
                          () {
                            print('Recently Viewed');
                          },
                        )
                      ],
                    )
                  : index == 3
                      ? Column(
                          children: [
                            _buildProfileOptionHeading(
                                width, AppStrings.generals),
                            _buildProfileTile(
                              item,
                              height,
                              () {
                                print('Sell My Home');
                              },
                            )
                          ],
                        )
                      : _buildProfileTile(
                          item,
                          height,
                          () {
                            index == 1
                                ? Navigator.pushNamed(
                                    context, '/myFavouriitePage')
                                : index == 2
                                    ? print('Past Tour')
                                    : index == 4
                                        ? print('My Listing')
                                        : index == 5
                                            ? Navigator.pushNamed(
                                                context, '/settingPage')
                                            : null;
                          },
                        );
            },
          )
        ],
      ),
    );
  }

  Widget _buildProfileTile(var item, double height, VoidCallback onTap) {
    return Padding(
      padding: EdgeInsets.only(top: height * 0.01),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(15),
        child: ListTile(
          contentPadding: EdgeInsets.all(0),
          // onTap: onTap,
          leading: Container(
            height: 28.sp,
            width: 28.sp,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0xFFE6E8EC)),
            child: SvgPicture.asset(
              item['svgImage'],
              fit: BoxFit.scaleDown,
            ),
          ),
          title: Text(
            item['title'],
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 16.sp,
          ),
        ),
      ),
    );
  }

  Widget _buildProfileOptionHeading(double width, String heading) {
    return Padding(
      padding: EdgeInsets.only(top: width * 0.06, bottom: width * 0.01),
      child: Container(
          alignment: Alignment.centerLeft,
          child: Text(
            heading,
            style: TextStyle(
                fontSize: 15.5.sp,
                fontWeight: FontWeight.w600,
                color: Colors.grey),
          )),
    );
  }

  Widget _userProfileContainer(double width,
      {required VoidCallback onTapImage, required VoidCallback onTapEdit}) {
    return Column(
      children: [
        Stack(
          children: [
            InkWell(
              onTap: onTapImage,
              child: CircleAvatar(
                radius: 26.sp,
                backgroundImage:
                    getProfileImage(profilePageController.user.value.userImage),
              ),
            ),
            Positioned(
                bottom: 0,
                right: 0,
                child: InkWell(
                  onTap: onTapEdit,
                  child: Container(
                    width: 21.sp,
                    height: 21.sp,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 2),
                        shape: BoxShape.circle,
                        color: Colors.black),
                    child: SvgPicture.asset(
                      AppImages.edit,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ))
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: width * 0.04, bottom: width * 0.01),
          child: Text(
            profilePageController.user.value.userName,
            style: TextStyle(fontSize: 17.5.sp, fontWeight: FontWeight.w700),
          ),
        ),
        Text(
          profilePageController.user.value.userEmail,
          style: TextStyle(
              fontSize: 15.2.sp,
              fontWeight: FontWeight.w500,
              color: Colors.grey),
        ),
      ],
    );
  }

  ImageProvider getProfileImage(String imagePath) {
    if (imagePath.startsWith('http')) {
      return NetworkImage(imagePath);
    } else if (imagePath.startsWith('/')) {
      return FileImage(File(imagePath));
    } else {
      return AssetImage(imagePath);
    }
  }
}
