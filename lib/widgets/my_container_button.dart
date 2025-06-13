import 'package:flutter/material.dart';

class MyContainerButton extends StatelessWidget {
  Color color;
  Widget widget;
  VoidCallback onTap;
  MyContainerButton(
      {super.key,
      required this.color,
      required this.widget,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: width * 0.025),
      child: Material(
        borderRadius: BorderRadius.circular(width * 0.04),
        color: color,
        child: InkWell(
          borderRadius: BorderRadius.circular(width * 0.04),
          onTap: onTap,
          child: Container(
            height: height * 0.07,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xFFE6E8EC)),
              borderRadius: BorderRadius.circular(width * 0.04),
            ),
            child: Center(child: widget),
          ),
        ),
      ),
    );
  }
}
