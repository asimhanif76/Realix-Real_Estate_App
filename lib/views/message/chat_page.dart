import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realix_real_estate_app/commons/app_strings.dart';
import 'package:realix_real_estate_app/controllers/chat_page_controller.dart';
import 'package:realix_real_estate_app/controllers/message_page_controller.dart';
import 'package:realix_real_estate_app/model/message_model.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});

  ChatPageController chatPageController = Get.put(ChatPageController());
  MessagePageController messagePageController =
      Get.put(MessagePageController());

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFFFDFDFD),
      body: Column(
        children: [
          SizedBox(
            height: height * 0.05,
          ),
          Text(
            AppStrings.message,
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w800),
          ),
          Obx(
            () => ListView.separated(
              shrinkWrap: true,
              separatorBuilder: (context, index) => Divider(
                color: Colors.grey.shade200,
                indent: width * 0.05,
                endIndent: width * 0.05,
              ),
              itemCount: chatPageController.chatList.length,
              itemBuilder: (context, index) {
                return _buildMessageCard(width, height, index, () {
                  List<List<MessageModel>> predefinedMessages = [
                    // index 0
                    [
                      MessageModel(
                          message: "Good morning!",
                          time: "9:30 AM",
                          isMe: false,
                          isImage: false,
                          imagePath: ''),
                      MessageModel(
                          message: "Morning!",
                          time: "9:31 AM",
                          isMe: true,
                          isImage: false,
                          imagePath: ''),
                      MessageModel(
                          message: "How are you?",
                          time: "9:32 AM",
                          isMe: false,
                          isImage: false,
                          imagePath: ''),
                      MessageModel(
                          message: "I'm good, thanks!",
                          time: "9:33 AM",
                          isMe: true,
                          isImage: false,
                          imagePath: ''),
                    ],
                    // index 1
                    [
                      MessageModel(
                          message: "Are you coming today?",
                          time: "8:00 AM",
                          isMe: false,
                          isImage: false,
                          imagePath: ''),
                      MessageModel(
                          message: "Yes, around 11.",
                          time: "8:01 AM",
                          isMe: true,
                          isImage: false,
                          imagePath: ''),
                      MessageModel(
                          message: "Perfect!",
                          time: "8:02 AM",
                          isMe: false,
                          isImage: false,
                          imagePath: ''),
                    ],
                    // index 2
                    [
                      MessageModel(
                          message: "Check this out!",
                          time: "2:15 PM",
                          isMe: false,
                          isImage: false,
                          imagePath: ''),
                      MessageModel(
                          message: "Looks great",
                          time: "2:16 PM",
                          isMe: true,
                          isImage: false,
                          imagePath: ''),
                      MessageModel(
                          message: "Thanks!",
                          time: "2:17 PM",
                          isMe: false,
                          isImage: false,
                          imagePath: ''),
                    ],
                    // index 3
                    [
                      MessageModel(
                          message: "Hey, are you there?",
                          time: "11:00 AM",
                          isMe: false,
                          isImage: false,
                          imagePath: ''),
                      MessageModel(
                          message: "Yes, just busy.",
                          time: "11:01 AM",
                          isMe: true,
                          isImage: false,
                          imagePath: ''),
                      MessageModel(
                          message: "No worries!",
                          time: "11:02 AM",
                          isMe: false,
                          isImage: false,
                          imagePath: ''),
                    ],
                    // index 4
                    [
                      MessageModel(
                          message: "Let’s catch up today?",
                          time: "4:45 PM",
                          isMe: false,
                          isImage: false,
                          imagePath: ''),
                      MessageModel(
                          message: "Sure!",
                          time: "4:46 PM",
                          isMe: true,
                          isImage: false,
                          imagePath: ''),
                      MessageModel(
                          message: "7 PM?",
                          time: "4:47 PM",
                          isMe: false,
                          isImage: false,
                          imagePath: ''),
                      MessageModel(
                          message: "Works!",
                          time: "4:48 PM",
                          isMe: true,
                          isImage: false,
                          imagePath: ''),
                    ],
                    // index 5
                    [
                      MessageModel(
                          message: "Did you complete the task?",
                          time: "10:00 AM",
                          isMe: false,
                          isImage: false,
                          imagePath: ''),
                      MessageModel(
                          message: "Yes, submitting now.",
                          time: "10:01 AM",
                          isMe: true,
                          isImage: false,
                          imagePath: ''),
                      MessageModel(
                          message: "Good job!",
                          time: "10:02 AM",
                          isMe: false,
                          isImage: false,
                          imagePath: ''),
                    ],
                  ];

                  messagePageController.messageList.clear();

                  if (index < predefinedMessages.length) {
                    messagePageController.messageList
                        .addAll(predefinedMessages[index]);
                  } else {
                    messagePageController.messageList.add(
                      MessageModel(
                          time: '12:22 AM',
                          isMe: false,
                          imagePath: '',
                          isImage: false,
                          message: 'Default message'),
                    );
                  }

                  var message = chatPageController.chatList[index];
                  print(message.name);

                  Navigator.pushNamed(context, '/messagePage', arguments: {
                    'name': message.name,
                    'isOnline': message.isOnline,
                  });
                });
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _buildMessageCard(
      double width, double height, int index, VoidCallback ontap) {
    var message = chatPageController.chatList[index];
    return ListTile(
        contentPadding: EdgeInsets.symmetric(
            vertical: width * 0.01, horizontal: width * 0.05),
        onTap: ontap,
        leading: Stack(
          children: [
            CircleAvatar(
              radius: 20.sp,
              backgroundImage: AssetImage(message.imagePath),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: width * 0.04,
                height: width * 0.04,
                decoration: BoxDecoration(
                    border:
                        Border.all(color: Colors.white, width: width * 0.005),
                    color: message.isOnline ? Colors.green : Colors.grey,
                    shape: BoxShape.circle),
              ),
            ),
          ],
        ),
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  message.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16.5.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  message.time,
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey),
                )
              ],
            ),
            SizedBox(
              height: height * 0.015,
            ),
          ],
        ),
        subtitle: Text(
          message.message,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ));
  }
}
