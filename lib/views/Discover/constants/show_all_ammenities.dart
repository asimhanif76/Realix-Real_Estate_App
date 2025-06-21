import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realix_real_estate_app/controllers/add_new_property_controller.dart';
import 'package:realix_real_estate_app/controllers/discover_page_controller.dart';
import 'package:realix_real_estate_app/widgets/custom_black_buttton.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ShowAllAmmenities extends StatelessWidget {
  ShowAllAmmenities({super.key});

  DiscoverPageController discoverPageController =
      Get.put(DiscoverPageController());

  AddNewPropertyController addNewPropertyController =
      Get.put(AddNewPropertyController());

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: height * 0.04,
          ),
          _heaadingRow(width),
          SizedBox(
            height: height * 0.03,
          ),
          _ammenities(
            width,
            height,
          ),
          Expanded(child: SizedBox()),
          CustomBlackButtton(
            buttonName: 'Select',
            onTap: () => Get.back(),
          )
        ],
      ),
    );
  }

  Widget _ammenities(
    double width,
    double height,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Ammentities",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17.sp,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: width * 0.03,
          ),
          Obx(() => Align(
                alignment: Alignment.topLeft,
                child: Wrap(
                  spacing: 10,
                  children: addNewPropertyController.facilities.map((ammenity) {
                    final isSelected = discoverPageController.selectedAmmenities
                        .contains(ammenity);

                    return ChoiceChip(
                      label: Text(ammenity),
                      selected: isSelected,
                      showCheckmark: false,
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                      onSelected: (selected) {
                        if (isSelected) {
                          discoverPageController.selectedAmmenities
                              .remove(ammenity);
                        } else {
                          discoverPageController.selectedAmmenities
                              .add(ammenity);
                        }
                        print('${discoverPageController.selectedAmmenities}');
                      },
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color:
                              isSelected ? Colors.black : Colors.grey.shade300,
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
                ),
              )),
        ],
      ),
    );
  }

  Widget _heaadingRow(double width) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 27.sp,
            height: 27.sp,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(width * 0.025),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  size: 18.sp,
                )),
          ),
          Text(
            'Filters',
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w800),
          ),
          const SizedBox(
            width: 50,
          ),
        ],
      ),
    );
  }
}
