import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:realix_real_estate_app/controllers/shedule_tour_controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class VerifyPhoneNumberPage extends StatefulWidget {
  VerifyPhoneNumberPage({super.key});

  @override
  State<VerifyPhoneNumberPage> createState() => _VerifyPhoneNumberPageState();
}

class _VerifyPhoneNumberPageState extends State<VerifyPhoneNumberPage> {
  SheduleTourController sheduleTourController =
      Get.put(SheduleTourController());

  @override
  void dispose() {
    // TODO: implement dispose
    sheduleTourController.isPinComplete.value = false;
    sheduleTourController.otpController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFFFDFDFD),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: height * 0.04,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.05),
            child: InkWell(
              borderRadius: BorderRadius.circular(width * 0.025),
              onTap: () => Get.back(),
              child: Container(
                  width: height * 0.055,
                  height: height * 0.055,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(width * 0.025),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Icon(Icons.arrow_back_ios_new)),
            ),
          ),
          SizedBox(
            height: height * 0.03,
          ),
          Padding(
            padding: EdgeInsets.only(
                bottom: width * 0.04, left: width * 0.05, right: width * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Verify phone number',
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w800),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                        fontSize: 15.5.sp, fontWeight: FontWeight.w600),
                    children: [
                      TextSpan(
                        text: 'We send a code to ( ',
                        style: TextStyle(color: Colors.grey),
                      ),
                      TextSpan(
                        text: '*****783',
                        style: TextStyle(color: Colors.black),
                      ),
                      TextSpan(
                        text: '). Enter it here to verify your identity',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: Pinput(
                length: 5,
                controller: sheduleTourController.otpController,
                keyboardType: TextInputType.number,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                autofocus: true,
                onCompleted: (pin) {
                  sheduleTourController.isPinComplete.value = true;
                },
                disabledPinTheme: PinTheme(
                  height: 60,
                  width: 60,
                  textStyle: TextStyle(fontSize: 20, color: Colors.black),
                  decoration: BoxDecoration(
                    color: Color(0xFFF4F5F6),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                defaultPinTheme: PinTheme(
                  height: 60,
                  width: 60,
                  textStyle: TextStyle(fontSize: 20, color: Colors.black),
                  decoration: BoxDecoration(
                    color: Color(0xFFF4F5F6),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                focusedPinTheme: PinTheme(
                  width: 60,
                  height: 60,
                  textStyle: TextStyle(fontSize: 20, color: Colors.black),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFF2FA2B9)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: height * 0.08,
            alignment: Alignment.bottomCenter,
            child: InkWell(
              onTap: () {
                sheduleTourController.otpController.clear();
              },
              child: Text(
                'Resend Code',
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF2FA2B9)),
              ),
            ),
          ),
          Expanded(
            child: SizedBox(),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(width * 0.05),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              if (sheduleTourController.isPinComplete.value) {
                // Navigator.pushNamed(context, '/selectVirtualAppPage');
                Navigator.pushReplacementNamed(
                    context, '/selectVirtualAppPage');
              }
            },
            borderRadius: BorderRadius.circular(width * 0.05),
            child: Obx(
              () => Ink(
                height: 55,
                decoration: BoxDecoration(
                  color: sheduleTourController.isPinComplete.value
                      ? Color(0xFF0C0D20)
                      : Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(width * 0.05),
                ),
                child: Center(
                  child: Text(
                    'Confirm',
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
        ),
      ),
    );
  }
}
