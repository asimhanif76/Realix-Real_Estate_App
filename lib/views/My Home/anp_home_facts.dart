import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realix_real_estate_app/commons/app_strings.dart';
import 'package:realix_real_estate_app/controllers/add_new_property_controller.dart';
import 'package:realix_real_estate_app/widgets/custom_black_buttton.dart';
import 'package:realix_real_estate_app/widgets/my_linear_progress_indicator.dart';
import 'package:realix_real_estate_app/widgets/page_heading_row.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AnpHomeFacts extends StatelessWidget {
  AnpHomeFacts({super.key});

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
                  indicatorHeading: AppStrings.homeFacts, indicatorValue: 6),
              Padding(
                padding: EdgeInsets.only(
                    top: width * 0.06,
                    bottom: width * 0.02,
                    left: width * 0.05,
                    right: width * 0.05),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    AppStrings.homeFacts,
                    style: TextStyle(
                        fontSize: 17.5.sp, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    AppStrings.helpYourAgent,
                    style:
                        TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.04,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: DropdownButtonHideUnderline(
                  child: Obx(
                    () => Container(
                      height: height * 0.07,
                      width: width,
                      decoration: BoxDecoration(
                          color: Color(0xFFF4F5F6),
                          borderRadius: BorderRadius.circular(width * 0.04)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                        child: DropdownButton(
                          elevation: 0,
                          borderRadius: BorderRadius.circular(width * 0.05),
                          dropdownColor: Color(0xFFF4F5F6),
                          hint: Text('Select type'),
                          icon: Icon(Icons.keyboard_arrow_down_sharp),
                          isExpanded: true,
                          value: addNewPropertyController
                                  .property.value.propertyType.isEmpty
                              ? null
                              : addNewPropertyController
                                  .property.value.propertyType,
                          items: [
                            DropdownMenuItem(
                                value: AppStrings.commercial,
                                child: Text(AppStrings.commercial)),
                            DropdownMenuItem(
                                value: AppStrings.residential,
                                child: Text(AppStrings.residential)),
                          ],
                          onChanged: (String? value) {
                            addNewPropertyController.updatePropertyType(
                                type: value!);
                            print(
                                "Type Is :  ${addNewPropertyController.property.value.propertyType}");
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: CustomBlackButtton(
                buttonName: AppStrings.next,
                onTap: () {},
              ))
        ],
      ),
    );
  }
}
