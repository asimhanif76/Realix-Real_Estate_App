import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realix_real_estate_app/commons/app_images.dart';
import 'package:realix_real_estate_app/model/buyer_model.dart';
import 'package:realix_real_estate_app/model/past_tour_model.dart';
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
      price: 1900.00,
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
      buyerModel: BuyerModel(
          buyerName: 'Diana Richards',
          imagePath: AppImages.profile_image,
          companyName: 'Rich Capital Properties LLC',
          rating: 4.8,
          ratingCount: 9,
          about:
              'Diana Richards is a third-generation realtor and Bay Area native who has lived in LA since 2015. She guides her clients through the City and...',
          homesClosed: 25,
          experience: '5+ years',
          condos: '12+',
          apartments: '10+',
          phoneNumber: '03001234567'),
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
      price: 1836.0,
      isFavourite: true,
      description:
          'Modern home with stylish interior and nearby public transport. A spacious family apartment located in the heart of Jakarta. Cassablanca Ground is located in Malang City which is not far from the city center. This house was made in 2012 with a minimalist and modern architecture suitable for families. ',
      fullBaths: 1,
      bedrooms: 2,
      lotSize: 1800.00,
      phoneNumber: '+62 812 1111 2222',
      amenities: [
        'Garden',
        'WiFi',
        'CCTV',
        'Elevator',
        'Community Hall',
        'Pool'
      ],
      buyerModel: BuyerModel(
          buyerName: 'Diana Richards',
          imagePath: AppImages.profile_image,
          companyName: 'Rich Capital Properties LLC',
          rating: 4.8,
          ratingCount: 9,
          about:
              'Diana Richards is a third-generation realtor and Bay Area native who has lived in LA since 2015. She guides her clients through the City and...',
          homesClosed: 25,
          experience: '5+ years',
          condos: '12+',
          apartments: '10+',
          phoneNumber: '03001234567'),
    ),
    ProductModel(
      name: 'Primary Apartment',
      imagePath: ['assets/images/property_image.png', 'assets/images/img2.png'],
      address: 'Mojosongo street no 123, 360',
      price: 2620.0,
      isFavourite: false,
      description:
          'Comfortable house suitable for small families or couples. Cassablanca Ground is located in Malang City which is not far from the city center. This house was made in 2012 with a minimalist and modern architecture suitable for families.',
      fullBaths: 1,
      bedrooms: 2,
      lotSize: 1600.00,
      phoneNumber: '+62 813 9876 5432',
      amenities: [
        'Parking',
        'Pet Friendly',
        'Pool',
        'Gym',
        'Security',
        'Playground'
      ],
      buyerModel: BuyerModel(
          buyerName: 'Diana Richards',
          imagePath: AppImages.profile_image,
          companyName: 'Rich Capital Properties LLC',
          rating: 4.8,
          ratingCount: 9,
          about:
              'Diana Richards is a third-generation realtor and Bay Area native who has lived in LA since 2015. She guides her clients through the City and...',
          homesClosed: 25,
          experience: '5+ years',
          condos: '12+',
          apartments: '10+',
          phoneNumber: '03001234567'),
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
      price: 1906.00,
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
      buyerModel: BuyerModel(
          buyerName: 'Diana Richards',
          imagePath: AppImages.profile_image,
          companyName: 'Rich Capital Properties LLC',
          rating: 4.8,
          ratingCount: 9,
          about:
              'Diana Richards is a third-generation realtor and Bay Area native who has lived in LA since 2015. She guides her clients through the City and...',
          homesClosed: 25,
          experience: '5+ years',
          condos: '12+',
          apartments: '10+',
          phoneNumber: '03001234567'),
    ),
  ].obs;

  RxList<ProductModel> productWithTour = [
    ProductModel(
      pastTourModel: PastTourModel(
          date: 'Mon, Apr 4, ',
          time: '10:00 AM to 10:45 AM',
          status: 'Canceled',
          message:
              'You can request another tour anytime, if you have questions please contact your agent'),
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
      price: 1836.0,
      isFavourite: true,
      description:
          'Modern home with stylish interior and nearby public transport. A spacious family apartment located in the heart of Jakarta. Cassablanca Ground is located in Malang City which is not far from the city center. This house was made in 2012 with a minimalist and modern architecture suitable for families. ',
      fullBaths: 1,
      bedrooms: 2,
      lotSize: 1800.00,
      phoneNumber: '+62 812 1111 2222',
      amenities: [
        'Garden',
        'WiFi',
        'CCTV',
        'Elevator',
        'Community Hall',
        'Pool'
      ],
      buyerModel: BuyerModel(
          buyerName: 'Diana Richards',
          imagePath: AppImages.profile_image,
          companyName: 'Rich Capital Properties LLC',
          rating: 4.8,
          ratingCount: 9,
          about:
              'Diana Richards is a third-generation realtor and Bay Area native who has lived in LA since 2015. She guides her clients through the City and...',
          homesClosed: 25,
          experience: '5+ years',
          condos: '12+',
          apartments: '10+',
          phoneNumber: '03001234567'),
    ),
    ProductModel(
      pastTourModel: PastTourModel(
          date: 'Mon, Apr 4, ',
          time: '10:00 AM to 10:45 AM',
          status: 'Completed',
          message:
              'You can request another tour anytime, if you have questions please contact your agent'),
      name: 'Primary Apartment',
      imagePath: ['assets/images/property_image.png', 'assets/images/img2.png'],
      address: 'Mojosongo street no 123, 360',
      price: 2620.0,
      isFavourite: false,
      description:
          'Comfortable house suitable for small families or couples. Cassablanca Ground is located in Malang City which is not far from the city center. This house was made in 2012 with a minimalist and modern architecture suitable for families.',
      fullBaths: 1,
      bedrooms: 2,
      lotSize: 1600.00,
      phoneNumber: '+62 813 9876 5432',
      amenities: [
        'Parking',
        'Pet Friendly',
        'Pool',
        'Gym',
        'Security',
        'Playground'
      ],
      buyerModel: BuyerModel(
          buyerName: 'Diana Richards',
          imagePath: AppImages.profile_image,
          companyName: 'Rich Capital Properties LLC',
          rating: 4.8,
          ratingCount: 9,
          about:
              'Diana Richards is a third-generation realtor and Bay Area native who has lived in LA since 2015. She guides her clients through the City and...',
          homesClosed: 25,
          experience: '5+ years',
          condos: '12+',
          apartments: '10+',
          phoneNumber: '03001234567'),
    ),
  ].obs;

  // Past Tour Page
}
