import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:realix_real_estate_app/commons/app_images.dart';
import 'package:realix_real_estate_app/commons/app_strings.dart';
import 'package:realix_real_estate_app/controllers/discover_page_controller.dart';
import 'package:realix_real_estate_app/controllers/home_page_controller.dart';
import 'package:realix_real_estate_app/controllers/product_detail_page_controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProductDetailPage extends StatelessWidget {
  ProductDetailPage({super.key});

  DiscoverPageController discoverPageController =
      Get.put(DiscoverPageController());

  HomePageController homePageController = Get.put(HomePageController());

  ProductDetailPageController productDetailPageController =
      Get.put(ProductDetailPageController());

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final int index = args['index'];

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
              height: height * 0.04,
            ),
            _imageContainer(width, homePageController.ProductList[index].name,
                homePageController.ProductList[index].address),
            SizedBox(
              height: height * 0.03,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: width * 0.04),
              child: Text(
                'Description',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildInfoCard(AppImages.bath_room, AppStrings.bathRoom,
                    '${discoverPageController.bathCount.value} Rooms', width),
                _buildInfoCard(AppImages.bed_room, AppStrings.bedRoom,
                    '${discoverPageController.bedCount.value} Rooms', width),
                _buildInfoCard(
                    AppImages.square, AppStrings.square, '${'000'} Ft', width),
              ],
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: width * 0.04),
              child: Text(
                'About',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _imageContainer(
    double width,
    String propertyName,
    String propertyAddress,
  ) {
    return Stack(
      children: [
        Container(
          height: 347,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(width * 0.05),
            color: Colors.black45,
          ),
          clipBehavior: Clip.antiAlias,
          child: PageView.builder(
            controller: productDetailPageController.pageController,
            itemCount: productDetailPageController.images.length,
            onPageChanged: (index) {
              productDetailPageController.currentImage.value = index;
              print(productDetailPageController.currentImage.value);
            },
            itemBuilder: (context, index) {
              return Image.asset(
                productDetailPageController.images[index],
                fit: BoxFit.cover,
              );
            },
          ),
        ),
        Positioned(
            bottom: width * 0.03,
            left: 0,
            right: 0,
            child: Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  productDetailPageController.images.length,
                  (index) {
                    return AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      margin: EdgeInsets.all(3),
                      width: productDetailPageController.currentImage.value ==
                              index
                          ? 30
                          : 16,
                      height: productDetailPageController.currentImage.value ==
                              index
                          ? 4
                          : 3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: productDetailPageController.currentImage.value ==
                                index
                            ? Colors.white
                            : Colors.white38,
                      ),
                    );
                  },
                ),
              ),
            )),
        Positioned(
          left: width * 0.05,
          top: width * 0.05,
          right: width * 0.05,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 27.sp,
                height: 27.sp,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(width * 0.03),
                  border:
                      Border.all(color: Colors.grey.withOpacity(0.2), width: 4),
                ),
                child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_rounded,
                      size: 17.sp,
                    )),
              ),
              Container(
                width: 27.sp,
                height: 27.sp,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(width * 0.03),
                  border:
                      Border.all(color: Colors.grey.withOpacity(0.2), width: 4),
                ),
                child: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(AppImages.gallery_add)),
              ),
            ],
          ),
        ),
        Positioned(
            bottom: width * 0.03,
            child: Padding(
              padding: EdgeInsets.all(width * 0.06),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    propertyName,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w800),
                  ),
                  Text(
                    propertyAddress,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.5.sp,
                        fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            ))
      ],
    );
  }

  Widget _buildInfoCard(
      String svgPath, String title, String value, double width) {
    return Row(
      children: [
        Container(
          width: width * 0.1,
          height: width * 0.1,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Color(0xFF1A1C22),
            borderRadius: BorderRadius.circular(12),
          ),
          child: SvgPicture.asset(svgPath),
        ),
        SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: TextStyle(
                    color: Colors.grey.shade400,
                    fontSize: 13.5.sp,
                    fontWeight: FontWeight.w500)),
            Text(value,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    );
  }
}
