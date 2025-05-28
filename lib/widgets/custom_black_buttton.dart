import 'package:flutter/material.dart';
import 'package:realix_real_estate_app/widgets/my_container_button.dart';

class CustomBlackButtton extends StatelessWidget {
  String buttonName;
  VoidCallback onTap;
  CustomBlackButtton({super.key,required this.buttonName,required this.onTap});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            offset: Offset(0, -2), // upward shadow
            blurRadius: 5,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.05, vertical: width * 0.025),
          child: MyContainerButton(
            color: Color(0xFF111827),
            widget: Text(
              buttonName,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
            onTap: onTap,
          )),
    );
  }
}
