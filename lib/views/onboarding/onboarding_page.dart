import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realix_real_estate_app/commons/app_strings.dart';
import 'package:realix_real_estate_app/controllers/onboarding_page_controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatelessWidget {
  OnboardingPage({super.key});

  OnboardingPageController controller = Get.put(OnboardingPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            physics: NeverScrollableScrollPhysics(),
            controller: controller.pageController,
            itemCount: controller.onboardingPages.length,
            onPageChanged: (value) {
              controller.currentIndex.value = value;
            },
            itemBuilder: (context, index) {
              return Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            controller.onboardingPages[index].imagePath),
                        fit: BoxFit.cover)),
              );
            },
          ),
          Positioned(
            bottom: 0,
            child: _stackContainer(context),
          ),
        ],
      ),
    );
  }

  Widget _stackContainer(BuildContext context) {
    return Container(
      height: 35.h,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Text(
              AppStrings.enjoyBeautiful,
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: Colors.white),
            ),
            SizedBox(
              height: 1.5.h,
            ),
            Text(
              AppStrings.loremIpsum,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
            SizedBox(
              height: 6.5.h,
            ),
            SmoothPageIndicator(
              controller: controller.pageController,
              count: controller.onboardingPages.length,
              effect: ExpandingDotsEffect(
                dotColor: Colors.grey,
                activeDotColor: Colors.white,
                dotHeight: 12,
                dotWidth: 12,
                expansionFactor: 3.0,
                spacing: 5,
              ),
              onDotClicked: (index) {
                controller.pageController.animateToPage(index,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut);
              },
            ),
            SizedBox(
              height: 6.5.h,
            ),
            InkWell(
              onTap: () {
                if (controller.pageController.page == 0) {
                  controller.pageController.animateToPage(1,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut);
                } else {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/signInPage',
                    (route) => false,
                  );
                }
              },
              child: Container(
                width: double.infinity,
                height: 7.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xFF2FA2B9)),
                child: Center(
                  child: Text(
                    AppStrings.getStarted,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
