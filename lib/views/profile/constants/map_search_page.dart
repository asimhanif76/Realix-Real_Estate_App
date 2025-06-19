import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:realix_real_estate_app/commons/app_images.dart';
import 'package:realix_real_estate_app/views/profile/constants/filter_bottom_sheet.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MapSearchPage extends StatelessWidget {
  MapSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30,
          ),
          _customTextField(
            onTapFilter: () {
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
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.05),
            child: Row(
              children: [
                SvgPicture.asset(AppImages.loction_search),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Or use my current location',
                  style: TextStyle(fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
          SizedBox(
            height: width * 0.05,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.05),
            child: Text(
              'Search Results',
              style: TextStyle(fontWeight: FontWeight.w600, color: Colors.grey),
            ),
          ),
          ListTile(
            leading: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppImages.property_image)),
                borderRadius: BorderRadius.circular(width * 0.025),
                color: Colors.amber,
              ),
            ),
            title: Padding(
              padding: EdgeInsets.only(bottom: width * 0.02),
              child: Text(
                'Mighty Cinco Family',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            subtitle: Text(
              '360 Stillwater Rd troutman',
              style: TextStyle(
                fontSize: 14.5.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _customTextField({
    required VoidCallback onTapFilter,
  }) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextField(
                onTap: () {},
                decoration: InputDecoration(
                  hintText: '360 Stillwater Rd...',
                  hintStyle: TextStyle(
                    color: Color(0xFF141416),
                    fontWeight: FontWeight.w300,
                  ),
                  prefixIcon:
                      Icon(Icons.location_on_rounded, color: Color(0xFF353945)),
                  suffixIcon: Icon(Icons.close, color: Colors.black38),
                  contentPadding: EdgeInsets.symmetric(vertical: 14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Color(0xFF2FA2B9)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Color(0xFF2FA2B9)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Color(0xFF2FA2B9)),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          InkWell(
            onTap: onTapFilter,
            child: Container(
              height: 44,
              width: 44,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 3,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Icon(Icons.filter_list, color: Color(0xFF353945)),
            ),
          ),
        ],
      ),
    );
  }
}
