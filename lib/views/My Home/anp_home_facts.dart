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
                      indicatorHeading: AppStrings.homeFacts,
                      indicatorValue: 6),
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
                        style: TextStyle(
                            fontSize: 15.sp, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: width * 0.05, vertical: width * 0.04),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        AppStrings.typeProperty,
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w500),
                      ),
                    ),
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
                              borderRadius:
                                  BorderRadius.circular(width * 0.04)),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: width * 0.04, right: width * 0.057),
                            child: DropdownButton(
                              elevation: 0,
                              borderRadius: BorderRadius.circular(width * 0.04),
                              dropdownColor: Color(0xFFF4F5F6),
                              hint: Text(AppStrings.selectType),
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
                                addNewPropertyController.property.update((val) {
                                  val?.propertyType = value!;
                                });
                                print(
                                    "Type Is :  ${addNewPropertyController.property.value.propertyType}");
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                    child: Row(
                      children: [
                        _customTextField(
                          AppStrings.finishedSQ,
                          true,
                          AppStrings.zero,
                          addNewPropertyController.finishedSqFtController,
                        ),
                        SizedBox(
                          width: width * 0.04,
                        ),
                        _customTextField(
                            AppStrings.lotSize,
                            false,
                            AppStrings.zeroSQ,
                            addNewPropertyController.lotSizeController),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                    child: Row(
                      children: [
                        _customTextField(
                            AppStrings.yearBuild,
                            false,
                            AppStrings.zero,
                            addNewPropertyController.yearBuiltController),
                        SizedBox(
                          width: width * 0.04,
                        ),
                        _customTextField(
                            AppStrings.bedrooms,
                            false,
                            AppStrings.zero,
                            addNewPropertyController.bedroomsController),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                    child: Row(
                      children: [
                        _customTextField(
                            AppStrings.fullBath,
                            true,
                            AppStrings.zero,
                            addNewPropertyController.fullBathsController),
                        SizedBox(
                          width: width * 0.04,
                        ),
                        _customTextField(
                            AppStrings.securityDeposit,
                            true,
                            '${AppStrings.zero} \$',
                            addNewPropertyController.securityDepositController),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            AppStrings.monthlyRent,
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w500),
                          ),
                        ),
                        MyTextField(
                            keyBoardType: TextInputType.number,
                            labelText: '${AppStrings.zero} \$',
                            controller:
                                addNewPropertyController.monthlyRentController),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBlackButtton(
        buttonName: AppStrings.next,
        onTap: () {
          if (addNewPropertyController.property.value.propertyType != '' &&
              addNewPropertyController.lotSizeController.text
                  .trim()
                  .isNotEmpty &&
              addNewPropertyController.yearBuiltController.text
                  .trim()
                  .isNotEmpty &&
              addNewPropertyController.fullBathsController.text
                  .trim()
                  .isNotEmpty &&
              addNewPropertyController.bedroomsController.text
                  .trim()
                  .isNotEmpty &&
              addNewPropertyController.monthlyRentController.text
                  .trim()
                  .isNotEmpty &&
              addNewPropertyController.securityDepositController.text
                  .trim()
                  .isNotEmpty) {
            addNewPropertyController.updateHomeFacts(
              lotSize: double.tryParse(
                      addNewPropertyController.lotSizeController.text) ??
                  0.0,
              yearBuilt: int.tryParse(
                      addNewPropertyController.yearBuiltController.text) ??
                  0,
              fullBaths: int.tryParse(
                      addNewPropertyController.fullBathsController.text) ??
                  0,
              bedrooms: int.tryParse(
                      addNewPropertyController.bedroomsController.text) ??
                  0,
              monthlyRent: double.tryParse(
                      addNewPropertyController.monthlyRentController.text) ??
                  0.0,
              securityDeposit: double.tryParse(addNewPropertyController
                      .securityDepositController.text) ??
                  0.0,
            );
            Navigator.pushNamed(context, '/anpContacts');
            addNewPropertyController.clearHomeFactsFields();
          } else {
            CustomSnackbar.show(
                title: AppStrings.missingFields,
                message: AppStrings.fillAllFields);
          }
        },
      ),
    );
  }

  Widget _customTextField(String heading, bool info, String label,
      TextEditingController controller) {
    return Expanded(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                heading,
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
              ),
              info
                  ? CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 209, 241, 247),
                      radius: 12.sp,
                      child: Text(
                        "!",
                        style:
                            TextStyle(fontSize: 12, color: Color(0xFF2FA2B9)),
                      ),
                    )
                  : SizedBox(
                      width: 1,
                    ),
            ],
          ),
          MyTextField(
            labelText: label,
            controller: controller,
            keyBoardType: TextInputType.number,
          ),
        ],
      ),
    );
  }
}
