import 'package:flutter/material.dart';
import 'package:realix_real_estate_app/commons/app_images.dart';
import 'package:realix_real_estate_app/commons/app_strings.dart';
import 'package:realix_real_estate_app/widgets/my_container_button.dart';

class SignUpWithSocialAcc extends StatelessWidget {
  VoidCallback onTapGoogle;
  VoidCallback onTapFacebook;

  SignUpWithSocialAcc(
      {super.key, required this.onTapGoogle, required this.onTapFacebook});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Text(
          AppStrings.continueWith,
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: Color(0xFF777E90)),
        ),
        SizedBox(
          height: height * 0.015,
        ),
        MyContainerButton(
            onTap: onTapGoogle,
            color: Colors.white,
            widget: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppImages.google,
                  scale: 2,
                ),
                SizedBox(
                  width: 15,
                ),
                Text(AppStrings.google),
              ],
            )),
        MyContainerButton(
            onTap: onTapFacebook,
            color: Colors.white,
            widget: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppImages.facebook,
                  scale: 2,
                ),
                SizedBox(
                  width: 15,
                ),
                Text(AppStrings.facebook),
              ],
            )),
      ],
    );
  }
}
