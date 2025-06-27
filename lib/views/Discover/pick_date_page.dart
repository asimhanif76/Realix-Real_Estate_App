import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:realix_real_estate_app/commons/app_images.dart';
import 'package:realix_real_estate_app/commons/app_strings.dart';
import 'package:realix_real_estate_app/controllers/shedule_tour_controller.dart';
import 'package:realix_real_estate_app/widgets/custom_black_buttton.dart';
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
            child: InkWell(
              borderRadius: BorderRadius.circular(width * 0.025),
              onTap: () => Get.back(),
              child: Container(
                  width: height * 0.055,
                  height: height * 0.055,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Icon(Icons.arrow_back_ios_new)),
            ),
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
          SizedBox(
            height: height * 0.04,
          ),
          _pickMonth(width, height),
          SizedBox(
            height: height * 0.04,
          ),
          _pickTime(width, height)
        ],
      ),
      bottomNavigationBar: CustomBlackButtton(
        buttonName: 'Schedule Tour',
        onTap: () {
          Navigator.pushNamed(context, '/verifyPhoneNumberPage');
        },
      ),
    );
  }

  Widget _pickMonth(double width, double height) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(
                () => Text(
                  sheduleTourController
                      .months[sheduleTourController.selectedMonth.value],
                  style:
                      TextStyle(fontSize: 17.5.sp, fontWeight: FontWeight.w700),
                ),
              ),
              Row(
                children: [
                  _buildButton(() {
                    if (sheduleTourController.selectedMonth.value > 0) {
                      sheduleTourController.animateRight.value = true;
                      sheduleTourController.selectedMonth.value--;
                    }
                  }, Icons.arrow_back_ios_new_rounded, width),
                  SizedBox(
                    width: width * 0.04,
                  ),
                  _buildButton(() {
                    if (sheduleTourController.selectedMonth.value < 11) {
                      sheduleTourController.animateRight.value = false;
                      sheduleTourController.selectedMonth.value++;
                    }
                  }, Icons.arrow_forward_ios_rounded, width),
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: height * 0.02,
        ),
        SizedBox(
          height: height * 0.12,
          child: Obx(
            () => ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                scrollDirection: Axis.horizontal,
                itemCount: sheduleTourController.daysOfMonth.length,
                separatorBuilder: (context, index) => SizedBox(
                      width: width * 0.04,
                    ),
                itemBuilder: (context, index) {
                  DateTime date = sheduleTourController.daysOfMonth[index];
                  String dayName =
                      DateFormat('EEEE').format(date).toUpperCase();
                  String dayNum = DateFormat('d').format(date);
                  String monthName =
                      DateFormat('MMM').format(date).toUpperCase();

                  return GestureDetector(
                    onTap: () {
                      sheduleTourController.selectedDateIndex.value = index;
                    },
                    child: Obx(
                      () => Container(
                        width: width * 0.21,
                        height: height * 0.15,
                        padding: EdgeInsets.symmetric(vertical: width * 0.02),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: sheduleTourController
                                          .selectedDateIndex.value ==
                                      index
                                  ? Color(0xFF2FA2B9)
                                  : Color(0xFFE6E8EC),
                            ),
                            borderRadius: BorderRadius.circular(width * 0.02)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              dayName,
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey),
                            ),
                            Text(
                              dayNum,
                              style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                            Text(
                              monthName,
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ),
      ],
    );
  }

  Widget _pickTime(double width, double height) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: Container(
            alignment: Alignment.centerLeft,
            child: Text(
              AppStrings.pickATime,
              style: TextStyle(fontSize: 17.5.sp, fontWeight: FontWeight.w700),
            ),
          ),
        ),
        SizedBox(
          height: height * 0.02,
        ),
        SizedBox(
          height: height * 0.05,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: width * 0.05),
            shrinkWrap: true,
            itemCount: sheduleTourController.time.length,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => SizedBox(
              width: width * 0.04,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  sheduleTourController.selectedTimeIndex.value = index;
                },
                child: Obx(
                  () => Container(
                    padding: EdgeInsets.symmetric(vertical: width * 0.02),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color:
                              sheduleTourController.selectedTimeIndex.value ==
                                      index
                                  ? Color(0xFF2FA2B9)
                                  : Color(0xFFE6E8EC),
                        ),
                        borderRadius: BorderRadius.circular(width * 0.02)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                      child: Center(
                        child: Text(
                          sheduleTourController.time[index],
                          style: TextStyle(
                              fontSize: 15.5.sp, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        )
      ],
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

  Widget _buildButton(VoidCallback ontap, IconData icon, double width) {
    return InkWell(
      borderRadius: BorderRadius.circular(width * 0.02),
      onTap: ontap,
      child: Container(
        width: width * 0.08,
        height: width * 0.08,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(width * 0.02),
        ),
        child: Icon(
          icon,
          size: 14.5.sp,
        ),
      ),
    );
  }
}
