import 'package:flutter/material.dart';

class CustomBlackButtton extends StatelessWidget {
  final String buttonName;
  final VoidCallback onTap;

  CustomBlackButtton({
    super.key,
    required this.buttonName,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, -4),
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.04, vertical: width * 0.045),
      child: Material(
        color: Colors.transparent, // Needed for ripple effect
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(width * 0.05),
          child: Ink(
            height: width * 0.14,
            decoration: BoxDecoration(
              color: Color(0xFF0C0D20),
              borderRadius: BorderRadius.circular(width * 0.05),
            ),
            child: Center(
              child: Text(
                buttonName,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
