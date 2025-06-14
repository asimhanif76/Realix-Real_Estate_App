import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realix_real_estate_app/commons/app_strings.dart';
import 'package:realix_real_estate_app/controllers/add_new_property_controller.dart';
import 'package:realix_real_estate_app/widgets/custom_black_buttton.dart';
import 'package:realix_real_estate_app/widgets/custom_snackbar.dart';
import 'package:realix_real_estate_app/widgets/my_linear_progress_indicator.dart';
import 'package:realix_real_estate_app/widgets/my_text_field.dart';
import 'package:realix_real_estate_app/widgets/page_heading_row.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AnpAddressPage extends StatelessWidget {
  AnpAddressPage({super.key});

  AddNewPropertyController addNewPropertyController =
      Get.put(AddNewPropertyController());

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFFFCFCFD),
      body: SizedBox(
        height: height,
        child: SingleChildScrollView(
          child: Column(
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
                  indicatorHeading: AppStrings.address, indicatorValue: 1),
              Padding(
                padding:
                    EdgeInsets.only(left: width * 0.05, top: height * 0.03),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    AppStrings.propertyAddress,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: MyTextField(
                    labelText: AppStrings.streetAddress,
                    controller:
                        addNewPropertyController.streetAddressController),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: MyTextField(
                    labelText: AppStrings.unitNumber,
                    controller: addNewPropertyController.unitNumberController),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: MyTextField(
                    labelText: AppStrings.cityName,
                    controller: addNewPropertyController.cityNameController),
              ),
              Obx(
                () => Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: width * 0.05, vertical: width * 0.025),
                  child: DropdownButtonHideUnderline(
                    child: Container(
                      height: height * 0.07,
                      decoration: BoxDecoration(
                          color: Color(0xFFF4F5F6),
                          borderRadius: BorderRadius.circular(width * 0.04)),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: width * 0.04, right: width * 0.057),
                        child: DropdownButton<String>(
                          hint: Text(
                            AppStrings.selectState,
                            style: TextStyle(fontSize: 16),
                          ),
                          value: addNewPropertyController
                                  .property.value.state.isEmpty
                              ? null
                              : addNewPropertyController.property.value.state,
                          style:
                              TextStyle(fontSize: 16.5.sp, color: Colors.black),
                          icon: Icon(Icons.keyboard_arrow_down),
                          dropdownColor: Color(0xFFF4F5F6),
                          borderRadius: BorderRadius.circular(width * 0.05),
                          isExpanded: true,
                          elevation: 0,
                          items: [
                            DropdownMenuItem(
                                value: AppStrings.punjab,
                                child: Text(AppStrings.punjab)),
                            DropdownMenuItem(
                                value: AppStrings.Sindh,
                                child: Text(AppStrings.Sindh)),
                            DropdownMenuItem(
                                value: AppStrings.kpk,
                                child: Text(AppStrings.kpk)),
                            DropdownMenuItem(
                                value: AppStrings.balochistan,
                                child: Text(AppStrings.balochistan)),
                          ],
                          onChanged: (String? value) {
                            if (value != null) {
                              addNewPropertyController.property.update((val) {
                                val?.state = value;
                              });
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: MyTextField(
                    keyBoardType: TextInputType.number,
                    labelText: AppStrings.zipCode,
                    controller: addNewPropertyController.zipCodeController),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBlackButtton(
        buttonName: AppStrings.next,
        onTap: () {
          if (addNewPropertyController.streetAddressController.text
                  .trim()
                  .isNotEmpty &&
              addNewPropertyController.unitNumberController.text
                  .trim()
                  .isNotEmpty &&
              addNewPropertyController.cityNameController.text
                  .trim()
                  .isNotEmpty &&
              addNewPropertyController.property.value.state.isNotEmpty &&
              addNewPropertyController.zipCodeController.text
                  .trim()
                  .isNotEmpty) {
            addNewPropertyController.updateAddress(
                street: addNewPropertyController.streetAddressController.text +
                    ", " +
                    addNewPropertyController.unitNumberController.text,
                city: addNewPropertyController.cityNameController.text,
                state: addNewPropertyController.property.value.state,
                zip: addNewPropertyController.zipCodeController.text);
            addNewPropertyController.clearTextFields();
            Navigator.pushNamed(context, '/anpMeetWithAgentPage');
          } else {
            CustomSnackbar.show(
                title: AppStrings.missingFields,
                message: AppStrings.fillAllFields);
          }
        },
      ),
    );
  }
}
