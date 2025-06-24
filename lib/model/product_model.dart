import 'package:get/get.dart';

class ProductModel {
  String name;
  List<String> imagePath;
  String address;
  double price;
  String description;
  int fullBaths;
  int bedrooms;
  double lotSize;
  String phoneNumber;
  RxBool isFavourite;
  List<String> amenities;

  ProductModel({
    required this.name,
    required this.imagePath,
    required this.address,
    required this.price,
    required this.description,
    required this.fullBaths,
    required this.bedrooms,
    required this.lotSize,
    required this.phoneNumber,
    required this.amenities,
    required bool isFavourite,
  }) : isFavourite = isFavourite.obs;
}
