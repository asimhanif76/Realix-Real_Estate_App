import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:realix_real_estate_app/commons/app_images.dart';
import 'package:realix_real_estate_app/commons/app_strings.dart';
import 'package:realix_real_estate_app/controllers/discover_page_controller.dart';
import 'package:realix_real_estate_app/controllers/home_page_controller.dart';
import 'package:realix_real_estate_app/controllers/product_detail_page_controller.dart';
import 'package:realix_real_estate_app/controllers/shedule_tour_controller.dart';
import 'package:realix_real_estate_app/model/product_model.dart';
import 'package:realix_real_estate_app/widgets/full_image_view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProductDetailPage extends StatelessWidget {
  ProductDetailPage({super.key});

  DiscoverPageController discoverPageController =
      Get.put(DiscoverPageController());

  HomePageController homePageController = Get.put(HomePageController());

  ProductDetailPageController productDetailPageController =
      Get.put(ProductDetailPageController());

  SheduleTourController sheduleTourController =
      Get.put(SheduleTourController());

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final int index = args['index'];

    sheduleTourController.selectedPropertyIndex.value = index;

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    ProductModel product = homePageController.ProductList[index];

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFFDFDFD),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.01,
                ),
                _imageContainer(
                    width,
                    height,
                    homePageController.ProductList[index].name,
                    homePageController.ProductList[index].address,
                    product.imagePath),
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
                        '${product.fullBaths} Rooms', width),
                    _buildInfoCard(AppImages.bed_room, AppStrings.bedRoom,
                        '${product.bedrooms} Rooms', width),
                    _buildInfoCard(AppImages.square, AppStrings.square,
                        '${product.lotSize} Ft', width),
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
                ReadMoreText(
                  product.description,
                  trimMode: TrimMode.Line,
                  trimLines: 3,
                  colorClickableText: Color(0xFF2FA2B9),
                  trimCollapsedText: 'See more',
                  trimExpandedText: 'See less',
                  moreStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2FA2B9)),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                _galleryView(width, height, product),
                SizedBox(
                  height: height * 0.03,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: width * 0.04),
                  child: Text(
                    'Location',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                ),
                Image.asset(AppImages.map_location),
                SizedBox(
                  height: height * 0.03,
                ),
                Container(
                  height: 278,
                  width: width,
                  padding: EdgeInsets.all(width * 0.05),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.shade300,
                    ),
                    borderRadius: BorderRadius.circular(width * 0.05),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Contact to Buyer’s Agent',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      ListTile(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: width * 0.05),
                        leading: CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage(AppImages.profile_image),
                        ),
                        title: Text(
                          product.buyerModel.buyerName,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                        subtitle: Text(
                          product.buyerModel.companyName,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF777E90)),
                        ),
                      ),
                      Row(
                        children: [
                          _buyerContinerButton(
                            width,
                            height,
                            AppImages.chat,
                            'Message',
                            () {},
                          ),
                          SizedBox(
                            width: width * 0.03,
                          ),
                          _buyerContinerButton(
                              width, height, AppImages.phone, 'Phone', () {}),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.015,
                      ),
                      _buyerContinerButton(width, height,
                          AppImages.ask_question, 'Ask a question', () {}),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: width * 0.04),
                  child: Text(
                    'Popular Amenities',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: product.amenities.map(
                      (e) {
                        return Container(
                          margin: EdgeInsets.only(right: 8),
                          padding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            e,
                            style: TextStyle(fontSize: 13, color: Colors.black),
                          ),
                        );
                      },
                    ).toList(),
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: height * 0.145,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0, -4),
                blurRadius: 10,
                spreadRadius: 1,
              ),
            ],
          ),
          padding: EdgeInsets.all(width * 0.05),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("price: "),
                  Text(
                    "\$${product.price.toPrecision(2)}",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF2FA2B9)),
                  )
                ],
              ),
              Expanded(child: SizedBox()),
              Row(
                children: [
                  Container(
                    width: height * 0.055,
                    height: height * 0.055,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Obx(
                      () => InkWell(
                        onTap: () {
                          product.isFavourite.toggle();
                        },
                        child: SvgPicture.asset(
                            product.isFavourite.value
                                ? AppImages.favourite
                                : AppImages.favourite_outline,
                            color: product.isFavourite.value
                                ? Colors.red
                                : Colors.black,
                            fit: BoxFit.scaleDown),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.03,
                  ),
                  Expanded(
                      child: Material(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(width * 0.03),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(width * 0.03),
                      onTap: () {
                        Navigator.pushNamed(context, '/pickDatePage');
                      },
                      child: Container(
                        height: height * 0.055,
                        child: Center(
                          child: Text(
                            'Schedule Tour',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _galleryView(double width, double height, ProductModel product) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: width * 0.04),
          child: Text(
            'Gallery',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
        ),
        SizedBox(
          height: height * 0.155,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount:
                product.imagePath.length > 3 ? 3 : product.imagePath.length,
            separatorBuilder: (context, index) => SizedBox(
              width: width * 0.03,
            ),
            itemBuilder: (context, index) {
              final total = product.imagePath.length;
              final remaining = total - 3;

              return Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FullImageView(
                                  imagePath: product.imagePath[index]),
                            ));
                      },
                      child: Image.asset(
                        product.imagePath[index],
                        width: (width - width * 0.16) / 3,
                        height: height * 0.155,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: (width - width * 0.16) / 3,
                            height: height * 0.155,
                            color: Colors.grey.shade300,
                            child: Icon(Icons.broken_image),
                          );
                        },
                      ),
                    ),
                  ),
                  // Show +N on the last visible image if more images exist
                  if (index == 2 && total > 3)
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/showAllImages',
                            arguments: {
                              'index': index,
                            });
                      },
                      child: Container(
                        width: (width - width * 0.16) / 3,
                        height: height * 0.155,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.black.withOpacity(0.5),
                        ),
                        child: Center(
                          child: Text(
                            '+$remaining',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _imageContainer(double width, double height, String propertyName,
      String propertyAddress, List<String> productImages) {
    return Stack(
      children: [
        Container(
          height: height * 0.41,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(width * 0.05),
            color: Colors.black45,
          ),
          clipBehavior: Clip.antiAlias,
          child: PageView.builder(
            controller: productDetailPageController.pageController,
            itemCount: productImages.length,
            onPageChanged: (index) {
              productDetailPageController.currentImage.value = index;
              print(productDetailPageController.currentImage.value);
            },
            itemBuilder: (context, index) {
              return Image.asset(
                productImages[index],
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
                  productImages.length,
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

  Widget _buyerContinerButton(double width, double height, String svgPath,
      String btnName, VoidCallback onTap) {
    return Expanded(
        child: Material(
      color: Color(0xFFF4F5F6),
      borderRadius: BorderRadius.circular(width * 0.03),
      child: InkWell(
        borderRadius: BorderRadius.circular(width * 0.03),
        onTap: onTap,
        child: Container(
          height: height * 0.055,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(svgPath),
                SizedBox(
                  width: width * 0.04,
                ),
                Text(
                  btnName,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF777E90)),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
