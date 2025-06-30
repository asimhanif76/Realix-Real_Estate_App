import 'package:get/get.dart';
import 'package:realix_real_estate_app/model/user_model.dart';

class ProfilePageController extends GetxController {
  // RxList userProfile =<UserModel>[
  //   UserModel(userName: 'Andrew Preston', userImage: 'userImage', userEmail: 'andrew.hello@gmail.com')
  // ].obs;

  var user = UserModel(
      userName: 'Andrew Preston',
      userImage: 'assets/images/profile_image.png',
      userEmail: 'andrew.hello@gmail.com');

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
}
