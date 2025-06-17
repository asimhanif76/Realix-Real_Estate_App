import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realix_real_estate_app/controllers/discover_page_controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FilterBottomSheet extends StatelessWidget {
  FilterBottomSheet({super.key});

  DiscoverPageController discoverPageController =
      Get.put(DiscoverPageController());

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
      height: height * 0.9,
      child: Column(
        children: [
          Divider(
            indent: width * 0.43,
            endIndent: width * 0.43,
            color: Colors.grey.shade300,
            thickness: 5,
            height: width * 0.07,
          ),
          _heaadingRow(width),
          SizedBox(
            height: height * 0.02,
          ),
          _forSale_forRent(width, height),
        ],
      ),
    );
  }

  Widget _forSale_forRent(double width, double height) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
      child: Container(
        height: height * 0.06,
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(width * 0.03),
            color: Colors.grey.shade200),
        child: Row(
          children: [
            Expanded(
                child: Padding(
              padding: EdgeInsets.all(width * 0.01),
              child: Obx(
                () => GestureDetector(
                  onTap: () {
                    discoverPageController.isForSale.value = true;
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(width * 0.03),
                        color: discoverPageController.isForSale.value
                            ? Colors.white
                            : Colors.transparent),
                    child: Center(
                      child: Text(
                        'For Sale',
                        style: TextStyle(
                            fontSize: 15.5.sp,
                            fontWeight: FontWeight.w700,
                            color: discoverPageController.isForSale.value
                                ? Colors.black
                                : Color(0xFF777E90)),
                      ),
                    ),
                  ),
                ),
              ),
            )),
            Expanded(
                child: Padding(
              padding: EdgeInsets.all(width * 0.01),
              child: Obx(
                () => GestureDetector(
                  onTap: () {
                    discoverPageController.isForSale.value = false;
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width * 0.03),
                      color: discoverPageController.isForSale.value
                          ? Colors.transparent
                          : Colors.white,
                    ),
                    child: Center(
                      child: Text(
                        'For Rent',
                        style: TextStyle(
                            fontSize: 15.5.sp,
                            fontWeight: FontWeight.w700,
                            color: discoverPageController.isForSale.value
                                ? Color(0xFF777E90)
                                : Colors.black),
                      ),
                    ),
                  ),
                ),
              ),
            ))
          ],
        ),
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
                  Icons.close,
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
