import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:realix_real_estate_app/controllers/notification_page_controller.dart';
import 'package:realix_real_estate_app/widgets/page_heading_row.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NotificationPage extends StatelessWidget {
  NotificationPage({super.key});

  NotificationPageController notificationPageController =
      Get.put(NotificationPageController());

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: Column(
            children: [
              SizedBox(
                height: height * 0.04,
              ),
              PageHeadingRow(pageHeadingText: 'Notification'),
              SizedBox(
                height: height * 0.05,
              ),
              ListView.builder(
                padding: EdgeInsets.symmetric(
                  vertical: 20,
                ),
                shrinkWrap: true,
                physics: PageScrollPhysics(),
                itemCount: notificationPageController.notifications.length,
                itemBuilder: (context, index) {
                  var notification =
                      notificationPageController.notifications[index];
                  return _buildNotificationTile(height, notification);
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNotificationTile(double height, var notifcation) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 10),
      leading: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Color(0xFF274D710A)),
        child: SvgPicture.asset(
          notifcation.iconPath,
          fit: BoxFit.scaleDown,
        ),
      ),
      title: Text(
        notifcation.title,
        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
      ),
      subtitle: Text(
        notifcation.message,
        style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        softWrap: true,
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            notificationPageController.formatDayMonth(notifcation.date),
            // 'Date',
            style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w400,
                color: Colors.grey),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Icon(
            Icons.circle,
            size: 14.sp,
            color: Color(0xFF2FA2B9),
          ),
        ],
      ),
    );
  }
}
