import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:realix_real_estate_app/commons/app_images.dart';
import 'package:realix_real_estate_app/controllers/shedule_tour_controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PickDatePage extends StatelessWidget {
  PickDatePage({super.key});

  SheduleTourController sheduleTourController =
      Get.put(SheduleTourController());

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFFFDFDFD),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: height * 0.04,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.05),
            child: Container(
                width: height * 0.055,
                height: height * 0.055,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Icon(Icons.arrow_back_ios_new)),
          ),
          SizedBox(
            height: height * 0.03,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: width * 0.04, left: width * 0.05),
            child: Text(
              'Request a home tour',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
          ),
          _inPersonOrVirtual(width, height),
        ],
      ),
    );
  }

  Widget _inPersonOrVirtual(double width, double height) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
      child: Container(
        height: height * 0.06,
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(width * 0.03),
            color: Color(0xFFF9FAFB)),
        child: Row(
          children: [
            Expanded(
                child: Padding(
              padding: EdgeInsets.all(width * 0.01),
              child: Obx(
                () => GestureDetector(
                  onTap: () {
                    sheduleTourController.inPerson.value = true;
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(width * 0.03),
                        color: sheduleTourController.inPerson.value
                            ? Colors.white
                            : Colors.transparent),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(AppImages.in_person,
                              color: sheduleTourController.inPerson.value
                                  ? Colors.black
                                  : Color(0xFF777E90)),
                          SizedBox(
                            width: width * 0.01,
                          ),
                          Text(
                            'In Person',
                            style: TextStyle(
                                fontSize: 15.5.sp,
                                fontWeight: FontWeight.w700,
                                color: sheduleTourController.inPerson.value
                                    ? Colors.black
                                    : Color(0xFF777E90)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )),
            Expanded(
                child: Padding(
              padding: EdgeInsets.all(width * 0.01),
              child: Obx(
                () => GestureDetector(
                  onTap: () {
                    sheduleTourController.inPerson.value = false;
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width * 0.03),
                      color: sheduleTourController.inPerson.value
                          ? Colors.transparent
                          : Colors.white,
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(AppImages.virtual,
                              color: sheduleTourController.inPerson.value
                                  ? Color(0xFF777E90)
                                  : Colors.black),
                          SizedBox(
                            width: width * 0.01,
                          ),
                          Text(
                            'Virtual',
                            style: TextStyle(
                                fontSize: 15.5.sp,
                                fontWeight: FontWeight.w700,
                                color: sheduleTourController.inPerson.value
                                    ? Color(0xFF777E90)
                                    : Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
