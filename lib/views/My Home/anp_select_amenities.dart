import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realix_real_estate_app/commons/app_strings.dart';
import 'package:realix_real_estate_app/controllers/add_new_property_controller.dart';
import 'package:realix_real_estate_app/widgets/custom_black_buttton.dart';
import 'package:realix_real_estate_app/widgets/my_linear_progress_indicator.dart';
import 'package:realix_real_estate_app/widgets/page_heading_row.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AnpSelectAmenities extends StatelessWidget {
  AnpSelectAmenities({super.key});

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
                  indicatorHeading: AppStrings.selectAmenitites,
                  indicatorValue: 8),
              Padding(
                padding: EdgeInsets.only(
                    top: width * 0.06,
                    bottom: width * 0.02,
                    left: width * 0.05,
                    right: width * 0.05),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    AppStrings.selectAmenitites,
                    style: TextStyle(
                        fontSize: 17.5.sp, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              Obx(() => Wrap(
                    spacing: 10,
                    runSpacing: 0,
                    children: addNewPropertyController.facilities
                        .take(8)
                        .map((facility) {
                      final isSelected = addNewPropertyController
                          .selectedFacilities
                          .contains(facility);

                      return ChoiceChip(
                        label: Text(facility),
                        selected: isSelected,
                        showCheckmark: false,
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                        onSelected: (selected) {
                          if (isSelected) {
                            addNewPropertyController.selectedFacilities
                                .remove(facility);
                          } else {
                            addNewPropertyController.selectedFacilities
                                .add(facility);
                          }
                        },
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: isSelected
                                ? Colors.black
                                : Colors.grey.shade300,
                            width: isSelected ? 2 : 1,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        backgroundColor: Colors.white,
                        selectedColor: Colors.white,
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      );
                    }).toList(),
                  ))
            ],
          ),
        ],
      ),
      bottomNavigationBar: CustomBlackButtton(
        buttonName: AppStrings.next,
        onTap: () {
          addNewPropertyController.updateAmenities(
              addNewPropertyController.selectedFacilities.toList());
          Navigator.pushNamed(context, '/addNewPropertyDetailsPage');
          // Navigator.pushNamedAndRemoveUntil(
          //     context,
          //     '/addNewPropertyDetailsPage',
          //     ModalRoute.withName('/myHomePage'));
        },
      ),
    );
  }
}
