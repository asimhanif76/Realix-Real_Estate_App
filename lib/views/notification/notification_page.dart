import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:realix_real_estate_app/controllers/notification_page_controller.dart';
import 'package:realix_real_estate_app/model/notification_model.dart';
import 'package:realix_real_estate_app/widgets/page_heading_row.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:grouped_list/grouped_list.dart';

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
                height: height * 0.01,
              ),
              GroupedListView<NotificationModel, String>(
                padding: EdgeInsets.all(0),
                elements: notificationPageController.notifications,
                groupBy: (notification) =>
                    notificationPageController.getGroupTitle(notification.date),
                groupSeparatorBuilder: (String groupByValue) => Padding(    
                  padding: const EdgeInsets.only(top: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      groupByValue,
                      style: TextStyle(
                          fontSize: 17.sp, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                itemBuilder: (context, notification) =>
                    _buildNotificationTile(context, height, notification),
                itemComparator: (item1, item2) =>
                    item2.date.compareTo(item1.date),
                useStickyGroupSeparators: true,
                floatingHeader: true,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNotificationTile(
      BuildContext context, double height, NotificationModel notification) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 10),
      leading: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Color(0xFF274D710A)),
        child: SvgPicture.asset(
          notification.iconPath,
          fit: BoxFit.scaleDown,
        ),
      ),
      title: Text(
        notification.title,
        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
      ),
      subtitle: Text(
        notification.message,
        style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            notificationPageController.formatDayMonth(notification.date),
            style: TextStyle(fontSize: 15.sp, color: Colors.grey),
          ),
          SizedBox(height: height * 0.02),
          Icon(Icons.circle, size: 14.sp, color: Color(0xFF2FA2B9)),
        ],
      ),
    );
  }
}
