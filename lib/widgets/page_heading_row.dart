import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PageHeadingRow extends StatelessWidget {
  String pageHeadingText;
  PageHeadingRow({super.key, required this.pageHeadingText});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 27.sp,
          height: 27.sp,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.shade300),
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
        Text(
          pageHeadingText,
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w800),
        ),
        const SizedBox(
          width: 50,
        ),
      ],
    );
  }
}
