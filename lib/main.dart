import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:realix_real_estate_app/Routes/app_routes.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return GetMaterialApp(
          initialRoute: AppRoutes.splashPage,
          routes: AppRoutes.routes,
          debugShowCheckedModeBanner: false,
          // home: SplashPage(),
        );
      },
    );
  }
}
