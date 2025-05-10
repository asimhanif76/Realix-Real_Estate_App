import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realix_real_estate_app/model/product_model.dart';

class HomePageController extends GetxController {
  TextEditingController searchController = TextEditingController();

  RxList<ProductModel> ProductList = [
    ProductModel(
        name: 'Mighty Cinco Family',
        imagePath: 'assets/images/img.png',
        address: 'Jakarta, Indonesia',
        price: 436,
        isFavourite: false),
    ProductModel(
        name: 'Mighty Cinco Family',
        imagePath: 'assets/images/img2.png',
        address: 'Jakarta, Indonesia',
        price: 436,
        isFavourite: true),
    ProductModel(
        name: 'Mighty Cinco Family',
        imagePath: 'assets/images/img.png',
        address: 'Jakarta, Indonesia',
        price: 436,
        isFavourite: false),
    ProductModel(
        name: 'Mighty Cinco Family',
        imagePath: 'assets/images/img2.png',
        address: 'Jakarta, Indonesia',
        price: 436,
        isFavourite: false),
  ].obs;
}
