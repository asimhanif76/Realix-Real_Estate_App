import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:realix_real_estate_app/commons/app_images.dart';
import 'package:realix_real_estate_app/commons/app_strings.dart';
import 'package:realix_real_estate_app/controllers/message_chat_page_controller.dart';
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
          _headingRow(width),
          Divider(),
          Expanded(
            child: Stack(
              children: [
                Obx(() => ListView.separated(
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
                                margin: EdgeInsets.symmetric(
                                    vertical: width * 0.015),
                                padding: EdgeInsets.symmetric(
                                    horizontal: width * 0.03,
                                    vertical: width * 0.02),
                                constraints:
                                    BoxConstraints(maxWidth: width * 0.7),
                                decoration: BoxDecoration(
                                    color: chat.isMe
                                        ? Colors.black
                                        : Colors.grey.shade300,
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(
                                            chat.isMe ? width * 0.05 : 0.0),
                                        bottomRight:
                                            Radius.circular(width * 0.05),
                                        topLeft: Radius.circular(width * 0.05),
                                        topRight: Radius.circular(
                                            chat.isMe ? 0.0 : width * 0.05))),
                                child: Text(
                                  chat.message,
                                  style: TextStyle(
                                    color:
                                        chat.isMe ? Colors.white : Colors.black,
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
                    )),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: _buildMessagetextField(height, width, () {
                    messageChatPageController.sendMessage(
                      message: messageChatPageController.messageController.text,
                      isMe: true,
                    );
                  }),
                ),
                Obx(() => messageChatPageController.isPopupVisible
                    ? Positioned(
                        left: width * 0.05,
                        bottom: width * 0.18,
                        child: Stack(
                          children: [
                            _popupOptions(),
                            Positioned(
                              bottom: 4,
                              left: 0,
                              right: 0,
                              child: CircleAvatar(
                                radius: 10.sp,
                                backgroundColor: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      )
                    : SizedBox()),
                Positioned(
                  left: width * 0.05,
                  bottom: width * 0.2,
                  child: Obx(() {
                    return messageChatPageController.selectedImage.value != null
                        ? Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Stack(
                              children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  height: 120,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      border: Border.all(),
                                      borderRadius:
                                          BorderRadius.circular(width * 0.05),
                                      image: DecorationImage(
                                          image: FileImage(File(
                                              messageChatPageController
                                                  .selectedImage
                                                  .value!
                                                  .path)))),
                                ),
                                Positioned(
                                    right: 5,
                                    top: 5,
                                    child: InkWell(
                                      onTap: () {
                                        messageChatPageController
                                            .selectedImage.value = null;
                                      },
                                      child: CircleAvatar(
                                          radius: 15.sp,
                                          backgroundColor: Colors.grey.shade400,
                                          child: Icon(Icons.close)),
                                    ))
                              ],
                            ),
                          )
                        : SizedBox();
                  }),
                ),
              ],
            ),
          ),
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
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: width * 0.02),
              decoration: BoxDecoration(
                color: Color(0xFFF4F5F6),
                borderRadius: BorderRadius.circular(width * 0.04),
              ),
              child: TextField(
                controller: messageChatPageController.messageController,
                maxLines: 3,
                minLines: 1,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Obx(() => AnimatedRotation(
                        turns: messageChatPageController.turns.value,
                        duration: Duration(milliseconds: 600),
                        child: IconButton(
                          onPressed: () {
                            messageChatPageController.rotareIcon();
                          },
                          icon: Icon(
                            Icons.add_circle_outlined,
                            color: messageChatPageController.turns.value == 0.0
                                ? Colors.grey
                                : Colors.black,
                          ),
                        ),
                      )),
                  suffixIcon: IconButton(
                      onPressed: () {
                        messageChatPageController.pickImageFromGallery();
                      },
                      icon: Icon(Icons.camera_alt, color: Colors.grey)),
                  hintText: AppStrings.writeMessage,
                ),
              ),
            ),
          ),
          SizedBox(width: width * 0.03),
          GestureDetector(
            onTap: onTap,
            child: Container(
              height: height * 0.07,
              width: height * 0.07,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(width * 0.05),
                color: Colors.black,
              ),
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

  Widget _popupOptions() {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          IconButton(
            onPressed: () {
              print('object 1 Pressed');
            },
            icon: SvgPicture.asset(
              AppImages.document,
              fit: BoxFit.scaleDown,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {
              print('object 2 Pressed');
            },
            icon: SvgPicture.asset(AppImages.location, fit: BoxFit.scaleDown),
          ),
          IconButton(
            onPressed: () {
              print('object 3 Pressed');
              messageChatPageController.pickImageFromCamera();
            },
            icon: SvgPicture.asset(AppImages.camera, fit: BoxFit.scaleDown),
          ),
        ],
      ),
    );
  }

  Widget _headingRow(double width) {
    return ListTile(
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
    );
  }

  Widget _mycircleAvatar(String svgPath) {
    return CircleAvatar(
      backgroundColor: Color(0xFFF4F5F6),
      radius: 20.sp,
      child: SvgPicture.asset(svgPath),
    );
  }
}
