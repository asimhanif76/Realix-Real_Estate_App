import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:realix_real_estate_app/commons/app_images.dart';
import 'package:realix_real_estate_app/commons/app_strings.dart';
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
      body: Obx(
        () => notificationPageController.notifications.isEmpty
            ? _emptyNotificationPage(width, height)
            : SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: height * 0.04,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                        child: PageHeadingRow(
                            pageHeadingText: AppStrings.notification),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      SlidableAutoCloseBehavior(
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: width * 0.05),
                          child: GroupedListView<NotificationModel, String>(
                            padding:
                                EdgeInsets.symmetric(horizontal: width * 0.0),
                            elements: notificationPageController.notifications,
                            groupBy: (notification) =>
                                notificationPageController
                                    .getGroupTitle(notification.date),
                            groupSeparatorBuilder: (String groupByValue) =>
                                Padding(
                              padding: EdgeInsets.only(
                                top: height * 0.03,
                              ),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  groupByValue,
                                  style: TextStyle(
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                            itemBuilder: (context, notification) => Slidable(
                              key: Key(notification.title),
                              direction: Axis.horizontal,
                              endActionPane: ActionPane(
                                motion: BehindMotion(),
                                extentRatio: 0.3,
                                children: [
                                  SlidableAction(
                                    onPressed: (context) {
                                      final index = notificationPageController
                                          .notifications
                                          .indexOf(notification);

                                      notificationPageController.notifications
                                          .removeAt(index);
                                    },
                                    backgroundColor:
                                        Colors.red.shade100.withOpacity(0.5),
                                    foregroundColor: Colors.red,
                                    icon: Icons.delete,
                                    label: AppStrings.delete,
                                  ),
                                ],
                              ),
                              child: _buildNotificationTile(
                                  context, height, width, notification),
                            ),

                            // repeated
                            //  itemBuilder: (context, notification) => Dismissible(
                            //   key: Key(notification.title),
                            //   direction: DismissDirection.horizontal,
                            //   background: Container(
                            //     alignment: Alignment.centerRight,
                            //     padding: EdgeInsets.symmetric(horizontal: 20),
                            //     color: Colors.red,
                            //     child: Icon(Icons.delete, color: Colors.white),
                            //   ),
                            //   onDismissed: (direction) {
                            //     notificationPageController.notifications
                            //         .remove(notification);
                            //   },
                            //   child: _buildNotificationTile(
                            //       context, height, width, notification),
                            // ),

                            // 👇 This will ensure 'Today' comes first, then 'This Week', then 'Earlier'
                            groupComparator: (group1, group2) {
                              const order = ['Today', 'This Week', 'Earlier'];
                              return order
                                  .indexOf(group1)
                                  .compareTo(order.indexOf(group2));
                            },

                            itemComparator: (item1, item2) =>
                                item2.date.compareTo(item1.date),
                            useStickyGroupSeparators: true,
                            floatingHeader: true,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  Widget _buildNotificationTile(BuildContext context, double height,
      double width, NotificationModel notification) {
    return Padding(
      padding: EdgeInsets.only(top: height * 0.02),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 28.sp,
            width: 28.sp,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0xFFE6E8EC)),
            child: SvgPicture.asset(
              notification.iconPath,
              fit: BoxFit.scaleDown,
            ),
          ),
          SizedBox(
            width: width * 0.05,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: width * 0.6,
                      child: Text(
                        notification.title,
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.w700),
                      ),
                    ),
                    Text(
                      notificationPageController
                          .formatDayMonth(notification.date),
                      style: TextStyle(fontSize: 15.sp, color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.008,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: width * 0.66,
                      child: Text(
                        notification.message,
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w300,
                            color: Color(0xFF353945)),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Icon(Icons.circle, size: 14.sp, color: Color(0xFF2FA2B9)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _emptyNotificationPage(double width, double height) {
    return Container(
      width: width,
      height: height,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
             AppImages.myNotificationEmpty ,
              scale: 4,
            ),
            SizedBox(
              height: height * 0.07,
            ),
            Text(
              AppStrings.noNotificationYet,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18.3.sp, fontWeight: FontWeight.w800),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Text(
              AppStrings.noNotificationRightNow,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w300,
                color: Color(0xFF777E90),
              ),
            ),
            SizedBox(
              height: height * 0.04,
            ),
            Container(
              height: height * 0.065,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(width * 0.05),
                  color: Colors.black),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                  child: Text(
                    AppStrings.notificationsSettings,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
