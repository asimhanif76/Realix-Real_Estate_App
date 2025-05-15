import 'package:flutter/material.dart';
import 'package:realix_real_estate_app/widgets/page_heading_row.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFFFDFDFD),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        child: Column(
          children: [
            SizedBox(
              height: height * 0.05,
            ),
            PageHeadingRow(pageHeadingText: 'Message'),
            ListTile(
                contentPadding: EdgeInsets.all(0),
                leading: Stack(
                  children: [
                    CircleAvatar(
                      radius: 20.sp,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: width * 0.04,
                        height: width * 0.04,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.white, width: width * 0.005),
                            color: Colors.green,
                            shape: BoxShape.circle),
                      ),
                    ),
                  ],
                ),
                title: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Message Name',
                          style: TextStyle(
                            fontSize: 16.5.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          'data',
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey),
                        )
                      ],
                    ),
                    SizedBox(
                      height: height * 0.015,
                    ),
                  ],
                ),
                subtitle: Text(
                  'Message content',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
