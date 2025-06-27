import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:realix_real_estate_app/commons/app_strings.dart';
import 'package:realix_real_estate_app/controllers/add_new_property_controller.dart';
import 'package:realix_real_estate_app/widgets/custom_black_buttton.dart';
import 'package:realix_real_estate_app/widgets/my_linear_progress_indicator.dart';
import 'package:realix_real_estate_app/widgets/page_heading_row.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AnpMeetWithAgentPage extends StatelessWidget {
  AnpMeetWithAgentPage({super.key});
  AddNewPropertyController addNewPropertyController =
      Get.put(AddNewPropertyController());

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFFFCFCFD),
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: height * 0.04,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                child:
                    PageHeadingRow(pageHeadingText: AppStrings.addNewProperty),
              ),
              SizedBox(
                height: height * 0.04,
              ),
              MyLinearProgressIndicator(
                  indicatorHeading: AppStrings.meetWithAgent,
                  indicatorValue: 2),
              SizedBox(
                height: height * 0.04,
              ),
              _propertyAddress(width, AppStrings.propertyAddress,
                  addNewPropertyController.property.value.streetAddress),
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
        ],
      ),
      bottomNavigationBar: CustomBlackButtton(
        buttonName: AppStrings.next,
        onTap: () {
          DateTime selectedDate = addNewPropertyController
              .daysOfMonth[addNewPropertyController.selectedDateIndex.value];

          String selectedTime = addNewPropertyController
              .time[addNewPropertyController.selectedTimeIndex.value];

          addNewPropertyController.updateMeeting(
            selectedDate,
            selectedTime,
          );
          Navigator.pushNamed(context, '/anpTimeToSell');
        },
      ),
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
            itemCount: addNewPropertyController.time.length,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => SizedBox(
              width: width * 0.04,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  addNewPropertyController.selectedTimeIndex.value = index;
                },
                child: Obx(
                  () => Container(
                    padding: EdgeInsets.symmetric(vertical: width * 0.02),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: addNewPropertyController
                                      .selectedTimeIndex.value ==
                                  index
                              ? Color(0xFF2FA2B9)
                              : Color(0xFFE6E8EC),
                        ),
                        borderRadius: BorderRadius.circular(width * 0.02)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                      child: Center(
                        child: Text(
                          addNewPropertyController.time[index],
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
                  addNewPropertyController
                      .months[addNewPropertyController.selectedMonth.value],
                  style:
                      TextStyle(fontSize: 17.5.sp, fontWeight: FontWeight.w700),
                ),
              ),
              Row(
                children: [
                  _buildButton(() {
                    if (addNewPropertyController.selectedMonth.value > 0) {
                      addNewPropertyController.animateRight.value = true;
                      addNewPropertyController.selectedMonth.value--;
                    }
                  }, Icons.arrow_back_ios_new_rounded, width),
                  SizedBox(
                    width: width * 0.04,
                  ),
                  _buildButton(() {
                    if (addNewPropertyController.selectedMonth.value < 11) {
                      addNewPropertyController.animateRight.value = false;
                      addNewPropertyController.selectedMonth.value++;
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
                itemCount: addNewPropertyController.daysOfMonth.length,
                separatorBuilder: (context, index) => SizedBox(
                      width: width * 0.04,
                    ),
                itemBuilder: (context, index) {
                  DateTime date = addNewPropertyController.daysOfMonth[index];
                  String dayName =
                      DateFormat('EEEE').format(date).toUpperCase();
                  String dayNum = DateFormat('d').format(date);
                  String monthName =
                      DateFormat('MMM').format(date).toUpperCase();

                  return GestureDetector(
                    onTap: () {
                      addNewPropertyController.selectedDateIndex.value = index;
                    },
                    child: Obx(
                      () => Container(
                        width: width * 0.21,
                        height: height * 0.15,
                        padding: EdgeInsets.symmetric(vertical: width * 0.02),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: addNewPropertyController
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

  Widget _propertyAddress(double width, String title, String address) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
      child: Container(
        height: 67,
        decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
            border: Border.all(color: Color(0xFFE6E8EC)),
            borderRadius: BorderRadius.circular(width * 0.03)),
        child: Center(
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.black,
              child: Icon(
                Icons.location_on_rounded,
                size: 19.sp,
                color: Colors.white,
              ),
            ),
            title: Text(
              title,
              style: TextStyle(fontSize: 15.5.sp, fontWeight: FontWeight.w700),
            ),
            subtitle: Text(
              address,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w300,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
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
