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

class AnpDiscription extends StatelessWidget {
  AnpDiscription({super.key});

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
                  indicatorHeading: AppStrings.discription, indicatorValue: 5),
              Padding(
                padding: EdgeInsets.only(
                    top: width * 0.06,
                    bottom: width * 0.02,
                    left: width * 0.05,
                    right: width * 0.05),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    AppStrings.discription,
                    style: TextStyle(
                        fontSize: 17.5.sp, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: MyTextField(
                    labelText: AppStrings.tellUsAboutHome,
                    controller: addNewPropertyController.discriptionController),
              )
            ],
          ),
        ],
      ),
      bottomNavigationBar: CustomBlackButtton(
        buttonName: AppStrings.next,
        onTap: () {
          if (addNewPropertyController.discriptionController.text
              .trim()
              .isNotEmpty) {
            addNewPropertyController.updateDescription(
                addNewPropertyController.discriptionController.text);
            Navigator.pushNamed(context, '/anpHomeFacts');
            addNewPropertyController.discriptionController.clear();
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
