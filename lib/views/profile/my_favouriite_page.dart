import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:realix_real_estate_app/commons/app_images.dart';
import 'package:realix_real_estate_app/widgets/page_heading_row.dart';

class MyFavouriitePage extends StatelessWidget {
  const MyFavouriitePage({super.key});

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
            PageHeadingRow(pageHeadingText: 'Favourites'),
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
                        onTap: () {}),
                    SizedBox(
                      width: 8,
                    ),
                    _filterSortContainer(
                        text: 'Sort', svgPath: AppImages.sort, onTap: () {}),
                  ],
                ),
                Text(
                  '8 Homes',
                  style: TextStyle(fontWeight: FontWeight.w600),
                )
              ],
            )
          ],
        ),
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
