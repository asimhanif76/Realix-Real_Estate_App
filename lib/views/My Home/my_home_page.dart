import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:realix_real_estate_app/commons/app_images.dart';
import 'package:realix_real_estate_app/commons/app_strings.dart';
import 'package:realix_real_estate_app/controllers/add_new_property_controller.dart';
import 'package:realix_real_estate_app/widgets/my_container_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  AddNewPropertyController addNewPropertyController =
      Get.put(AddNewPropertyController());

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFFFCFCFD),
      body: Column(
        children: [
          SizedBox(
            height: height * 0.05,
          ),
          Text(
            AppStrings.myHome,
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w800),
          ),
          SizedBox(
            height: height * 0.04,
          ),
          ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: width * 0.05),
            shrinkWrap: true,
            separatorBuilder: (context, index) => SizedBox(
              height: height * 0.02,
            ),
            itemCount: addNewPropertyController.addedProperties.length,
            itemBuilder: (context, index) {
              return _showPropertyCard(width,
                  bath:
                      addNewPropertyController.addedProperties[index].fullBaths,
                  bed: addNewPropertyController.addedProperties[index].bedrooms,
                  sq_feet: addNewPropertyController
                      .addedProperties[index].lotSize
                      .toInt(),
                  price: addNewPropertyController
                      .addedProperties[index].monthlyRent
                      .toInt());
            },
            
          ),
          SizedBox(
            height: height * 0.04,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.05),
            child: MyContainerButton(
              color: Color(0xFFF1F2F4),
              widget: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add_box_outlined),
                  SizedBox(
                    width: width * 0.03,
                  ),
                  Text(
                    AppStrings.addNewProperty,
                  )
                ],
              ),
              onTap: () {
                Navigator.pushNamed(context, '/anpAddressPage');
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _showPropertyCard(
    double width, {
    required int bath,
    required int bed,
    required int sq_feet,
    required int price,
  }) {
    return Container(
      height: 109,
      width: width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(width * 0.05),
          border: Border.all(color: Color(0xFFE6E8EC))),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.horizontal(
              left: Radius.circular(width * 0.05),
            ),
            child: Container(
              width: 102,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        AppImages.img,
                      ),
                      fit: BoxFit.cover)),
            ),
          ),
          SizedBox(
            width: width * 0.04,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Primary Appartment',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              Row(
                children: [
                  SvgPicture.asset(AppImages.bath),
                  Padding(
                    padding: EdgeInsets.only(left: 5, right: 15),
                    child: Text(
                      '$bath',
                      style: TextStyle(
                          fontSize: 15.5.sp, color: Color(0xFF777E90)),
                    ),
                  ),
                  SvgPicture.asset(AppImages.bed),
                  Padding(
                    padding: EdgeInsets.only(left: 5, right: 15),
                    child: Text(
                      "$bed",
                      style: TextStyle(
                          fontSize: 15.5.sp, color: Color(0xFF777E90)),
                    ),
                  ),
                  SvgPicture.asset(AppImages.sq_feet),
                  Padding(
                    padding: EdgeInsets.only(left: 5, right: 15),
                    child: Text(
                      "$sq_feet Ft",
                      style: TextStyle(
                          fontSize: 15.5.sp, color: Color(0xFF777E90)),
                    ),
                  ),
                ],
              ),
              Text(
                "\$$price - \$${price + 200}",
                style: TextStyle(
                    fontSize: 16.5.sp,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF2FA2B9)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
