import 'package:flutter/material.dart';
import 'package:realix_real_estate_app/commons/app_strings.dart';
import 'package:realix_real_estate_app/widgets/my_container_button.dart';
import 'package:realix_real_estate_app/widgets/page_heading_row.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFFFCFCFD),
      body: Column(
        children: [
          SizedBox(
            height: height * 0.04,
          ),
          PageHeadingRow(pageHeadingText: AppStrings.myHome),
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
          )
        ],
      ),
    );
  }
}
