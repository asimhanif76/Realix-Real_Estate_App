import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realix_real_estate_app/commons/app_strings.dart';
import 'package:realix_real_estate_app/controllers/add_new_property_controller.dart';
import 'package:realix_real_estate_app/widgets/custom_black_buttton.dart';
import 'package:realix_real_estate_app/widgets/my_linear_progress_indicator.dart';
import 'package:realix_real_estate_app/widgets/page_heading_row.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AnpReasonSellingHome extends StatelessWidget {
  AnpReasonSellingHome({super.key});

  AddNewPropertyController addNewPropertyController =
      Get.put(AddNewPropertyController());

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFFFCFCFD),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            height: height,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.04,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                    child: PageHeadingRow(
                        pageHeadingText: AppStrings.addNewProperty),
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  MyLinearProgressIndicator(
                      indicatorHeading: AppStrings.reasonSelling,
                      indicatorValue: 4),
                  SizedBox(
                    height: height * 0.025,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        AppStrings.whySellingHome,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  ListView.separated(
                    padding: EdgeInsets.symmetric(vertical: height * 0.02),
                    shrinkWrap: true,
                    physics: PageScrollPhysics(),
                    itemCount: addNewPropertyController.reasonSelling.length,
                    separatorBuilder: (context, index) => SizedBox(
                      height: height * 0.01,
                    ),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                        child: Obx(() => index ==
                                addNewPropertyController.reasonSelling.length -
                                    1
                            ? GestureDetector(
                                onTap: () {
                                  addNewPropertyController
                                      .reasonForSelling.value = index ==
                                          addNewPropertyController
                                                  .reasonSelling.length -
                                              1
                                      ? addNewPropertyController
                                          .otherReasonController.text
                                      : addNewPropertyController
                                          .reasonSelling[index];
                                  addNewPropertyController
                                      .reasonSellingIndex.value = index;
                                  print(addNewPropertyController
                                      .reasonForSelling.value);
                                },
                                child: _otherReason(width, height, index),
                              )
                            : _reasonContainer(width, height, index)),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBlackButtton(
        buttonName: AppStrings.next,
        onTap: () {
          addNewPropertyController
              .updateReason(addNewPropertyController.reasonForSelling.value);
          Navigator.pushNamed(context, '/anpDiscription');
        },
      ),
    );
  }

  Widget _reasonContainer(double width, double height, int index) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xFFE6E8EC)),
          borderRadius: BorderRadius.circular(width * 0.03),
          color: Color(0xFFF9FAFB)),
      child: ListTile(
        onTap: () {
          addNewPropertyController.reasonForSelling.value =
              addNewPropertyController.reasonSelling[index];
          addNewPropertyController.reasonSellingIndex.value = index;
          print(addNewPropertyController.reasonForSelling.value);
        },
        leading: Icon(
          addNewPropertyController.reasonSellingIndex.value == index
              ? Icons.check_box
              : Icons.check_box_outline_blank,
          color: addNewPropertyController.reasonSellingIndex.value == index
              ? Color(0xFF2FA2B9)
              : Colors.grey,
        ),
        title: Text(
          addNewPropertyController.reasonSelling[index],
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Widget _otherReason(double width, double height, int index) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xFFE6E8EC)),
          borderRadius: BorderRadius.circular(width * 0.03),
          color: Color(0xFFF9FAFB)),
      child: Row(
        children: [
          Container(
            alignment: Alignment.topCenter,
            width: width * 0.145,
            height: height * 0.14,
            child: Icon(
              addNewPropertyController.reasonSellingIndex.value == index
                  ? Icons.check_box
                  : Icons.check_box_outline_blank,
              color: addNewPropertyController.reasonSellingIndex.value == index
                  ? Color(0xFF2FA2B9)
                  : Colors.grey,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: height * 0.017),
              child: Padding(
                padding: EdgeInsets.only(right: width * 0.05),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      addNewPropertyController.reasonSelling[index],
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: height * 0.006,
                    ),
                    Text(
                      AppStrings.pleaseEnterYourReasonForSelling,
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: height * 0.006,
                    ),
                    TextField(
                      onTap: () {
                        addNewPropertyController.reasonSellingIndex.value =
                            addNewPropertyController.reasonSelling.length - 1;
                      },
                      controller:
                          addNewPropertyController.otherReasonController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFE6E8EC)),
                              borderRadius:
                                  BorderRadius.circular(width * 0.02)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFE6E8EC)),
                              borderRadius:
                                  BorderRadius.circular(width * 0.02)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFE6E8EC)),
                              borderRadius:
                                  BorderRadius.circular(width * 0.02)),
                          hintText: AppStrings.egIAmHelping,
                          hintStyle: TextStyle(
                              fontSize: 15.sp, fontWeight: FontWeight.w400)),
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
