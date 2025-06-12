import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:realix_real_estate_app/controllers/add_new_property_controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddNewPropertyDetailsPage extends StatelessWidget {
  AddNewPropertyDetailsPage({super.key});

  AddNewPropertyController addNewPropertyController =
      Get.put(AddNewPropertyController());

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFFFDFDFD),
      body: Padding(
        padding: EdgeInsets.all(width * 0.05),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 347,
                  width: width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width * 0.05),
                      color: Colors.black45,
                      image: DecorationImage(
                          image:
                              AssetImage('assets/images/property_image.png'))),
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
                            'Primary Apartment',
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildInfoCard('assets/images/svg/bath_room.svg', 'Bath room',
                    '${addNewPropertyController.property.value.fullBaths} Rooms'),
                _buildInfoCard('assets/images/svg/bed_room.svg', 'Bed Room',
                    '${addNewPropertyController.property.value.bedrooms} Rooms'),
                _buildInfoCard('assets/images/svg/square.svg', 'Square',
                    '${addNewPropertyController.property.value.lotSize} Ft'),
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
                  SvgPicture.asset('assets/images/svg/edit_details.svg'),
                  SizedBox(width: 8),
                  Text(
                    'Edit Details',
                    style:
                        TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(String svgPath, String title, String value) {
    return Row(
      children: [
        Container(
          width: 34,
          height: 34,
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
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500)),
            Text(value,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    );
  }
}
