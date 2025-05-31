import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realix_real_estate_app/controllers/add_new_property_controller.dart';
import 'package:realix_real_estate_app/widgets/custom_black_buttton.dart';
import 'package:realix_real_estate_app/widgets/my_linear_progress_indicator.dart';
import 'package:realix_real_estate_app/widgets/page_heading_row.dart';

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
                  indicatorHeading: 'Reason Selling Home', indicatorValue: 4),
              SizedBox(
                height: height * 0.025,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Why are you selling your home?',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              ListView.separated(
                padding: EdgeInsets.symmetric(vertical: height * 0.02),
                shrinkWrap: true,
                itemCount: addNewPropertyController.reasonSelling.length,
                separatorBuilder: (context, index) => SizedBox(
                  height: height * 0.01,
                ),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                    child: Obx(
                      () => Container(
                        height: height * 0.066,
                        decoration: BoxDecoration(
                            border: Border.all(color: Color(0xFFE6E8EC)),
                            borderRadius: BorderRadius.circular(width * 0.03),
                            color: Color(0xFFF9FAFB)),
                        child: ListTile(
                          onTap: () {
                            addNewPropertyController.reasonForSelling.value =
                                addNewPropertyController.reasonSelling[index];
                            addNewPropertyController.reasonSellingIndex.value =
                                index;
                            print(addNewPropertyController
                                .reasonForSelling.value);
                          },
                          title: Text(
                            addNewPropertyController.reasonSelling[index],
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                          leading: Icon(
                            addNewPropertyController.reasonSellingIndex.value ==
                                    index
                                ? Icons.check_box
                                : Icons.check_box_outline_blank,
                            color: addNewPropertyController
                                        .reasonSellingIndex.value ==
                                    index
                                ? Color(0xFF2FA2B9)
                                : Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: CustomBlackButtton(
                buttonName: 'Next',
                onTap: () {},
              ))
        ],
      ),
    );
  }
}
