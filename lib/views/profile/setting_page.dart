import 'package:flutter/material.dart';
import 'package:realix_real_estate_app/widgets/page_heading_row.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFFFDFDFD),
      body: Column(
        children: [
          SizedBox(
            height: height * 0.05,
          ),
          PageHeadingRow(pageHeadingText: 'Settings'),
          SizedBox(
            height: height * 0.05,
          ),
        ],
      ),
    );
  }
}
