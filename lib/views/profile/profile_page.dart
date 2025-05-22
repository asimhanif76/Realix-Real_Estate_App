import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:realix_real_estate_app/commons/app_images.dart';
import 'package:realix_real_estate_app/widgets/page_heading_row.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

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
          PageHeadingRow(pageHeadingText: 'Profile'),
          SizedBox(
            height: height * 0.05,
          ),
          Stack(
            children: [
              CircleAvatar(
                radius: 26.sp,
              ),
              Positioned(
                  bottom: 0,
                  right: 0,
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
                  ))
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: width * 0.04, bottom: width * 0.01),
            child: Text(
              'Andrew Preston',
              style: TextStyle(fontSize: 17.5.sp, fontWeight: FontWeight.w700),
            ),
          ),
          Text(
            'andrew.hello@gmail.com',
            style: TextStyle(fontSize: 15.2.sp, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
