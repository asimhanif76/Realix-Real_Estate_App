import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realix_real_estate_app/controllers/add_new_property_controller.dart';
import 'package:realix_real_estate_app/widgets/custom_black_buttton.dart';
import 'package:realix_real_estate_app/widgets/my_linear_progress_indicator.dart';
import 'package:realix_real_estate_app/widgets/my_text_field.dart';
import 'package:realix_real_estate_app/widgets/page_heading_row.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AnpContacts extends StatelessWidget {
  AnpContacts({super.key});

  AddNewPropertyController addNewPropertyController =
      Get.put(AddNewPropertyController());

  TextEditingController numberController = TextEditingController();
  TextEditingController aboutController = TextEditingController();

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
                  indicatorHeading: 'Reason Selling Home', indicatorValue: 7),
              Padding(
                padding: EdgeInsets.only(
                    top: width * 0.06,
                    bottom: width * 0.02,
                    left: width * 0.05,
                    right: width * 0.05),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Tell us a little about yourself',
                    style: TextStyle(
                        fontSize: 17.5.sp, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: MyTextField(
                  labelText: 'Phone number',
                  keyBoardType: TextInputType.number,
                  controller: numberController,
                  prefixIcon: InkWell(
                    onTap: () {
                      showCountryPicker(
                        context: context,
                        onSelect: (value) {
                          addNewPropertyController.selectedCode.value =
                              value.phoneCode.toString();
                          addNewPropertyController.countryFlag.value =
                              value.flagEmoji;
                        },
                      );
                    },
                    child: Obx(
                      () => Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircleAvatar(
                            radius: 18.sp,
                            child: Text(
                              addNewPropertyController.countryFlag.value,
                              style: TextStyle(fontSize: 20.sp),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5, right: 10),
                            child: Icon(
                              Icons.keyboard_arrow_down,
                              size: 18.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: MyTextField(
                    labelText: 'Is there anything else we should know?',
                    controller: aboutController),
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
