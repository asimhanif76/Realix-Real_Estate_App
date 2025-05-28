import 'package:flutter/material.dart';
import 'package:realix_real_estate_app/commons/app_images.dart';
import 'package:realix_real_estate_app/commons/app_strings.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MyHomeEmpty extends StatelessWidget {
  const MyHomeEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
            backgroundColor: Color(0xFFFCFCFD),

      body: Container(
        width: width,
        height: height,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                AppImages.my_home_empty,
                scale: 4,
              ),
              SizedBox(
                height: height * 0.07,
              ),
              Text(
                AppStrings.readyToSellYourHome,
                textAlign: TextAlign.center,
                style:
                    TextStyle(fontSize: 18.3.sp, fontWeight: FontWeight.w800),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Text(
                AppStrings.realixIsMakingSimpler,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.2.sp,
                  fontWeight: FontWeight.w300,
                  color: Color(0xFF777E90),
                ),
              ),
              SizedBox(
                height: height * 0.04,
              ),
              Container(
                width: width * 0.5,
                height: height * 0.065,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(width * 0.05),
                    color: Colors.black),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                    child: Text(
                      AppStrings.addProperty,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
