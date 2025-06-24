import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realix_real_estate_app/model/product_model.dart';

class HomePageController extends GetxController {
  TextEditingController searchController = TextEditingController();

  RxList<ProductModel> ProductList = [
    ProductModel(
      name: 'Mighty Cinco Family',
      imagePath: [
        'assets/images/img.png',
        'assets/images/img2.png',
        'assets/images/property_image.png',
        'assets/images/img.png',
        'assets/images/property_image.png',
        'assets/images/img2.png'
      ],
      address: 'Jakarta, Indonesia',
      price: 436.0,
      isFavourite: false,
      description:
          'A spacious family apartment located in the heart of Jakarta. Cassablanca Ground is located in Malang City which is not far from the city center. This house was made in 2012 with a minimalist and modern architecture suitable for families.',
      fullBaths: 2,
      bedrooms: 3,
      lotSize: 2000.0,
      phoneNumber: '+62 812 3456 7890',
      amenities: [
        'Pool',
        'Gym',
        'Security',
        'WiFi',
        'CCTV',
        'Elevator',
      ],
    ),
    ProductModel(
      name: 'Cassablanca Ground',
      imagePath: [
        'assets/images/property_image.png',
        'assets/images/img2.png',
        'assets/images/img.png',
        'assets/images/property_image.png',
        'assets/images/img.png',
        'assets/images/img2.png'
      ],
      address: 'Russian Hill, 360 Lombard Street',
      price: 436.0,
      isFavourite: true,
      description:
          'Modern home with stylish interior and nearby public transport. ',
      fullBaths: 1,
      bedrooms: 2,
      lotSize: 1800.0,
      phoneNumber: '+62 812 1111 2222',
      amenities: [
        'Garden',
        'WiFi',
        'CCTV',
        'Elevator',
        'Community Hall',
        'Pool'
      ],
    ),
    ProductModel(
      name: 'Primary Apartment',
      imagePath: ['assets/images/property_image.png', 'assets/images/img2.png'],
      address: 'Mojosongo street no 123, 360',
      price: 436.0,
      isFavourite: false,
      description:
          'Comfortable house suitable for small families or couples. Cassablanca Ground is located in Malang City which is not far from the city center. This house was made in 2012 with a minimalist and modern architecture suitable for families.',
      fullBaths: 1,
      bedrooms: 2,
      lotSize: 1600.0,
      phoneNumber: '+62 813 9876 5432',
      amenities: [
        'Parking',
        'Pet Friendly',
        'Pool',
        'Gym',
        'Security',
        'Playground'
      ],
    ),
    ProductModel(
      name: 'Mighty Cinco Family',
      imagePath: [
        'assets/images/img2.png',
        'assets/images/property_image.png',
        'assets/images/img.png',
        'assets/images/img2.png',
        'assets/images/property_image.png',
        'assets/images/img.png'
      ],
      address: 'Jakarta, Indonesia',
      price: 436.0,
      isFavourite: false,
      description:
          'An elegant home offering a peaceful living experience. Cassablanca Ground is located in Malang City which is not far from the city center. This house was made in 2012 with a minimalist and modern architecture suitable for families.',
      fullBaths: 2,
      bedrooms: 4,
      lotSize: 2400.0,
      phoneNumber: '+62 814 2233 4455',
      amenities: [
        'Security',
        'Elevator',
        'Community Hall',
        'Pool',
        'Gym',
        'Playground'
      ],
    ),
  ].obs;
}
