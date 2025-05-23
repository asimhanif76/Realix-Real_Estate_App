import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realix_real_estate_app/commons/app_strings.dart';
import 'package:realix_real_estate_app/controllers/chat_page_controller.dart';
import 'package:realix_real_estate_app/views/message/message_page.dart';
import 'package:realix_real_estate_app/widgets/page_heading_row.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});

  ChatPageController chatPageController = Get.put(ChatPageController());

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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.05),
            child: PageHeadingRow(pageHeadingText: AppStrings.message),
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
                return _buildMessageCard(
                  width,
                  height,
                  index,
                  () {
                    var message = chatPageController.chatList[index];
                    Navigator.pushNamed(context, '/messagePage', arguments: {
                      'name': message.name,
                      'isOnline': message.isOnline,
                    });
                    // Get.to(MessagePage(
                    //   name: message.name,
                    //   isOnline: message.isOnline,
                    // ));
                  },
                );
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
