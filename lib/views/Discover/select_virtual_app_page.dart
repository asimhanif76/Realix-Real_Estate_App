import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:realix_real_estate_app/commons/app_images.dart';
import 'package:realix_real_estate_app/controllers/shedule_tour_controller.dart';
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
              selectedIndex: 1,
              index: 1,
            ),
            _customListtile(
              width,
              height,
              svgImagePath: AppImages.skype,
              title: 'Skype',
              selectedIndex: 1,
              index: 2,
            ),
            _customListtile(
              width,
              height,
              svgImagePath: AppImages.google_meet,
              title: 'Google Meet',
              selectedIndex: 1,
              index: 3,
            )
          ],
        ),
      ),
    );
  }

  Widget _customListtile(
    double width,
    double height, {
    required String svgImagePath,
    required String title,
    required int selectedIndex,
    required int index,
  }) {
    return Container(
      padding: EdgeInsets.only(
          left: width * 0.04,
          right: width * 0.04,
          top: width * 0.01,
          bottom: width * 0.04),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFFE6E8EC)),
        borderRadius: BorderRadius.circular(width * 0.05),
      ),
      child: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.all(0),
            leading: SvgPicture.asset(AppImages.whatsapp),
            title: Text(title,
                style:
                    TextStyle(fontSize: 16.5.sp, fontWeight: FontWeight.w800)),
            subtitle: Text(
              'Recommend',
              style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey),
            ),
            trailing: Icon(
              selectedIndex == index
                  ? Icons.check_circle
                  : Icons.circle_outlined,
              color: selectedIndex == index
                  ? Color(0xFF2FA2B9)
                  : Color(0xFFE6E8EC),
            ),
          ),
          TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(width * 0.04),
                  borderSide: BorderSide(color: Color(0xFFE6E8EC)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(width * 0.04),
                  borderSide: BorderSide(color: Color(0xFFE6E8EC)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(width * 0.04),
                  borderSide: BorderSide(color: Color(0xFFE6E8EC)),
                ),
                hintText: 'Email Adress',
                filled: true,
                fillColor: Color(0xFFFCFCFD)),
          ),
        ],
      ),
    );
  }
}
