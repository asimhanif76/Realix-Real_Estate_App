import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realix_real_estate_app/commons/app_strings.dart';
import 'package:realix_real_estate_app/controllers/add_new_property_controller.dart';
import 'package:realix_real_estate_app/widgets/custom_black_buttton.dart';
import 'package:realix_real_estate_app/widgets/my_linear_progress_indicator.dart';
import 'package:realix_real_estate_app/widgets/page_heading_row.dart';

class AnpTimeToSell extends StatelessWidget {
  AnpTimeToSell({super.key});

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
                  indicatorHeading: AppStrings.timeToSell, indicatorValue: 3),
              SizedBox(
                height: height * 0.025,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    AppStrings.howSoonWantToSell,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              ListView.separated(
                padding: EdgeInsets.symmetric(vertical: height * 0.02),
                shrinkWrap: true,
                itemCount: addNewPropertyController.sellingPeriod.length,
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
                            border: Border.all(
                                color: addNewPropertyController
                                            .selectedPeriod.value ==
                                        index
                                    ? Color(0xFF2FA2B9)
                                    : Color(0xFFE6E8EC)),
                            borderRadius: BorderRadius.circular(width * 0.03),
                            color: Color(0xFFF9FAFB)),
                        child: ListTile(
                          onTap: () {
                            addNewPropertyController.timePeriodForSell.value =
                                addNewPropertyController.sellingPeriod[index];
                            addNewPropertyController.selectedPeriod.value =
                                index;
                            print(addNewPropertyController
                                .timePeriodForSell.value);
                          },
                          title: Text(
                            addNewPropertyController.sellingPeriod[index],
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: CustomBlackButtton(
        buttonName: AppStrings.next,
        onTap: () {
          addNewPropertyController.updateTimeToSell(
              addNewPropertyController.timePeriodForSell.value);
          Navigator.pushNamed(context, '/anpReasonSellingHome');
        },
      ),
    );
  }
}
