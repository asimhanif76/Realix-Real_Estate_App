import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
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
                child: PageHeadingRow(pageHeadingText: 'Add New Property'),
              ),
              SizedBox(
                height: height * 0.04,
              ),
              MyLinearProgressIndicator(
                  indicatorHeading: 'Address', indicatorValue: 2),
              SizedBox(
                height: height * 0.04,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: Container(
                  height: 67,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey),
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
                        'Property Address',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w700),
                      ),
                      subtitle: Text(
                        addNewPropertyController.property.value.streetAddress,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.04,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(
                      () => Text(
                        addNewPropertyController.months[
                            addNewPropertyController.selectedMonth.value],
                        style: TextStyle(
                            fontSize: 17.5.sp, fontWeight: FontWeight.w700),
                      ),
                    ),
                    Row(
                      children: [
                        _buildButton(() {
                          if (addNewPropertyController.selectedMonth.value >
                              0) {
                            addNewPropertyController.animateRight.value = true;
                            addNewPropertyController.selectedMonth.value--;
                          }
                        }, Icons.arrow_back_ios_new_rounded, width),
                        SizedBox(
                          width: width * 0.04,
                        ),
                        _buildButton(() {
                          if (addNewPropertyController.selectedMonth.value <
                              11) {
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
                        DateTime date =
                            addNewPropertyControllerdaysOfMonth[index];
                        String dayName =
                            DateFormat('EEEE').format(date).toUpperCase();
                        String dayNum = DateFormat('d').format(date);
                        String monthName =
                            DateFormat('MMM').format(date).toUpperCase();

                        return GestureDetector(
                          onTap: () {
                            addNewPropertyController.selectedDateIndex.value =
                                index;
                          },
                          child: Obx(
                            () => Container(
                              width: width * 0.21,
                              height: height * 0.15,
                              padding:
                                  EdgeInsets.symmetric(vertical: width * 0.02),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: addNewPropertyController
                                                  .selectedDateIndex.value ==
                                              index
                                          ? Color(0xFF2FA2B9)
                                          : Colors.grey,
                                      width: addNewPropertyController
                                                  .selectedDateIndex.value ==
                                              index
                                          ? 2
                                          : 1),
                                  borderRadius:
                                      BorderRadius.circular(width * 0.02)),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    dayName,
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey),
                                  ),
                                  Text(
                                    dayNum,
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    monthName,
                                    style: TextStyle(
                                        fontSize: 12,
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
              SizedBox(
                height: height * 0.04,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Pick a time',
                    style: TextStyle(
                        fontSize: 17.5.sp, fontWeight: FontWeight.w700),
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
                        addNewPropertyController.selectedTimeIndex.value =
                            index;
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
                                      : Colors.grey,
                                  width: addNewPropertyController
                                              .selectedTimeIndex.value ==
                                          index
                                      ? 2
                                      : 1),
                              borderRadius:
                                  BorderRadius.circular(width * 0.02)),
                          child: Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: width * 0.05),
                            child: Text(
                              addNewPropertyController.time[index],
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: CustomBlackButtton(
                buttonName: 'Next',
                onTap: () {},
              ))
        ],
      ),
    );
  }

  Widget _buildButton(VoidCallback ontap, IconData icon, double width) {
    return InkWell(
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
