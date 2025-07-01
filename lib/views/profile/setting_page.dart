import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realix_real_estate_app/controllers/profile_page_controllers/setting_page_controllers.dart';
import 'package:realix_real_estate_app/widgets/page_heading_row.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SettingPage extends StatelessWidget {
  SettingPage({super.key});

  SettingPageControllers settingPageControllers =
      Get.put(SettingPageControllers());

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFFFDFDFD),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.05,
            ),
            PageHeadingRow(pageHeadingText: 'Settings'),
            SizedBox(
              height: height * 0.04,
            ),
            Text(
              'Application Settings',
              style: TextStyle(
                  fontSize: 15.5.sp,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF777E90)),
            ),
            ListView.separated(
              separatorBuilder: (context, index) => index == 3
                  ? SizedBox()
                  : Divider(
                      height: height * 0.006,
                      color: Color(0xFFE6E8EC),
                    ),
              padding: EdgeInsets.all(0),
              shrinkWrap: true,
              itemCount: settingPageControllers.settingItems.length,
              itemBuilder: (context, index) {
                return index == 4
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Text(
                            'Support',
                            style: TextStyle(
                                fontSize: 15.5.sp,
                                fontWeight: FontWeight.w800,
                                color: Color(0xFF777E90)),
                          ),
                          _buildSettingTile(
                            index,
                            height,
                            Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: Color(0xFF777E90),
                              size: 16.sp,
                            ),
                            () {},
                          )
                        ],
                      )
                    : _buildSettingTile(
                        index,
                        height,
                        index == 0
                            ? ScaleTransition(
                                scale: AlwaysStoppedAnimation(0.7),
                                child: Obx(
                                  () => Switch(
                                    value: settingPageControllers
                                        .isNotificationOn.value,
                                    activeTrackColor: Color(0xFF2FA2B9),
                                    inactiveTrackColor: Color(0xFFE6E8EC),
                                    onChanged: (value) {
                                      settingPageControllers.isNotificationOn
                                          .toggle();
                                    },
                                  ),
                                ),
                              )
                            : index == 1
                                ? ScaleTransition(
                                    scale: AlwaysStoppedAnimation(0.7),
                                    child: Obx(
                                      () => Switch(
                                        value: settingPageControllers
                                            .isDarkMode.value,
                                        activeTrackColor: Color(0xFF2FA2B9),
                                        inactiveTrackColor: Color(0xFFE6E8EC),
                                        onChanged: (value) {
                                          settingPageControllers.isDarkMode
                                              .toggle();
                                        },
                                      ),
                                    ),
                                  )
                                : index == 2
                                    ? Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: width * 0.015),
                                            child: Obx(
                                              () => Text(
                                                settingPageControllers
                                                    .selectedLanguage.value,
                                                style: TextStyle(
                                                    fontSize: 15.5.sp,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color(0xFF777E90)),
                                              ),
                                            ),
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios_outlined,
                                            color: Color(0xFF777E90),
                                            size: 16.sp,
                                          ),
                                        ],
                                      )
                                    : index == 3
                                        ? Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: width * 0.015),
                                                child: Obx(
                                                  () => Text(
                                                    settingPageControllers
                                                        .selectedCountry.value,
                                                    style: TextStyle(
                                                        fontSize: 15.5.sp,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color:
                                                            Color(0xFF777E90)),
                                                  ),
                                                ),
                                              ),
                                              Icon(
                                                Icons
                                                    .arrow_forward_ios_outlined,
                                                color: Color(0xFF777E90),
                                                size: 16.sp,
                                              ),
                                            ],
                                          )
                                        : Icon(
                                            Icons.arrow_forward_ios_outlined,
                                            color: Color(0xFF777E90),
                                            size: 16.sp,
                                          ),
                        index == 0
                            ? () {
                                settingPageControllers.isNotificationOn
                                    .toggle();
                              }
                            : index == 1
                                ? () {
                                    settingPageControllers.isDarkMode.toggle();
                                  }
                                : index == 2
                                    ? () {
                                        showModalBottomSheet(
                                          context: context,
                                          backgroundColor: Color(0xFFFDFDFD),
                                          showDragHandle: true,
                                          builder: (context) {
                                            return Container(
                                                child: ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: settingPageControllers
                                                  .language.length,
                                              itemBuilder: (context, index) {
                                                return ListTile(
                                                  onTap: () {
                                                    settingPageControllers
                                                            .selectedLanguage
                                                            .value =
                                                        settingPageControllers
                                                            .language[index];
                                                    Navigator.pop(context);
                                                  },
                                                  title: Text(
                                                      settingPageControllers
                                                          .language[index]),
                                                  trailing:
                                                      Icon(Icons.language),
                                                );
                                              },
                                            ));
                                          },
                                        );
                                      }
                                    : index == 3
                                        ? () {
                                            showCountryPicker(
                                              context: context,
                                              onSelect: (value) {
                                                settingPageControllers
                                                    .selectedCountry
                                                    .value = value.countryCode;
                                              },
                                            );
                                          }
                                        : index == 4
                                            ? () {}
                                            : index == 5
                                                ? () {}
                                                : index == 6
                                                    ? () {}
                                                    : index == 7
                                                        ? () {
                                                            Navigator.pushNamed(
                                                                context,
                                                                '/faqsGetHelpPage');
                                                          }
                                                        : () {});
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSettingTile(
      int index, double height, Widget trailing, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(height * 0.015),
      child: ListTile(
          // onTap: onTap,
          contentPadding: EdgeInsets.all(0),
          title: Text(
            settingPageControllers.settingItems[index],
            style: TextStyle(fontSize: 15.5.sp, fontWeight: FontWeight.w600),
          ),
          trailing: trailing),
    );
  }
}
