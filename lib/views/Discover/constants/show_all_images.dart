import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realix_real_estate_app/controllers/home_page_controller.dart';

class ShowAllImages extends StatelessWidget {
  ShowAllImages({super.key});

  HomePageController homePageController = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final int index = args['index'];

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: GridView.builder(
        itemCount: homePageController.ProductList[index].imagePath.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, imageIndex) {
          return Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(homePageController
                        .ProductList[index].imagePath[imageIndex]))),
          );
        },
      ),
    );
  }
}
