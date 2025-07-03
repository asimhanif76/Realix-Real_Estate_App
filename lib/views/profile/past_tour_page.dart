import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:realix_real_estate_app/commons/app_images.dart';
import 'package:realix_real_estate_app/controllers/home_page_controller.dart';
import 'package:realix_real_estate_app/controllers/shedule_tour_controller.dart';
import 'package:realix_real_estate_app/views/home/constants/filter_bottom_sheet.dart';
import 'package:realix_real_estate_app/widgets/page_heading_row.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PastTourPage extends StatelessWidget {
  PastTourPage({super.key});
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.05,
            ),
            PageHeadingRow(pageHeadingText: 'Past Tours'),
            SizedBox(
              height: height * 0.02,
            ),
            Expanded(
              child: Obx(
                () => ListView.separated(
                  padding: EdgeInsets.symmetric(vertical: width * 0.03),
                  separatorBuilder: (context, index) => SizedBox(
                    height: width * 0.05,
                  ),
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemCount: homePageController.productWithTour.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/productDetailPage',
                              arguments: {
                                'index': index,
                              });
                        },
                        borderRadius: BorderRadius.circular(width * 0.6),
                        child: _buildProductCard(context, index));
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildProductCard(BuildContext context, int index) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var product = homePageController.productWithTour[index];
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.03, vertical: width * 0.04),
      decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          border: Border.all(color: Color(0xFFE6E8EC)),
          borderRadius: BorderRadius.circular(width * 0.05)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${product.pastTourModel!.date}${product.pastTourModel!.time} ",
            style: TextStyle(
              fontSize: 15.5.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: width * 0.01),
            child: product.pastTourModel!.status == 'Canceled'
                ? Row(
                    children: [
                      Icon(
                        Icons.cancel,
                        color: Colors.red,
                        size: 15,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Canceled',
                        style: TextStyle(
                          fontSize: 14.5.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  )
                : Row(
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: 15,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Completed',
                        style: TextStyle(
                          fontSize: 14.5.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: width * 0.03),
            child: Text(
              'You can request another tour anytime, if you have questions please contact your agent',
              style: TextStyle(
                fontSize: 14.5.sp,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: height * 0.25,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(width * 0.05)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(width * 0.05),
              child: Image.asset(
                product.imagePath.isNotEmpty
                    ? product.imagePath[0]
                    : AppImages.property_image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(width * 0.05),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: width * 0.03),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product.name,
                        style: TextStyle(
                            fontSize: 17.5.sp,
                            fontWeight: FontWeight.w800,
                            color: Colors.black),
                      ),
                      Text(
                        'Price',
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w300,
                            color: Color(0xFF777E90)),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: Color(0xFF2FA2B9),
                            size: 16.sp,
                          ),
                          SizedBox(
                            width: width * 0.45,
                            child: Text(
                              product.address,
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w300,
                                color: Colors.black,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '\$${product.price}',
                        style: TextStyle(
                            fontSize: 17.5.sp,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF2FA2B9)),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _filterSortContainer(
      {required String text,
      required String svgPath,
      required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(5),
      child: Container(
        height: 40,
        width: 80,
        decoration: BoxDecoration(
            border: Border.all(color: Color(0xFFE6E8EC)),
            borderRadius: BorderRadius.circular(5)),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 6,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(text),
              SvgPicture.asset(
                svgPath,
                fit: BoxFit.scaleDown,
              )
            ],
          ),
        ),
      ),
    );
  }
}
