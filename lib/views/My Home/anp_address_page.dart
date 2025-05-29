import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realix_real_estate_app/controllers/add_new_property_controller.dart';
import 'package:realix_real_estate_app/widgets/custom_black_buttton.dart';
import 'package:realix_real_estate_app/widgets/my_linear_progress_indicator.dart';
import 'package:realix_real_estate_app/widgets/my_text_field.dart';
import 'package:realix_real_estate_app/widgets/page_heading_row.dart';

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
      body: Stack(
        alignment: Alignment.bottomCenter,
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
                    child: PageHeadingRow(pageHeadingText: 'Add New Property'),
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  MyLinearProgressIndicator(
                      indicatorHeading: 'Address', indicatorValue: 1),
                  Padding(
                    padding:
                        EdgeInsets.only(left: width * 0.05, top: height * 0.03),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Property Address',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                    child: MyTextField(
                        labelText: 'Street address',
                        controller:
                            addNewPropertyController.streetAddressController),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                    child: MyTextField(
                        labelText: 'Unit number',
                        controller:
                            addNewPropertyController.unitNumberController),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                    child: MyTextField(
                        labelText: 'City name',
                        controller:
                            addNewPropertyController.cityNameController),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                    child: MyTextField(
                        labelText: 'Select State',
                        isReadable: true,
                        trailingIcon: Icon(Icons.keyboard_arrow_down_rounded),
                        onTap: () async {
                          final selected = await showMenu(
                            context: context,
                            position: RelativeRect.fromLTRB(width * 0.9,
                                height * 0.5, width * 0.1, height * 0.4),
                            items: [
                              PopupMenuItem(
                                value: '1',
                                child: Text('1'),
                              ),
                              PopupMenuItem(
                                value: '2',
                                child: Text('2'),
                              ),
                              PopupMenuItem(
                                value: '3',
                                child: Text('3'),
                              ),
                              PopupMenuItem(
                                value: '4',
                                child: Text('4'),
                              ),
                              PopupMenuItem(
                                value: '5',
                                child: Text('5'),
                              ),
                            ],
                          );

                          if (selected != null) {
                            addNewPropertyController.stateController.text =
                                selected;
                          }
                        },
                        controller: addNewPropertyController.stateController),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                    child: MyTextField(
                        labelText: 'Zipcode',
                        controller: addNewPropertyController.zipCodeController),
                  ),
                ],
              ),
            ),
          ),
          CustomBlackButtton(
            buttonName: 'Next',
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
                  addNewPropertyController.stateController.text
                      .trim()
                      .isNotEmpty &&
                  addNewPropertyController.zipCodeController.text
                      .trim()
                      .isNotEmpty) {
                addNewPropertyController.updateAddress(
                    street:
                        addNewPropertyController.streetAddressController.text +
                            ", " +
                            addNewPropertyController.unitNumberController.text,
                    city: addNewPropertyController.cityNameController.text,
                    state: addNewPropertyController.stateController.text,
                    zip: addNewPropertyController.zipCodeController.text);
                addNewPropertyController.varPrint();
                addNewPropertyController.clearTextFields();
                Navigator.pushNamed(context, '/anpMeetWithAgentPage');
              } else {
                Get.snackbar(
                  'Missing Fields',
                  'Please fill out all fields',
                  snackPosition: SnackPosition.TOP,
                  backgroundColor: Colors.redAccent,
                  colorText: Colors.white,
                  // dismissDirection: DismissDirection.startToEnd,
                  // isDismissible: true,
                  duration: Duration(seconds: 2),
                  margin: EdgeInsets.all(10),
                  borderRadius: 8,
                );
              }
            },
          )
        ],
      ),
    );
  }
}
