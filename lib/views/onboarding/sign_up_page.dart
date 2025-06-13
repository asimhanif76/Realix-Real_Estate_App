import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realix_real_estate_app/commons/app_strings.dart';
import 'package:realix_real_estate_app/controllers/login_page_controller.dart';
import 'package:realix_real_estate_app/widgets/my_container_button.dart';
import 'package:realix_real_estate_app/widgets/my_text_field.dart';
import 'package:realix_real_estate_app/widgets/sign_up_with_social_acc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  LoginPageController loginPageController = Get.put(LoginPageController());

  // SignUpPageController signUpPageController = Get.put(SignUpPageController());

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFFFDFDFD),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: height * 0.09,
              ),
              _pageTitle(context),
              SizedBox(
                height: height * 0.05,
              ),
              MyTextField(
                labelText: AppStrings.fullName,
                controller: loginPageController.signUpNameController,
              ),
              MyTextField(
                  labelText: AppStrings.phoneNumber,
                  keyBoardType: TextInputType.phone,
                  controller: loginPageController.signUpPhoneNumController),
              MyTextField(
                  labelText: AppStrings.password,
                  controller: loginPageController.signUpPasswordController),
              SizedBox(
                height: height * 0.01,
              ),
              MyContainerButton(
                  onTap: () {
                    loginPageController.addNewUser(context);
                  },
                  color: Colors.black,
                  widget: Text(
                    AppStrings.signUp,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  )),
              SizedBox(
                height: height * 0.015,
              ),
              Text(
                AppStrings.forgotPassword,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Color(0xFF777E90)),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              SignUpWithSocialAcc(
                onTapGoogle: () {},
                onTapFacebook: () {},
              ),
              SizedBox(
                height: height * 0.015,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.alreadyHaveAcc,
                    style: TextStyle(
                      color: Color(0xFF777E90),
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(width: width * 0.01),
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Text(
                      AppStrings.signIn,
                      style: TextStyle(
                        color: Color(0xFF2FA2B9),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _pageTitle(context) {
    var height = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Container(
          alignment: Alignment.bottomLeft,
          child: RichText(
            text: TextSpan(
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w800,
              ),
              children: [
                TextSpan(
                  text: AppStrings.createA,
                  style: TextStyle(color: Colors.black),
                ),
                TextSpan(
                  text: AppStrings.realix,
                  style: TextStyle(color: Color(0xFF2FA2B9)),
                ),
                TextSpan(
                  text: AppStrings.account,
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: height * 0.01,
        ),
        Container(
          alignment: Alignment.bottomLeft,
          child: Text(
            AppStrings.signInToAccount,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
