import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:realix_real_estate_app/commons/app_images.dart';
import 'package:realix_real_estate_app/commons/app_strings.dart';
import 'package:realix_real_estate_app/controllers/add_new_property_controller.dart';
import 'package:realix_real_estate_app/controllers/add_new_property_details_controller.dart';
import 'package:realix_real_estate_app/controllers/home_page_controller.dart';
import 'package:realix_real_estate_app/widgets/custom_black_buttton.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddNewPropertyDetailsPage extends StatelessWidget {
  AddNewPropertyDetailsPage({super.key});

  AddNewPropertyController addNewPropertyController =
      Get.put(AddNewPropertyController());

  AddNewPropertyDetailsController addNewPropertyDetailsController =
      Get.put(AddNewPropertyDetailsController());

  HomePageController homePageController = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFFFDFDFD),
      bottomNavigationBar: CustomBlackButtton(
        buttonName: AppStrings.contact_agent,
        onTap: () {
          addNewPropertyController.addedProperties
              .add(addNewPropertyController.property.value);
          print(addNewPropertyController.addedProperties.length);
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(width * 0.05),
          child: Column(
            children: [
              SizedBox(
                height: height * 0.02,
              ),
              Stack(
                children: [
                  Container(
                    height: 347,
                    width: width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(width * 0.05),
                        color: Colors.black45,
                        image: DecorationImage(
                            image: AssetImage(AppImages.property_image),
                            fit: BoxFit.cover)),
                  ),
                  Positioned(
                    left: width * 0.05,
                    top: width * 0.05,
                    child: Container(
                      width: 27.sp,
                      height: 27.sp,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(width * 0.03),
                        border: Border.all(
                            color: Colors.grey.withOpacity(0.2), width: 4),
                      ),
                      child: IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            Icons.arrow_back_ios_rounded,
                            size: 18.sp,
                          )),
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      child: Padding(
                        padding: EdgeInsets.all(width * 0.06),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppStrings.primaryApartment,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w800),
                            ),
                            Text(
                              addNewPropertyController
                                      .property.value.streetAddress +
                                  addNewPropertyController.property.value.city,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.5.sp,
                                  fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                      ))
                ],
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildInfoCard(
                      AppImages.bath_room,
                      AppStrings.bathRoom,
                      '${addNewPropertyController.property.value.fullBaths} Rooms',
                      width),
                  _buildInfoCard(
                      AppImages.bed_room,
                      AppStrings.bedRoom,
                      '${addNewPropertyController.property.value.bedrooms} Rooms',
                      width),
                  _buildInfoCard(
                      AppImages.square,
                      AppStrings.square,
                      '${addNewPropertyController.property.value.lotSize} Ft',
                      width),
                ],
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(width * 0.04),
                    color: Color(0xFFF1F2F4)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AppImages.edit_details),
                    SizedBox(width: 8),
                    Text(
                      AppStrings.editDetails,
                      style: TextStyle(
                          fontSize: 15.sp, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: height * 0.03),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    AppStrings.information,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildStatCard(
                    title: 'Estimate price',
                    value:
                        '\$ ${addNewPropertyDetailsController.estimatePrice.value}'
                            .toString(),
                    percent: addNewPropertyDetailsController
                        .estimatePricePercent.value,
                  ),
                  SizedBox(
                    width: width * 0.03,
                  ),
                  buildStatCard(
                    title: 'Sale activity',
                    value:
                        '${addNewPropertyDetailsController.saleActivity.value} Sold',
                    percent: addNewPropertyDetailsController
                        .saleActivityPercent.value,
                  ),
                  SizedBox(
                    width: width * 0.03,
                  ),
                  buildStatCard(
                    title: 'Average price',
                    value:
                        '\$ ${addNewPropertyDetailsController.averagePrice.value}'
                            .toString(),
                    percent: addNewPropertyDetailsController
                        .averagePricePercent.value,
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              _buildGraphContainer(height, width),
              Padding(
                padding: EdgeInsets.symmetric(vertical: height * 0.03),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    AppStrings.nearbyProperties,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              ListView.separated(
                padding: EdgeInsets.symmetric(vertical: width * 0.03),
                separatorBuilder: (context, index) => SizedBox(
                  height: width * 0.05,
                ),
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: homePageController.ProductList.length,
                itemBuilder: (context, index) {
                  return _buildProductCard(context, index);
                },
              )
            ],
          ),
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
                  product.imagePath[1],
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
          height: height * 0.1,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(width * 0.05),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.0, vertical: width * 0.03),
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
                      'price',
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
                        Text(
                          product.address,
                          style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w300,
                              color: Colors.black),
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

  Widget buildStatCard({
    required String title,
    required String value,
    required double percent,
  }) {
    bool isNegative = percent < 0;

    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade100,
              blurRadius: 10,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 6),
            Text(
              value,
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 6),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: isNegative ? Color(0xFFFFEBEB) : Color(0xFFE8F8EE),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                '${isNegative ? '' : '+'}${percent.toStringAsFixed(1)}%',
                style: TextStyle(
                  color: isNegative ? Colors.red : Colors.green,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGraphContainer(double height, double width) {
    return Container(
      padding: EdgeInsets.all(width * 0.05),
      height: height * 0.4,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(width * 0.05),
        boxShadow: [
          BoxShadow(
            color: Colors.black45,
            blurRadius: 3,
            spreadRadius: 0,
            offset: Offset(0, 6),
          ),
        ],
      ),
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Realix Estimate',
            style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade600),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Text(
            '\$6,345.00',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Obx(
            () => Row(
              children: [
                GestureDetector(
                  onTap: () {
                    addNewPropertyDetailsController.isOneYear.value = true;
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: addNewPropertyDetailsController.isOneYear.value
                              ? Colors.grey
                              : Colors.transparent),
                      borderRadius: BorderRadius.circular(width * 0.025),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: width * 0.035, vertical: width * 0.018),
                      child: Text(
                        '1 Year',
                        style: TextStyle(
                            color:
                                addNewPropertyDetailsController.isOneYear.value
                                    ? Colors.black
                                    : Colors.grey),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: width * 0.06,
                ),
                GestureDetector(
                  onTap: () {
                    addNewPropertyDetailsController.isOneYear.value = false;
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: addNewPropertyDetailsController.isOneYear.value
                              ? Colors.transparent
                              : Colors.grey),
                      borderRadius: BorderRadius.circular(width * 0.025),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: width * 0.035, vertical: width * 0.018),
                      child: Text(
                        '5 Year',
                        style: TextStyle(
                            color:
                                addNewPropertyDetailsController.isOneYear.value
                                    ? Colors.grey
                                    : Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Expanded(
            child: Row(
              children: [
                Image.asset(
                  'assets/images/chart.png',
                  scale: 4,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: width * 0.022),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '\$4k',
                          style:
                              TextStyle(fontSize: 14.5.sp, color: Colors.grey),
                        ),
                        Text(
                          '\$3k',
                          style:
                              TextStyle(fontSize: 14.5.sp, color: Colors.grey),
                        ),
                        Text(
                          '\$2k',
                          style:
                              TextStyle(fontSize: 14.5.sp, color: Colors.grey),
                        ),
                        Text(
                          '\$1k',
                          style:
                              TextStyle(fontSize: 14.5.sp, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
