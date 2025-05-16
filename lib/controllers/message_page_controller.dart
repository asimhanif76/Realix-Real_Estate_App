import 'package:get/get.dart';
import 'package:realix_real_estate_app/model/message_model.dart';

class MessagePageController extends GetxController {
  List<MessageModel> messageList = [
    MessageModel(
      imagePath: 'assets/images/user_profile_pic_1.png',
      name: 'Sara Ahmed',
      message: 'Hello! How are you?',
      time: '10:00 AM',
      isOnline: true,
    ),
    MessageModel(
      imagePath: 'assets/images/user_profile_pic_2.png',
      name: 'Ali Khan',
      message: 'Are you coming today?',
      time: '9:45 AM',
      isOnline: false,
    ),
    MessageModel(
      imagePath: 'assets/images/user_profile_pic_4.png',
      name: 'Fatima Noor',
      message: 'Check your email.',
      time: 'Yesterday',
      isOnline: true,
    ),
    MessageModel(
      imagePath: 'assets/images/user_profile_pic_3.png',
      name: 'Bilal Sheikh',
      message: 'I’ll call you later.',
      time: 'Tuesday',
      isOnline: false,
    ),
    MessageModel(
      imagePath: 'assets/images/user_profile_pic_5.png',
      name: 'Hamza Tariq',
      message: 'Thanks for the help!',
      time: 'Monday',
      isOnline: true,
    ),
  ];
}
