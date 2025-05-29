import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realix_real_estate_app/controllers/add_new_property_controller.dart';
import 'package:realix_real_estate_app/widgets/custom_black_buttton.dart';
import 'package:realix_real_estate_app/widgets/my_linear_progress_indicator.dart';
import 'package:realix_real_estate_app/widgets/page_heading_row.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AnpMeetWithAgentPage extends StatelessWidget {
  AnpMeetWithAgentPage({super.key});
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
                  indicatorHeading: 'Address', indicatorValue: 2),
              SizedBox(
                height: height * 0.04,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: Container(
                  height: 67,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(width * 0.03)),
                  child: Center(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.black,
                        child: Icon(
                          Icons.location_on_rounded,
                          size: 19.sp,
                          color: Colors.white,
                        ),
                      ),
                      title: Text(
                        'Property Address',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w700),
                      ),
                      subtitle: Text(
                        addNewPropertyController.property.value.streetAddress,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          overflow: TextOverflow.ellipsis,
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
                buttonName: 'Next',
                onTap: () {},
              ))
        ],
      ),
    );
  }
}
