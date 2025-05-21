import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realix_real_estate_app/model/chat_model.dart';

class MessageChatPageController extends GetxController {
  TextEditingController messageController = TextEditingController();

  RxDouble turns = 0.0.obs;

  void rotareIcon() {
    // turns == 0.0 ? turns = 45.0.obs : turns = 0.0.obs;
    turns.value = (turns.value == 0.0) ? 0.125 : 0.0;
  }

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
}
