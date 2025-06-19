import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  List searchResult = [
    
  ];
}
