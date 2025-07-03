import 'package:get/get.dart';
import 'package:realix_real_estate_app/model/buyer_model.dart';
import 'package:realix_real_estate_app/model/past_tour_model.dart';

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
  List<String> amenities;
  RxBool isFavourite;
  BuyerModel buyerModel;
  PastTourModel? pastTourModel;

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
    required this.buyerModel,
    this.pastTourModel
  }) : isFavourite = isFavourite.obs;
}
