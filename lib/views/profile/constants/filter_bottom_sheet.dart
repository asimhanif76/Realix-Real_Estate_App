import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realix_real_estate_app/controllers/add_new_property_controller.dart';
import 'package:realix_real_estate_app/controllers/discover_page_controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FilterBottomSheet extends StatelessWidget {
  FilterBottomSheet({super.key});

  DiscoverPageController discoverPageController =
      Get.put(DiscoverPageController());

  AddNewPropertyController addNewPropertyController =
      Get.put(AddNewPropertyController());

  TextEditingController minSquareFeetController = TextEditingController();
  TextEditingController maxSquareFeetController = TextEditingController();
  TextEditingController minLotSizeController = TextEditingController();
  TextEditingController maxLotSizeController = TextEditingController();

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
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _forSale_forRent(width, height),
                  SizedBox(height: height * 0.02),
                  _PriceRange(width, height),
                  _features(width, height),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  _propertyFacts(width, height),
                  SizedBox(
                    height: width * 0.06,
                  ),
                  _propertyType(width, height),
                  SizedBox(
                    height: width * 0.06,
                  ),
                  _ammenities(
                    width,
                    height,
                    infoOnTap: () {},
                    seeMoreOnTap: () {},
                  ),
                  SizedBox(
                    height: width * 0.06,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _ammenities(
    double width,
    double height, {
    required VoidCallback infoOnTap,
    required VoidCallback seeMoreOnTap,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Ammentities",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17.sp,
                  color: Colors.black,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                child: GestureDetector(
                  onTap: infoOnTap,
                  child: CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 209, 241, 247),
                    radius: 12.sp,
                    child: Text(
                      "!",
                      style: TextStyle(fontSize: 12, color: Color(0xFF2FA2B9)),
                    ),
                  ),
                ),
              )
            ],
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
          SizedBox(
            height: width * 0.03,
          ),
          InkWell(
            onTap: seeMoreOnTap,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "See More  ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17.sp,
                    color: Color(0xFF2FA2B9),
                  ),
                ),
                Icon(
                  Icons.arrow_forward,
                  color: Color(0xFF2FA2B9),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _propertyType(double width, double height) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Property Type",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17.sp,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: width * 0.03,
          ),
          Obx(
            () => Align(
              alignment: Alignment.topLeft,
              child: Wrap(
                spacing: 10,
                children: discoverPageController.propertyType.map((type) {
                  var isSelected = discoverPageController.selectedPropertyType
                      .contains(type);
                  return ChoiceChip(
                    label: Text(type),
                    selected: isSelected,
                    onSelected: (value) {
                      if (value) {
                        discoverPageController.selectedPropertyType.add(type);
                      } else {
                        discoverPageController.selectedPropertyType
                            .remove(type);
                      }
                    },
                    showCheckmark: false,
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: isSelected ? Colors.black : Colors.grey.shade300,
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
            ),
          ),
        ],
      ),
    );
  }

  Widget _propertyFacts(double width, double height) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Property Facts",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17.sp,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: height * 0.005,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: width * 0.03),
            child: Text(
              'Square Feet',
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
            ),
          ),
          Row(
            children: [
              _customField(
                  width: width,
                  controller: minSquareFeetController,
                  hintText: 'Min'),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                child: Container(
                  width: width * 0.06,
                  height: 4,
                  color: Color(0xFFE6E8EC),
                ),
              ),
              _customField(
                  width: width,
                  controller: maxSquareFeetController,
                  hintText: 'Max'),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: width * 0.03),
            child: Text(
              'Lot Size',
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
            ),
          ),
          Row(
            children: [
              _customField(
                  width: width,
                  controller: minLotSizeController,
                  hintText: 'Min'),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                child: Container(
                  width: width * 0.06,
                  height: 4,
                  color: Color(0xFFE6E8EC),
                ),
              ),
              _customField(
                  width: width,
                  controller: maxLotSizeController,
                  hintText: 'Max'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _customField(
      {required double width,
      required TextEditingController controller,
      required String hintText}) {
    return Expanded(
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFFE6E8EC),
              ),
              borderRadius: BorderRadius.circular(width * 0.04),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFFE6E8EC),
              ),
              borderRadius: BorderRadius.circular(width * 0.04),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFFE6E8EC),
              ),
              borderRadius: BorderRadius.circular(width * 0.04),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFFE6E8EC),
              ),
              borderRadius: BorderRadius.circular(width * 0.04),
            ),
            hintText: hintText,
            hintStyle: TextStyle(color: Color(0xFF777E90)),
            suffixIcon: Icon(
              Icons.keyboard_arrow_down,
              color: Color(0xFF777E90),
            )),
      ),
    );
  }

  Widget _features(double width, double height) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.05, vertical: height * 0.01),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Features",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17.sp,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Beds',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      if (discoverPageController.bedCount.value > 0) {
                        discoverPageController.bedCount.value -= 1;
                      }
                    },
                    child: CircleAvatar(
                      radius: 15.sp,
                      backgroundColor: Color(0xFFE6E8EC),
                      child: Icon(
                        Icons.remove,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                    child: Obx(() => Text(
                          "${discoverPageController.bedCount.value}",
                          style: TextStyle(fontSize: 16.sp),
                        )),
                  ),
                  GestureDetector(
                    onTap: () {
                      discoverPageController.bedCount.value += 1;
                    },
                    child: CircleAvatar(
                      radius: 15.sp,
                      backgroundColor: Colors.black,
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Beds',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      if (discoverPageController.bathCount.value > 0) {
                        discoverPageController.bathCount.value -= 1;
                      }
                    },
                    child: CircleAvatar(
                      radius: 15.sp,
                      backgroundColor: Color(0xFFE6E8EC),
                      child: Icon(
                        Icons.remove,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                    child: Obx(() => Text(
                          "${discoverPageController.bathCount.value}",
                          style: TextStyle(fontSize: 16.sp),
                        )),
                  ),
                  GestureDetector(
                    onTap: () {
                      discoverPageController.bathCount.value += 1;
                    },
                    child: CircleAvatar(
                      radius: 15.sp,
                      backgroundColor: Colors.black,
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _PriceRange(double width, double height) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Price Range",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17.sp,
                  color: Colors.black,
                ),
              ),
              Obx(
                () => Text(
                  "\$${discoverPageController.rangeValues.value.start.toInt()} - \$${discoverPageController.rangeValues.value.end.toInt()}",
                  style: TextStyle(
                    color: Color(0xFF2FA2B9),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: height * 0.01),
        Obx(
          () => RangeSlider(
            values: discoverPageController.rangeValues.value,
            min: 0,
            max: 20000,
            divisions: 200,
            activeColor: Colors.black,
            inactiveColor: Colors.grey.shade300,
            onChanged: (value) {
              discoverPageController.rangeValues.value = value;
            },
          ),
        ),
      ],
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
            color: Color(0xFFF9FAFB)),
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

class PriceRangeSlider extends StatefulWidget {
  @override
  _PriceRangeSliderState createState() => _PriceRangeSliderState();
}

class _PriceRangeSliderState extends State<PriceRangeSlider> {
  RangeValues _rangeValues = RangeValues(200, 15000);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Top Text Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Price Range",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Color(0xFF141416),
              ),
            ),
            Text(
              "\$${_rangeValues.start.toInt()} - \$${_rangeValues.end.toInt()}",
              style: TextStyle(
                color: Color(0xFF2FA2B9),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        SizedBox(height: 20),

        // Slider
        RangeSlider(
          values: _rangeValues,
          min: 0,
          max: 20000,
          divisions: 200,
          onChanged: (values) {
            setState(() {
              _rangeValues = values;
            });
          },
          activeColor: Colors.black,
          inactiveColor: Color(0xFFE6E8EC),
        ),
      ],
    );
  }
}
