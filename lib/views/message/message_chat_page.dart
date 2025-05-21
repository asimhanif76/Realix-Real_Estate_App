import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:realix_real_estate_app/commons/app_images.dart';
import 'package:realix_real_estate_app/commons/app_strings.dart';
import 'package:realix_real_estate_app/controllers/message_chat_page_controller.dart';
import 'package:realix_real_estate_app/widgets/my_text_field.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MessageChatPage extends StatelessWidget {
  String name;
  bool isOnline;
  MessageChatPage({super.key, required this.name, required this.isOnline});

  MessageChatPageController messageChatPageController =
      Get.put(MessageChatPageController());

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFFFCFCFD),
      body: Column(
        children: [
          SizedBox(
            height: height * 0.04,
          ),
          ListTile(
            leading: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_rounded,
                    size: 18.sp,
                  )),
            ),
            title: Text(
              name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            subtitle: isOnline
                ? Text(
                    AppStrings.online,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.green),
                  )
                : null,
            trailing: Container(
              width: width * 0.3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _mycircleAvatar(AppImages.video_call),
                  SizedBox(
                    width: width * 0.03,
                  ),
                  _mycircleAvatar(AppImages.audio_call),
                ],
              ),
            ),
          ),
          Divider(),
          Expanded(
            child: Obx(
              () => ListView.separated(
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.04, vertical: width * 0.02),
                separatorBuilder: (context, index) => SizedBox(
                  height: height * 0.005,
                ),
                itemCount: messageChatPageController.chatList.length,
                itemBuilder: (context, index) {
                  final chat = messageChatPageController.chatList[index];

                  return Align(
                    alignment: chat.isMe
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: chat.isMe
                          ? CrossAxisAlignment.end
                          : CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: width * 0.015),
                          padding: EdgeInsets.symmetric(
                              horizontal: width * 0.03, vertical: width * 0.02),
                          constraints: BoxConstraints(
                              maxWidth:
                                  MediaQuery.of(context).size.width * 0.7),
                          decoration: BoxDecoration(
                              color: chat.isMe
                                  ? Colors.black
                                  : Colors.grey.shade300,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(
                                      chat.isMe ? width * 0.05 : 0.0),
                                  bottomRight: Radius.circular(width * 0.05),
                                  topLeft: Radius.circular(width * 0.05),
                                  topRight: Radius.circular(
                                      chat.isMe ? 0.0 : width * 0.05))),
                          child: Text(
                            chat.message,
                            style: TextStyle(
                              color: chat.isMe ? Colors.white : Colors.black,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Text(
                          chat.time,
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          _buildMessagetextField(height, width, () {
            messageChatPageController.sendMessage(
              message: messageChatPageController.messageController.text,
              isMe: true,
            );
          })
        ],
      ),
    );
  }

  Widget _buildMessagetextField(
      double height, double width, VoidCallback onTap) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.05, vertical: height * 0.02),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: width * 0.02),
              decoration: BoxDecoration(
                color: Color(0xFFF4F5F6),
                borderRadius: BorderRadius.all(
                  Radius.circular(width * 0.04),
                ),
              ),
              child: Center(
                child: TextField(
                  controller: messageChatPageController.messageController,
                  maxLines: 3,
                  minLines: 1,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Obx(
                      () => AnimatedRotation(
                          turns: messageChatPageController.turns.value,
                          duration: Duration(milliseconds: 600),
                          child: IconButton(
                              onPressed: () {
                                messageChatPageController.rotareIcon();
                              },
                              icon: Icon(
                                Icons.add_circle_outlined,
                                color:
                                    messageChatPageController.turns.value == 0.0
                                        ? Colors.grey
                                        : Colors.black,
                              ))),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.camera_alt,
                        color: Colors.grey,
                      ),
                    ),
                    hintText: AppStrings.writeMessage,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: width * 0.03,
          ),
          GestureDetector(
            onTap: onTap,
            child: Container(
              height: height * 0.07,
              width: height * 0.07,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(width * 0.05),
                  color: Colors.black),
              child: SvgPicture.asset(
                AppImages.send,
                fit: BoxFit.scaleDown,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget _popupOptions() {
  //   return Container(
  //     margin: EdgeInsets.only(bottom: 8),
  //     padding: EdgeInsets.symmetric(vertical: 4),
  //     decoration: BoxDecoration(
  //       color: Colors.black,
  //       borderRadius: BorderRadius.circular(12),
  //     ),
  //     child: Column(
  //       children: [
  //         IconButton(
  //           onPressed: () {
  //             // Gallery action
  //           },
  //           icon: Icon(Icons.insert_drive_file, color: Colors.white, size: 20),
  //         ),
  //         IconButton(
  //           onPressed: () {
  //             // Location action
  //           },
  //           icon: Icon(Icons.location_on, color: Colors.white, size: 20),
  //         ),
  //         IconButton(
  //           onPressed: () {
  //             // Camera action
  //           },
  //           icon: Icon(Icons.camera_alt, color: Colors.white, size: 20),
  //         ),
  //       ],
  //     ),
  //   );
  // }


  Widget _mycircleAvatar(String svgPath) {
    return CircleAvatar(
      backgroundColor: Color(0xFFF4F5F6),
      radius: 20.sp,
      child: SvgPicture.asset(svgPath),
    );
  }
}
