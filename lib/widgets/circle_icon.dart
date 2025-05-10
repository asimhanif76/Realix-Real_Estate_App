import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CircleIcon extends StatelessWidget {
  Color fillColor;
  Color borderColor;
  String imagePath;
  CircleIcon(
      {super.key,
      this.fillColor = Colors.transparent,
      this.borderColor = Colors.grey,
      required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25.sp,
      width: 25.sp,
      decoration: BoxDecoration(
          color: fillColor,
          border: Border.all(color: borderColor),
          shape: BoxShape.circle),
      child: SvgPicture.asset(
        imagePath,
        fit: BoxFit.scaleDown,
      ),
    );
  }
}
