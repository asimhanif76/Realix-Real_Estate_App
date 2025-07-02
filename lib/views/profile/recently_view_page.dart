import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:realix_real_estate_app/commons/app_images.dart';
import 'package:realix_real_estate_app/controllers/home_page_controller.dart';
import 'package:realix_real_estate_app/views/home/constants/filter_bottom_sheet.dart';
import 'package:realix_real_estate_app/widgets/page_heading_row.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RecentlyViewPage extends StatelessWidget {
  RecentlyViewPage({super.key});

  HomePageController homePageController = Get.put(HomePageController());

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
            PageHeadingRow(pageHeadingText: 'Recently Viewed'),
            SizedBox(
              height: height * 0.04,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    _filterSortContainer(
                        text: 'Filter',
                        svgPath: AppImages.filter_1,
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            elevation: 10,
                            backgroundColor: Colors.white,
                            isScrollControlled: true,
                            builder: (context) {
                              return FilterBottomSheet();
                            },
                          );
                        }),
                    SizedBox(
                      width: 8,
                    ),
                    _filterSortContainer(
                        text: 'Sort', svgPath: AppImages.sort, onTap: () {}),
                  ],
                ),
                Text(
                  '${homePageController.ProductList.length} Homes',
                  style: TextStyle(fontWeight: FontWeight.w600),
                )
              ],
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(vertical: width * 0.03),
                separatorBuilder: (context, index) => SizedBox(
                  height: width * 0.05,
                ),
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: homePageController.ProductList.length,
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
            )
          ],
        ),
      ),
    );
  }

  Widget _buildProductCard(BuildContext context, int index) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var product = homePageController.ProductList[index];
    return Column(
      children: [
        Stack(
          children: [
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
            Positioned(
                right: width * 0.04,
                top: width * 0.04,
                child: InkWell(
                  onTap: () {
                    product.isFavourite.toggle();
                  },
                  child: CircleAvatar(
                      backgroundColor: Color(0xFF353945),
                      radius: 17.5.sp,
                      child: Obx(
                        () => SvgPicture.asset(
                          product.isFavourite.value
                              ? AppImages.favourite
                              : AppImages.favourite_outline,
                          width: 17.5.sp,
                          color: product.isFavourite.value
                              ? Colors.red
                              : Colors.white,
                        ),
                      )),
                )),
          ],
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
