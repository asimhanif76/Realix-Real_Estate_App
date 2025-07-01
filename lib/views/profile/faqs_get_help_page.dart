import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:realix_real_estate_app/commons/app_images.dart';
import 'package:realix_real_estate_app/controllers/profile_page_controllers/setting_page_controllers.dart';
import 'package:realix_real_estate_app/widgets/my_text_field.dart';
import 'package:realix_real_estate_app/widgets/page_heading_row.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FaqsGetHelpPage extends StatelessWidget {
  FaqsGetHelpPage({super.key});

  SettingPageControllers settingPageControllers =
      Get.put(SettingPageControllers());

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFFFDFDFD),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.05,
              ),
              PageHeadingRow(pageHeadingText: 'FAQs'),
              SizedBox(
                height: height * 0.04,
              ),
              MyTextField(
                  prefixIcon: SvgPicture.asset(
                    AppImages.searchsvg,
                    fit: BoxFit.scaleDown,
                  ),
                  labelText: 'Search questions...',
                  controller: settingPageControllers.searchFAQsControllers),
              SizedBox(
                height: height * 0.03,
              ),
              Text(
                'Frequently Asked',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Obx(
                () => ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: settingPageControllers.faqsItems.length > 3
                      ? settingPageControllers.faqsItemsShow.value
                      : settingPageControllers.faqsItems.length,
                  separatorBuilder: (context, index) => Divider(
                    color: Color(0xFFE6E8EC),
                    height: height * 0.05,
                  ),
                  itemBuilder: (context, index) {
                    return Obx(() {
                      bool isExpanded =
                          settingPageControllers.expandedFaqIndex.value ==
                              index;

                      return GestureDetector(
                        onTap: () {
                          settingPageControllers.expandedFaqIndex.value =
                              isExpanded ? -1 : index;
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    settingPageControllers.faqsItems[index]
                                        ['question']!,
                                    style: TextStyle(
                                      fontSize: 15.5.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                Icon(
                                  isExpanded
                                      ? Icons.keyboard_arrow_up_outlined
                                      : Icons.keyboard_arrow_down_outlined,
                                  color: Color(0xFFB1B5C3),
                                  size: 20.sp,
                                ),
                              ],
                            ),
                            if (isExpanded)
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                child: Text(
                                  settingPageControllers.faqsItems[index]
                                      ['answer']!,
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF353945),
                                  ),
                                ),
                              )
                          ],
                        ),
                      );
                    });
                  },
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              InkWell(
                onTap: () {
                  if (settingPageControllers.faqsItemsShow.value == 3) {
                    settingPageControllers.faqsItemsShow.value =
                        settingPageControllers.faqsItems.length;
                  } else {
                    settingPageControllers.faqsItemsShow.value = 3;
                  }
                },
                borderRadius: BorderRadius.circular(10),
                child: Obx(
                  () => Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          settingPageControllers.faqsItemsShow.value ==
                                  settingPageControllers.faqsItems.length
                              ? 'Show Less'
                              : 'Show All',
                          style: TextStyle(
                            fontSize: 15.5.sp,
                            fontWeight: FontWeight.w700,
                            color: settingPageControllers.faqsItemsShow.value ==
                                    settingPageControllers.faqsItems.length
                                ? Colors.black26
                                : Color(0xFF2FA2B9),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Icon(
                          settingPageControllers.faqsItemsShow.value ==
                                  settingPageControllers.faqsItems.length
                              ? Icons.arrow_back_outlined
                              : Icons.arrow_forward_outlined,
                          color: settingPageControllers.faqsItemsShow.value ==
                                  settingPageControllers.faqsItems.length
                              ? Colors.black26
                              : Color(0xFF2FA2B9),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.02,
              )
            ],
          ),
        ),
      ),
    );
  }
}
