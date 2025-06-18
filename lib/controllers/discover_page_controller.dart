import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DiscoverPageController extends GetxController {
  RxBool isSattelite = false.obs;
  RxBool isDraw = false.obs;
  RxInt bedCount = 2.obs;
  RxInt bathCount = 4.obs;

  // Filter Sheet Variables
  RxBool isForSale = true.obs;
  Rx<RangeValues> rangeValues = Rx<RangeValues>(RangeValues(200, 15000));

  // Optional: Method to update value
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
}
