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

class AnpContacts extends StatelessWidget {
  AnpContacts({super.key});

  final AddNewPropertyController addNewPropertyController =
      Get.put(AddNewPropertyController());

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFFCFCFD),
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: height * 0.04),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                child:
                    PageHeadingRow(pageHeadingText: AppStrings.addNewProperty),
              ),
              SizedBox(height: height * 0.04),
              MyLinearProgressIndicator(
                  indicatorHeading: AppStrings.contact, indicatorValue: 7),
              Padding(
                padding: EdgeInsets.only(
                  top: width * 0.06,
                  bottom: width * 0.02,
                  left: width * 0.05,
                  right: width * 0.05,
                ),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    AppStrings.tellUsAboutYourself,
                    style: TextStyle(
                        fontSize: 17.5.sp, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              CountryDropdownCustom(
                  controller: addNewPropertyController.mobileNumberController),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: MyTextField(
                  labelText: AppStrings.isThereAnythingElse,
                  controller: addNewPropertyController.aboutController,
                ),
              ),
            ],
          ),
    ],
      ),
      bottomNavigationBar: CustomBlackButtton(
        buttonName: AppStrings.next,
        onTap: () { if (addNewPropertyController.mobileNumberController.text
                    .trim()
                    .isNotEmpty) {
                  addNewPropertyController.updateContact(
                    addNewPropertyController.selectedCountry['code'] +
                        addNewPropertyController.mobileNumberController.text,
                    addNewPropertyController.aboutController.text,
                  );

                  Navigator.pushNamed(context, '/anpSelectAmenities');
                } else {
                  CustomSnackbar.show(
                      title: AppStrings.missingFields,
                      message: AppStrings.fillAllFields);
                }},
      ),
    );
  }
}

class CountryDropdownCustom extends StatefulWidget {
  final TextEditingController controller;
  CountryDropdownCustom({required this.controller});

  @override
  _CountryDropdownCustomState createState() => _CountryDropdownCustomState();
}

class _CountryDropdownCustomState extends State<CountryDropdownCustom> {
  final AddNewPropertyController addNewPropertyController = Get.find();

  final List<Map<String, String>> countries = [
    {
      'name': 'Pakistan',
      'code': '+92',
      'image': 'assets/images/icons/pakistan.png'
    },
    {'name': 'India', 'code': '+91', 'image': 'assets/images/icons/india.png'},
    {'name': 'China', 'code': '+86', 'image': 'assets/images/icons/china.png'},
    {
      'name': 'Turkey',
      'code': '+90',
      'image': 'assets/images/icons/turkey.png'
    },
    {
      'name': 'Afghanistan',
      'code': '+93',
      'image': 'assets/images/icons/afghanistan.png'
    },
    {
      'name': 'Saudi Arabia',
      'code': '+966',
      'image': 'assets/images/icons/saudi-arabia.png'
    },
    {'name': 'Oman', 'code': '+968', 'image': 'assets/images/icons/oman.png'},
    {'name': 'Iran', 'code': '+98', 'image': 'assets/images/icons/iran.png'},
    {'name': 'Egypt', 'code': '+20', 'image': 'assets/images/icons/egypt.png'},
  ];

  String? selectedCountry = "Pakistan";
  String? selectedFlag = 'assets/images/icons/pakistan.png';
  String? countryCode = '+92';
  final GlobalKey _flagKey = GlobalKey();

  void _showCustomDropdown() async {
    final RenderBox renderBox =
        _flagKey.currentContext!.findRenderObject() as RenderBox;
    final Offset offset = renderBox.localToGlobal(Offset.zero);
    final Size size = renderBox.size;

    final selected = await showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(
        offset.dx,
        offset.dy + size.height,
        offset.dx + size.width,
        offset.dy,
      ),
      items: countries.map((country) {
        return PopupMenuItem<String>(
          value: country['name'],
          child: Container(
            color: Colors.transparent,
            child: Row(
              children: [
                Image.asset(country['image']!, scale: 14),
                SizedBox(width: 15),
                Text(country['name']!),
              ],
            ),
          ),
        );
      }).toList(),
      elevation: 4,
      color: Color(0xFFF4F5F6),
    );

    if (selected != null) {
      final matched = countries.firstWhere((c) => c['name'] == selected);
      setState(() {
        selectedCountry = matched['name'];
        selectedFlag = matched['image'];
        countryCode = matched['code'];

        addNewPropertyController.selectedCountry.value = {
          'name': matched['name'],
          'code': matched['code'],
          'image': matched['image'],
        };

        addNewPropertyController.printCountry();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        controller: widget.controller,
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          prefixIcon: GestureDetector(
            key: _flagKey,
            onTap: _showCustomDropdown,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  selectedFlag != null
                      ? CircleAvatar(
                          radius: 15,
                          backgroundImage: AssetImage(selectedFlag!),
                          backgroundColor: Colors.transparent,
                        )
                      : Icon(Icons.flag_outlined, size: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Icon(Icons.keyboard_arrow_down, size: 18),
                  ),
                  Text(countryCode!),
                ],
              ),
            ),
          ),
          hintText: 'Phone Number',
          filled: true,
          fillColor: Color(0xFFF4F5F6),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      ),
    );
  }
}
