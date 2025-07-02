import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:realix_real_estate_app/model/user_model.dart';

class ProfilePageController extends GetxController {
  Rx<UserModel> user = UserModel(
          userName: 'Andrew Preston',
          userImage: 'assets/images/profile_image.png',
          userEmail: 'andrew.hello@gmail.com')
      .obs;

  List settingOptions = [
    {
      "svgImage": 'assets/images/svg/recently_view.svg',
      'title': 'Recentlty viewed',
    },
    {
      "svgImage": 'assets/images/svg/my_favourite.svg',
      'title': 'My favorites',
    },
    {
      "svgImage": 'assets/images/svg/past_tour.svg',
      'title': 'Past Tour',
    },
    {
      "svgImage": 'assets/images/svg/sell_my_home.svg',
      'title': 'Sell my home',
    },
    {
      "svgImage": 'assets/images/svg/my_listing.svg',
      'title': 'My listings ',
    },
    {
      "svgImage": 'assets/images/svg/settings.svg',
      'title': 'Settings',
    },
  ];

  var selectedImage = Rxn<XFile>();

  final ImagePicker _picker = ImagePicker();

  Future<void> pickImageFromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      selectedImage.value = image;
      user.update((val) {
        if (val != null) val.userImage = image.path;
      });
    }
  }

  Future<void> pickImageFromCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      selectedImage.value = image;
      user.update((val) {
        if (val != null) val.userImage = image.path;
      });
    }
  }

  // Edit Profile Controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void onInit() {
    nameController.text = user.value.userName;
    emailController.text = user.value.userEmail;
    super.onInit();
  }

  void updateUserModel() {
    user.update((val) {
      if (val != null) {
        if (nameController.text.trim().isNotEmpty) {
          val.userName = nameController.text.trim();
        }
        if (emailController.text.trim().isNotEmpty) {
          val.userEmail = emailController.text.trim();
        }
      }
    });
  }

 
}
