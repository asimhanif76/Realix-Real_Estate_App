import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyTextFieldController extends GetxController {
  // RxBool isFocused = true.obs;

  FocusNode focusNode = FocusNode();
  RxBool isFocused = false.obs;

  final isObscure = true.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    focusNode.addListener(
      () {
        isFocused.value = focusNode.hasFocus;
      },
    );
  }

  @override
  void onClose() {
    super.onClose();
    focusNode.dispose();
  }
}
