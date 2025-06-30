import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:realix_real_estate_app/commons/app_images.dart';
import 'package:realix_real_estate_app/commons/app_strings.dart';
import 'package:realix_real_estate_app/controllers/home_page_controller.dart';
import 'package:realix_real_estate_app/controllers/shedule_tour_controller.dart';
import 'package:realix_real_estate_app/widgets/page_heading_row.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ConfirmRequest extends StatelessWidget {
  ConfirmRequest({super.key});

  HomePageController homePageController = Get.put(HomePageController());

  SheduleTourController sheduleTourController =
      Get.put(SheduleTourController());

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFFFDFDFD),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        child: Column(
          children: [
            SizedBox(height: height * 0.04),
            PageHeadingRow(pageHeadingText: ''),
            SizedBox(height: height * 0.04),
            Container(
              width: width,
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.055, vertical: width * 0.065),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 227, 243, 246),
                borderRadius: BorderRadius.circular(width * 0.05),
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Color(0xFF2FA2B9),
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 21.sp,
                    ),
                  ),
                  SizedBox(height: height * 0.015),
                  Text(
                    'Request Recieved!',
                    style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 15.5.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                      children: [
                        TextSpan(
                            text: 'We’re checking if the home can be seen on '),
                        TextSpan(
                          text: 'Mon, April 4 4:00 PM to 4:45 PM',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(text: '.'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: height * 0.04),
            Container(
              width: width,
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.05, vertical: width * 0.055),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(width * 0.05),
                border: Border.all(color: Color(0xFFE6E8EC)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Associate Capital Properties LLC Agent will take you on the tour!',
                    style: TextStyle(
                      fontSize: 15.5.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Divider(
                    height: height * 0.03,
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.all(0),
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        // elevation: 10,
                        backgroundColor: Colors.white,
                        builder: (context) {
                          return _bottomSheet(height, width);
                        },
                      );
                    },
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(homePageController
                          .ProductList[sheduleTourController
                              .selectedVirtualAppIndex.value]
                          .buyerModel
                          .imagePath),
                    ),
                    title: Text(
                      homePageController
                          .ProductList[sheduleTourController
                              .selectedVirtualAppIndex.value]
                          .buyerModel
                          .buyerName,
                      style: TextStyle(
                        fontSize: 16.5.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    subtitle: Text(
                      homePageController
                          .ProductList[sheduleTourController
                              .selectedVirtualAppIndex.value]
                          .buyerModel
                          .companyName,
                      style: TextStyle(
                          fontSize: 15.5.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.grey,
                      size: 18.sp,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bottomSheet(double height, double width) {
    return Container(
      height: height - (height * 0.1),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(
              indent: width * 0.43,
              endIndent: width * 0.43,
              color: Colors.grey.shade300,
              thickness: 5,
              height: width * 0.07,
            ),
            _heaadingRow(width),
            ListTile(
              contentPadding: EdgeInsets.only(top: width * 0.02),
              leading: CircleAvatar(
                radius: 19.sp,
                backgroundImage: AssetImage(AppImages.profile_image),
              ),
              title: Text(
                homePageController
                    .ProductList[
                        sheduleTourController.selectedVirtualAppIndex.value]
                    .buyerModel
                    .buyerName,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              subtitle: Text(
                homePageController
                    .ProductList[
                        sheduleTourController.selectedVirtualAppIndex.value]
                    .buyerModel
                    .companyName,
                style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey),
              ),
              trailing: Container(
                width: width * 0.17,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(width * 0.1),
                    color: Color(0xFFF4F5F6)),
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.015, vertical: width * 0.008),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 15.sp,
                    ),
                    Text(
                        "${homePageController.ProductList[sheduleTourController.selectedVirtualAppIndex.value].buyerModel.rating}(${homePageController.ProductList[sheduleTourController.selectedVirtualAppIndex.value].buyerModel.ratingCount})")
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: width * 0.06),
              child: RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                        text:
                            'My associate Rachel will take you to see the home on '),
                    TextSpan(
                      text: 'Mon, April 4 4:00 PM to 4:45 PM',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                        text:
                            '. I will follow up afterwards with you to see how it went.'),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: width * 0.08),
              child: Text(
                'If you’d like to keep working with me after your tour, I’ll be here for you every step of the way - from finding the right home to writing a winning offer.',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ),
            Text(
              'About Me',
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w800),
            ),
            SizedBox(
              height: width * 0.025,
            ),
            ReadMoreText(
              homePageController
                  .ProductList[
                      sheduleTourController.selectedVirtualAppIndex.value]
                  .buyerModel
                  .about,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
              trimMode: TrimMode.Line,
              trimLines: 2,
              colorClickableText: Color(0xFF2FA2B9),
              trimCollapsedText: 'See more',
              trimExpandedText: '   See less',
              moreStyle: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF2FA2B9)),
            ),
            SizedBox(
              height: width * 0.08,
            ),
            Text(
              'Highlights',
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w800),
            ),
            SizedBox(
              height: width * 0.08,
            ),
            Row(
              children: [
                _highLightContainer(
                  width,
                  height,
                  title: 'Home Closed',
                  subTitle:
                      "${homePageController.ProductList[sheduleTourController.selectedVirtualAppIndex.value].buyerModel.homesClosed}",
                  svgPath: AppImages.home_closed,
                ),
                SizedBox(
                  width: width * 0.04,
                ),
                _highLightContainer(
                  width,
                  height,
                  title: 'Experience',
                  subTitle: homePageController
                      .ProductList[
                          sheduleTourController.selectedVirtualAppIndex.value]
                      .buyerModel
                      .experience,
                  svgPath: AppImages.experience,
                ),
              ],
            ),
            SizedBox(
              height: width * 0.04,
            ),
            Row(
              children: [
                _highLightContainer(
                  width,
                  height,
                  title: 'Condos',
                  subTitle:
                      "${homePageController.ProductList[sheduleTourController.selectedVirtualAppIndex.value].buyerModel.condos}",
                  svgPath: AppImages.condos,
                ),
                SizedBox(
                  width: width * 0.04,
                ),
                _highLightContainer(
                  width,
                  height,
                  title: 'Apartment',
                  subTitle: homePageController
                      .ProductList[
                          sheduleTourController.selectedVirtualAppIndex.value]
                      .buyerModel
                      .apartments,
                  svgPath: AppImages.apartment,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _heaadingRow(double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 25.sp,
          height: 25.sp,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(width * 0.025),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.close,
                size: 18.sp,
              )),
        ),
        Text(
          'Agent Detail',
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w800),
        ),
        const SizedBox(
          width: 50,
        ),
      ],
    );
  }

  Widget _highLightContainer(double width, double height,
      {required String title,
      required String subTitle,
      required String svgPath}) {
    return Flexible(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: width * 0.04),
        height: height * 0.07,
        decoration: BoxDecoration(
          color: Color(0xFFF9FAFB),
          border: Border.all(color: Color(0xFFE6E8EC)),
          borderRadius: BorderRadius.circular(width * 0.03),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(right: width * 0.03),
                child: CircleAvatar(
                  radius: 18.sp,
                  backgroundColor: Color(0xFFE6E8EC),
                  child: SvgPicture.asset(svgPath),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    '$subTitle',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
