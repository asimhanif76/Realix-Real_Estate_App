import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realix_real_estate_app/commons/app_images.dart';

class DiscoverPageController extends GetxController {
  // RxBool isReadOnly = true.obs;

  TextEditingController minSquareFeetController = TextEditingController();
  TextEditingController maxSquareFeetController = TextEditingController();
  TextEditingController minLotSizeController = TextEditingController();
  TextEditingController maxLotSizeController = TextEditingController();

  RxBool isSattelite = false.obs;
  RxBool isDraw = false.obs;
  RxInt bedCount = 2.obs;
  RxInt bathCount = 4.obs;

  // Filter Sheet Variables
  RxBool isForSale = true.obs;
  Rx<RangeValues> rangeValues = Rx<RangeValues>(RangeValues(200, 15000));

  void updateRange(RangeValues newRange) {
    rangeValues.value = newRange;
  }

  List propertyType = [
    'Home',
    'Villa',
    'Breakfast Included',
    'Townhouse',
    'Condo'
  ];
  RxList selectedPropertyType = <String>[].obs;
  RxList selectedAmmenities = <String>[].obs;

  void resetOnTap() {
    rangeValues.value = RangeValues(0, 20000);

    bedCount.value = 0;
    bathCount.value = 0;
    minSquareFeetController.clear();
    maxSquareFeetController.clear();
    minLotSizeController.clear();
    maxLotSizeController.clear();
    selectedPropertyType.clear();
    selectedAmmenities.clear();
  }

  void applyOnTap() {
    print("For Sale: ${isForSale.value}");
    print("Applied Filters:");
    print("Bed Count: ${bedCount.value}");
    print("Bath Count: ${bathCount.value}");
    print("Price Range: ${rangeValues.value.start} - ${rangeValues.value.end}");
    print("Selected Property Types: $selectedPropertyType");
    print("Selected Amenities: $selectedAmmenities");
    print("Min Square Feet: ${minSquareFeetController.text}");
    print("Max Square Feet: ${maxSquareFeetController.text}");
    print("Min Lot Size: ${minLotSizeController.text}");
    print("Max Lot Size: ${maxLotSizeController.text}");

    Get.back();
  }

    TextEditingController searchController = TextEditingController();
     RxString searchText = ''.obs;

  @override
  void onInit() {
    super.onInit();
    // Listen to the text controller
    searchController.addListener(() {
      searchText.value = searchController.text;
    });
  }

  // Optional: dispose controller if needed
  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }


  List searchResult = [
    {
      'name': 'Mighty Cinco Family',
      'address': '360 Stillwater Rd troutman',
      'imagePath': AppImages.property_image,
    },
    {
      'name': 'Cassablanca Ground',
      'address': 'Russian Hill, 360 Lombard Street',
      'imagePath': AppImages.img,
    },
    {
      'name': 'Primary Apartment',
      'address': 'Mojosongo street no 123, 360',
      'imagePath': AppImages.img2,
    },
  ];
}
