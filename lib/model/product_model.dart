import 'package:get/get.dart';

class ProductModel {
  String name;
  String imagePath;
  String address;
  double price;
  RxBool isFavourite;
  ProductModel(
      {required this.name,
      required this.imagePath,
      required this.address,
      required this.price,
      required bool isFavourite})
      : isFavourite = isFavourite.obs;
}
