import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:realix_real_estate_app/commons/app_images.dart';
import 'package:realix_real_estate_app/controllers/profile_page_controllers/profile_page_controller.dart';
import 'package:realix_real_estate_app/controllers/profile_page_controllers/setting_page_controllers.dart';
import 'package:realix_real_estate_app/widgets/image_provider.dart';
import 'package:realix_real_estate_app/widgets/my_container_button.dart';
import 'package:realix_real_estate_app/widgets/my_text_field.dart';
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
      body: SingleChildScrollView(
        child: Padding(
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
              Center(
                child: GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      backgroundColor: Color(0xFFFDFDFD),
                      context: context,
                      builder: (context) {
                        return SizedBox(
                          height: height * 0.15,
                          child: Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: width * 0.1),
                            child: Row(
                              children: [
                                _imagePickerContainer(
                                  text: "Camera",
                                  icon: Icons.add_a_photo_outlined,
                                  onTap: () {
                                    profilePageController.pickImageFromCamera();
                                    Navigator.pop(context);
                                  },
                                ),
                                SizedBox(
                                  width: width * 0.04,
                                ),
                                _imagePickerContainer(
                                  text: "Gallery",
                                  icon: Icons.add_photo_alternate_outlined,
                                  onTap: () {
                                    profilePageController
                                        .pickImageFromGallery();
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Stack(
                    children: [
                      Obx(
                        () => CircleAvatar(
                          radius: 30.sp,
                          backgroundImage: getProfileImage(
                              profilePageController.user.value.userImage),
                        ),
                      ),
                      Positioned(
                          bottom: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: 21.sp,
                              height: 21.sp,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.white, width: 2),
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
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              _customtextFieldColumn(height,
                  fieldName: 'Full Name',
                  hintText: profilePageController.user.value.userName,
                  controller: profilePageController.nameController),
              _customtextFieldColumn(height,
                  fieldName: 'Email',
                  hintText: profilePageController.user.value.userEmail,
                  controller: profilePageController.emailController),
              _customtextFieldColumn(height,
                  fieldName: 'Address',
                  hintText: 'Merta Nadi Street 88, Kuta, Bali',
                  controller: profilePageController.addressController),
              _customtextFieldColumn(height,
                  fieldName: 'Password',
                  hintText: '*********',
                  isObsure: true,
                  controller: profilePageController.passwordController),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.05, vertical: width * 0.03),
        child: MyContainerButton(
          color: Colors.black,
          widget: Text(
            'Save Changes',
            style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w700),
          ),
          onTap: () {
            profilePageController.updateUserModel();
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  Widget _customtextFieldColumn(
    double height, {
    required String fieldName,
    required String hintText,
    bool isObsure = false,
    required TextEditingController controller,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          fieldName,
          style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Color(0xFF353945)),
        ),
        MyTextField(
          labelText: hintText,
          controller: controller,
          isPasswordField: isObsure,
        ),
        SizedBox(
          height: height * 0.01,
        ),
      ],
    );
  }

  Widget _imagePickerContainer(
      {required String text,
      required IconData icon,
      required VoidCallback onTap}) {
    return Expanded(
        child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(),
          color: Colors.grey.shade200,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(text),
            Icon(icon),
          ],
        ),
      ),
    ));
  }
}
