import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realix_real_estate_app/commons/app_strings.dart';
import 'package:realix_real_estate_app/controllers/login_page_controller.dart';
import 'package:realix_real_estate_app/widgets/my_container_button.dart';
import 'package:realix_real_estate_app/widgets/my_text_field.dart';
import 'package:realix_real_estate_app/widgets/sign_up_with_social_acc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  LoginPageController loginPageController = Get.put(LoginPageController());

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFFFDFDFD),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: height * 0.09,
              ),
              _pageTitle(context),
              SizedBox(
                height: height * 0.05,
              ),
              MyTextField(
                controller: loginPageController.phoneController,
                labelText: AppStrings.phoneNumber,
                keyBoardType: TextInputType.phone,
              ),
              MyTextField(
                controller: loginPageController.passwordController,
                labelText: AppStrings.password,
                isPasswordField: true,
              ),
              SizedBox(
                height: height * 0.012,
              ),
              MyContainerButton(
                  onTap: () {
                    loginPageController.tapOnSignUp(context);
                  },
                  color: Colors.black,
                  widget: Text(
                    AppStrings.signIn,
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
                height: height * 0.13,
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
                    AppStrings.dontAccount,
                    style: TextStyle(
                      color: Color(0xFF777E90),
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(width: width * 0.01),
                  InkWell(
                    onTap: () => Get.toNamed('/signUpPage'),
                    child: Text(
                      AppStrings.signUp,
                      style: TextStyle(
                        color: Color(0xFF2FA2B9),
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
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
          child: Text(
            AppStrings.welcomeBack,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w800,
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
