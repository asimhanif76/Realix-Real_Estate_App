import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MessageChatPage extends StatelessWidget {
  const MessageChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: height * 0.05,
          ),
          Container(
            width: 100,
            height: 50,
            color: Colors.amber,
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
              'Russia',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            subtitle: Text(
              'Online',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
            trailing: Container(
              width: width * 0.3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _mycircleAvatar(Icon(Icons.video_call)),
                  SizedBox(
                    width: width * 0.03,
                  ),
                  _mycircleAvatar(Icon(Icons.call)),
                ],
              ),
            ),
          ),
          Divider()
        ],
      ),
    );
  }

  Widget _mycircleAvatar(Icon icon) {
    return CircleAvatar(
      radius: 20.sp,
      child: icon,
    );
  }
}
