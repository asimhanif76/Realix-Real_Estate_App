import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realix_real_estate_app/model/login_model.dart';
import 'package:realix_real_estate_app/views/root_page.dart';

class LoginPageController extends GetxController {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  //SignUp Page Fields
  TextEditingController signUpNameController = TextEditingController();
  TextEditingController signUpPhoneNumController = TextEditingController();
  TextEditingController signUpPasswordController = TextEditingController();

  List<LoginModel> LoginUsers = [
    LoginModel(name: 'Asim', phonrNumber: '', password: ''),
    LoginModel(name: 'Asim', phonrNumber: '03001234567', password: '123456'),
    LoginModel(name: 'Asim', phonrNumber: '03001234560', password: '000000'),
    LoginModel(name: 'Asim', phonrNumber: '03001234561', password: '111111'),
  ];

  void tapOnSignUp(BuildContext context) {
    final phone = phoneController.text;
    final password = passwordController.text;

    final isUserFound = LoginUsers.any(
        (user) => user.phonrNumber == phone && user.password == password);

    print('User Foound?  $isUserFound');

    if (isUserFound) {
      // Get.to(RootPage());
      Navigator.pushNamedAndRemoveUntil(
        context,
        '/rootPage',
        (route) => false,
      );

      phoneController.clear();
      passwordController.clear();
    } else {
      Get.snackbar(
        'Login Failed',
        'User Not Found',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.redAccent,
        colorText: Colors.black,
        margin: EdgeInsets.all(10),
        duration: Duration(seconds: 2),
      );
    }
  }

  void addNewUser(context) {
    final name = signUpNameController.text;
    final phone = signUpPhoneNumController.text;
    final password = signUpPasswordController.text;

    if (name.isNotEmpty && phone.length > 10 && password.length >= 6) {
      LoginUsers.add(
        LoginModel(name: name, phonrNumber: phone, password: password),
      );

      Get.snackbar(
        'User Added',
        '$name has been added successfully!',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      Navigator.pop(context);
      // Optionally clear the text fields
      signUpNameController.clear();
      signUpPhoneNumController.clear();
      signUpPasswordController.clear();
    } else {
      Get.snackbar(
        'Error',
        name.isEmpty
            ? 'Please fill all fields'
            : phone.length < 11
                ? "Phone Number is not correct"
                : password.length < 6
                    ? 'Password is weak'
                    : 'Information is Incorrect',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    }
  }
}
