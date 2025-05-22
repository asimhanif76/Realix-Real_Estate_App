import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:realix_real_estate_app/model/chat_model.dart';

class MessageChatPageController extends GetxController {
  TextEditingController messageController = TextEditingController();

  RxDouble turns = 0.0.obs;

  void rotareIcon() {
    // turns == 0.0 ? turns = 45.0.obs : turns = 0.0.obs;
    turns.value = (turns.value == 0.0) ? 0.125 : 0.0;
  }

  bool get isPopupVisible => turns.value != 0.0;

  RxList chatList = <ChatModel>[
    ChatModel(message: 'Hi', time: "10.30", isMe: false),
    ChatModel(message: 'How are you', time: "10.31", isMe: false),
  ].obs;

  void sendMessage({required String message, required bool isMe}) {
    if (message.trim().isEmpty) return;

    chatList.add(
      ChatModel(
        message: message,
        time: getCurrentTime(),
        isMe: isMe,
      ),
    );

    messageController.clear(); // clear the field after sending
  }

  String getCurrentTime() {
    final now = DateTime.now();
    return "${now.hour}:${now.minute.toString().padLeft(2, '0')}";
  }


   var selectedImage = Rxn<XFile>(); // Rxn ka matlab null bhi ho sakta hai

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
