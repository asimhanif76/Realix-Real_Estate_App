import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:realix_real_estate_app/commons/app_images.dart';
import 'package:realix_real_estate_app/commons/app_strings.dart';
import 'package:realix_real_estate_app/controllers/shedule_tour_controller.dart';
import 'package:realix_real_estate_app/widgets/custom_black_buttton.dart';
import 'package:realix_real_estate_app/widgets/page_heading_row.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SelectVirtualAppPage extends StatelessWidget {
  SelectVirtualAppPage({super.key});

  SheduleTourController sheduleTourController =
      Get.put(SheduleTourController());

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFFCFCFD),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: height * 0.04),
              PageHeadingRow(pageHeadingText: 'Select virtual app'),
              SizedBox(height: height * 0.04),
              _customListtile(
                width,
                height,
                svgImagePath: AppImages.whatsapp,
                title: 'Whatsapp',
                index: 1,
                controller: sheduleTourController.emailController,
                onTap: () {
                  sheduleTourController.selectedVirtualAppIndex.value = 1;
                },
              ),
              _customListtile(
                width,
                height,
                svgImagePath: AppImages.skype,
                title: 'Skype',
                index: 2,
                controller: sheduleTourController.emailController,
                onTap: () {
                  sheduleTourController.selectedVirtualAppIndex.value = 2;
                },
              ),
              _customListtile(
                width,
                height,
                svgImagePath: AppImages.google_meet,
                title: 'Google Meet',
                index: 3,
                controller: sheduleTourController.emailController,
                onTap: () {
                  sheduleTourController.selectedVirtualAppIndex.value = 3;
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBlackButtton(
        buttonName: AppStrings.next,
        onTap: () {
          Navigator.pushNamed(context, '/selectAppAlarm');
        },
      ),
    );
  }

  Widget _customListtile(
    double width,
    double height, {
    required String svgImagePath,
    required String title,
    required int index,
    required TextEditingController controller,
    required VoidCallback onTap,
  }) {
    return Obx(
      () => Padding(
        padding: EdgeInsets.only(bottom: width * 0.05),
        child: Material(
          color: Colors.white,
          borderRadius: BorderRadius.circular(width * 0.05),
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(width * 0.05),
            child: Container(
              padding: EdgeInsets.only(
                  left: width * 0.04,
                  right: width * 0.04,
                  top: width * 0.01,
                  bottom: sheduleTourController.selectedVirtualAppIndex.value ==
                          index
                      ? width * 0.04
                      : 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(width * 0.05),
                border: Border.all(color: Color(0xFFE6E8EC)),
              ),
              child: Column(
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.all(0),
                    leading: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: SvgPicture.asset(svgImagePath)),
                    title: Text(title,
                        style: TextStyle(
                            fontSize: 16.5.sp, fontWeight: FontWeight.w800)),
                    subtitle: Text(
                      'Recommend',
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                    ),
                    trailing: Icon(
                      sheduleTourController.selectedVirtualAppIndex.value ==
                              index
                          ? Icons.check_circle_rounded
                          : Icons.circle_outlined,
                      size: 21.sp,
                      color:
                          sheduleTourController.selectedVirtualAppIndex.value ==
                                  index
                              ? Color(0xFF2FA2B9)
                              : Color(0xFFE6E8EC),
                    ),
                  ),
                  sheduleTourController.selectedVirtualAppIndex.value == index
                      ? TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(width * 0.04),
                                borderSide:
                                    BorderSide(color: Color(0xFFE6E8EC)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(width * 0.04),
                                borderSide:
                                    BorderSide(color: Color(0xFFE6E8EC)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(width * 0.04),
                                borderSide:
                                    BorderSide(color: Color(0xFFE6E8EC)),
                              ),
                              hintText: 'Email Adress',
                              hintStyle: TextStyle(color: Color(0xFF777E90)),
                              filled: true,
                              fillColor: Color(0xFFFCFCFD)),
                        )
                      : SizedBox(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
