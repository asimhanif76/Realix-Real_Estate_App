import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realix_real_estate_app/commons/app_images.dart';

class ProductDetailPageController extends GetxController {
  List images = [
    AppImages.property_image,
    AppImages.property_image,
    AppImages.property_image,
    AppImages.property_image,
    AppImages.property_image,
    AppImages.property_image,
  ];

  RxInt currentImage = 1.obs;

  PageController pageController = PageController();
}
