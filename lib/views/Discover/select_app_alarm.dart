import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realix_real_estate_app/controllers/home_page_controller.dart';
import 'package:realix_real_estate_app/controllers/shedule_tour_controller.dart';
import 'package:realix_real_estate_app/widgets/page_heading_row.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SelectAppAlarm extends StatelessWidget {
  SelectAppAlarm({super.key});

  HomePageController homePageController = Get.put(HomePageController());

  SheduleTourController sheduleTourController =
      Get.put(SheduleTourController());

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFFFDFDFD),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        child: Column(
          children: [
            SizedBox(height: height * 0.04),
            PageHeadingRow(pageHeadingText: 'Review your tour'),
            SizedBox(height: height * 0.04),
            Container(
              width: width,
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.05, vertical: width * 0.04),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(width * 0.05),
                border: Border.all(color: Color(0xFFE6E8EC)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    homePageController
                        .ProductList[
                            sheduleTourController.selectedPropertyIndex.value]
                        .name,
                    style:
                        TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w800),
                  ),
                  SizedBox(
                    height: width * 0.005,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_rounded,
                        color: Color(0xFF2FA2B9),
                        size: 14.5.sp,
                      ),
                      SizedBox(
                        width: width * 0.01,
                      ),
                      Text(
                        homePageController
                            .ProductList[sheduleTourController
                                .selectedPropertyIndex.value]
                            .address,
                        style: TextStyle(
                            fontSize: 14.5.sp, fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                  Divider(
                    height: height * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Date',
                        style: TextStyle(
                          fontSize: 15.5.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        'Mon, April 4',
                        style: TextStyle(
                          fontSize: 16.5.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Time',
                        style: TextStyle(
                          fontSize: 15.5.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        "${sheduleTourController.time[sheduleTourController.selectedTimeIndex.value - 1].replaceAll('AM', '').replaceAll('PM', '').trim()} - ${sheduleTourController.time[sheduleTourController.selectedTimeIndex.value]}",
                        style: TextStyle(
                          fontSize: 16.5.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: width * 0.05,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.05, vertical: width * 0.03),
              decoration: BoxDecoration(
                  color: Colors.red.shade50,
                  borderRadius: BorderRadius.circular(width * 0.05)),
              child: ListTile(
                contentPadding: EdgeInsets.all(0),
                leading: Icon(
                  Icons.error_outline,
                  color: Colors.red,
                ),
                title: Text(
                  'Your identity is not verified',
                  style: TextStyle(
                      fontSize: 16.5.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.red),
                ),
                subtitle: Text(
                  'Verify your identity before schedule the tour',
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w300,
                      color: Colors.red),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.04, vertical: width * 0.045),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, -4),
              blurRadius: 10,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Row(
          children: [
            _customButton(
              width: width,
              btnName: 'Edit',
              textColor: Colors.black,
              btnColor: Color(0xFFE6E8EC),
              onTap: () {
                Navigator.of(context)
                    .popUntil(ModalRoute.withName('/pickDatePage'));
              },
            ),
            SizedBox(
              width: width * 0.04,
            ),
            _customButton(
              width: width,
              btnName: 'Shedule',
              textColor: Colors.white,
              btnColor: Colors.black,
              onTap: () {
                Navigator.pushNamed(context, '/confirmRequest');
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _customButton({
    required double width,
    required String btnName,
    required Color textColor,
    required Color btnColor,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: Material(
        color: btnColor,
        borderRadius: BorderRadius.circular(width * 0.05),
        child: InkWell(
          borderRadius: BorderRadius.circular(width * 0.05),
          onTap: onTap,
          child: Container(
            height: width * 0.14,
            child: Center(
              child: Text(
                btnName,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: textColor),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
