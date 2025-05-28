import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realix_real_estate_app/controllers/new_property_controller.dart';
import 'package:realix_real_estate_app/widgets/custom_black_buttton.dart';
import 'package:realix_real_estate_app/widgets/my_linear_progress_indicator.dart';
import 'package:realix_real_estate_app/widgets/my_text_field.dart';
import 'package:realix_real_estate_app/widgets/page_heading_row.dart';

class AnpAddressPage extends StatelessWidget {
  AnpAddressPage({super.key});

  AddPropertyController addPropertyController =
      Get.put(AddPropertyController());

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Scaffold(
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
                    indicatorHeading: 'Address', indicatorValue: 1),
                Padding(
                  padding:
                      EdgeInsets.only(left: width * 0.05, top: height * 0.03),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Property Address',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                  child: MyTextField(
                      labelText: 'Street address',
                      controller:
                          addPropertyController.streetAddressController),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                  child: MyTextField(
                      labelText: 'Unit number',
                      controller: addPropertyController.unitNumberController),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                  child: MyTextField(
                      labelText: 'City name',
                      controller: addPropertyController.cityNameController),
                ),
                Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: width * 0.05, vertical: width * 0.025),
                    child: Container(
                      padding: EdgeInsets.only(
                          left: width * 0.01, right: width * 0.01),
                      height: height * 0.07,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.grey,
                          width: 1.5,
                        ),
                        color: Color(0xFFF4F5F6),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Select State',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                            Icon(Icons.keyboard_arrow_down_rounded),
                          ],
                        ),
                      ),
                    )),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                  child: MyTextField(
                      labelText: 'Zipcode',
                      controller: addPropertyController.zipCodeController),
                ),
              ],
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: CustomBlackButtton(
                  buttonName: 'Next',
                  onTap: () {
                    Navigator.pushNamed(context, '/anpMeetWithAgentPage');
                  },
                ))
          ],
        ),
      ),
    );
  }
}
