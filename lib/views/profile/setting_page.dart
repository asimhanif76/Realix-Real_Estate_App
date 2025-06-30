import 'package:flutter/material.dart';
import 'package:realix_real_estate_app/widgets/page_heading_row.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

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
            PageHeadingRow(pageHeadingText: 'Settings'),
            SizedBox(
              height: height * 0.04,
            ),
            Text(
              'Application Settings',
              style: TextStyle(
                  fontSize: 15.5.sp,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF777E90)),
            )
          ],
        ),
      ),
    );
  }
   Widget _buildProfileTile(var item, double height,Widget trailing, VoidCallback onTap) {
    return Padding(
      padding: EdgeInsets.only(top: height * 0.01),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(15),
        child: ListTile(
          contentPadding: EdgeInsets.all(0),
         
          title: Text(
            item['title'],
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
          ),
          trailing: trailing
        ),
      ),
    );
  }
}
