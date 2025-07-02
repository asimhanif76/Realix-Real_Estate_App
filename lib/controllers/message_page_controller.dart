import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:realix_real_estate_app/model/message_model.dart';

class MessagePageController extends GetxController {
  TextEditingController messageController = TextEditingController();

  final scrollController = ScrollController();

  RxDouble turns = 0.0.obs;

  void rotareIcon() {
    // turns == 0.0 ? turns = 45.0.obs : turns = 0.0.obs;
    turns.value = (turns.value == 0.0) ? 0.125 : 0.0;
  }

  bool get isPopupVisible => turns.value != 0.0;

  RxList messageList = <MessageModel>[
    MessageModel(message: 'Hi', time: "10.30", isMe: false),
    MessageModel(message: 'How are you', time: "10.31", isMe: false),
  ].obs;

  void sendMessage({
    required String message,
    required bool isMe,
    required String imagePath,
  }) {
    if (message.trim().isNotEmpty) {
      messageList.add(
        MessageModel(
          message: message,
          time: getCurrentTime(),
          isMe: isMe,
        ),
      );
    } else if (imagePath.isNotEmpty) {
      messageList.add(
        MessageModel(
          time: getCurrentTime(),
          isMe: isMe,
          imagePath: imagePath,
          isImage: true,
        ),
      );
    }

    messageController.clear(); // clear after sending
    selectedImage.value = null; // reset selected image

    Future.delayed(Duration(milliseconds: 100), () {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          0.0,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  String getCurrentTime() {
    final now = DateTime.now();
    return "${now.hour}:${now.minute.toString().padLeft(2, '0')}";
  }

  var selectedImage = Rxn<XFile>();

  final ImagePicker _picker = ImagePicker();

  Future<void> pickImageFromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      selectedImage.value = image;
    }
  }

  Future<void> pickImageFromCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      selectedImage.value = image;
    }
  }
}
