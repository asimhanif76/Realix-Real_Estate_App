import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailPageController extends GetxController {

  
  @override
  void onInit() {
    currentImage.value = 0;

    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    currentImage.value = 0;
    super.onClose();
  }


  RxInt currentImage = 0.obs;

  PageController pageController = PageController();


}
