import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MyLinearProgressIndicator extends StatelessWidget {
  String indicatorHeading;
  int indicatorValue;
  MyLinearProgressIndicator(
      {super.key,
      required this.indicatorHeading,
      required this.indicatorValue});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                indicatorHeading,
                style:
                    TextStyle(fontSize: 15.5.sp, fontWeight: FontWeight.w600),
              ),
              Container(
                width: width * 0.2,
                height: height * 0.04,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.black,
                ),
                child: Center(
                  child: Text(
                    '${indicatorValue < 10 ? '0' : ''}$indicatorValue / 08',
                    style: TextStyle(
                        fontSize: 15.5.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: width * 0.05,
          ),
          LinearProgressIndicator(
            color: Color(0xFF2FA2B9),
            backgroundColor: Color(0xFFE6E8EC),
            borderRadius: BorderRadius.circular(100),
            value: indicatorValue / 8,
          ),
        ],
      ),
    );
  }
}
