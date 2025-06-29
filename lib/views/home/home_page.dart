import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:realix_real_estate_app/commons/app_images.dart';
import 'package:realix_real_estate_app/commons/app_strings.dart';
import 'package:realix_real_estate_app/controllers/home_page_controller.dart';
import 'package:realix_real_estate_app/views/home/constants/filter_bottom_sheet.dart';
import 'package:realix_real_estate_app/widgets/circle_icon.dart';
import 'package:realix_real_estate_app/widgets/my_text_field.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
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
          children: [
            SizedBox(
              height: 5.h,
            ),
            _buildFirstRow(context),
            SizedBox(
              height: height * 0.012,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _myTextField(width, context),
                    ListView.separated(
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
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductCard(BuildContext context, int index) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var product = homePageController.ProductList[index];
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: height * 0.45,
          decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(width * 0.05)),
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
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: EdgeInsets.all(width * 0.05),
            child: Container(
              height: height * 0.1,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(width * 0.05),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.05, vertical: width * 0.03),
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
                          '\$${product.price}',
                          style: TextStyle(
                              fontSize: 17.5.sp,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFF2FA2B9)),
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
                          AppStrings.perMonth,
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w300,
                              color: Color(0xFF777E90)),
                        ),
                      ],
                    )
                  ],
                ),
              ),
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
                      color:
                          product.isFavourite.value ? Colors.red : Colors.white,
                    ),
                  )),
            )),
      ],
    );
  }

  Widget _myTextField(width, BuildContext context) {
    return MyTextField(
        color: Colors.white,
        border: true,
        prefixIcon: SvgPicture.asset(
          AppImages.search,
          fit: BoxFit.scaleDown,
        ),
        trailingIcon: InkWell(
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
          },
          child: Container(
            height: width * 0.06,
            width: width * 0.06,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.w), color: Colors.black),
            child: SvgPicture.asset(
              AppImages.filter,
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
        labelText: AppStrings.search,
        controller: homePageController.searchController);
  }

  Widget _buildFirstRow(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.location,
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: Colors.blue,
                      size: 18.sp,
                    ),
                    Text(
                      'Unknown',
                      style: TextStyle(
                          fontSize: 15.sp, fontWeight: FontWeight.w600),
                    ),
                    Icon(Icons.keyboard_arrow_down)
                  ],
                ),
              ],
            ),
            Row(
              children: [
                CircleIcon(
                  imagePath: AppImages.category,
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/notificationPage');
                    },
                    child: CircleIcon(imagePath: AppImages.notifications)),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
