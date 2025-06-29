import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:realix_real_estate_app/commons/app_images.dart';
import 'package:realix_real_estate_app/controllers/discover_page_controller.dart';
import 'package:realix_real_estate_app/views/home/constants/filter_bottom_sheet.dart';
import 'package:realix_real_estate_app/views/Discover/constants/map_search_page.dart';

class DiscoverPage extends StatelessWidget {
  DiscoverPage({super.key});

  DiscoverPageController discoverPageController =
      Get.put(DiscoverPageController());

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Obx(
            () => Container(
              constraints: BoxConstraints(
                  minHeight: height,
                  maxHeight: height,
                  maxWidth: width,
                  minWidth: width),
              height: height,
              width: width,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(discoverPageController.isSattelite.value
                          ? AppImages.map_image
                          : AppImages.map_satellite_image),
                      fit: BoxFit.fill)),
              child: discoverPageController.isDraw.value
                  ? SizedBox()
                  : Image.asset(
                      AppImages.map_draw,
                      scale: 4,
                    ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            child: Column(
              children: [
                Obx(
                  () => _squareContainer(
                    svgPath: discoverPageController.isSattelite.value
                        ? AppImages.map
                        : AppImages.map_sattelite,
                    name: discoverPageController.isSattelite.value
                        ? 'Sattelite'
                        : "Map",
                    containerColor: discoverPageController.isSattelite.value
                        ? Colors.white
                        : Color(0xFF23262F),
                    textColor: discoverPageController.isSattelite.value
                        ? Color(0xFF777E90)
                        : Colors.white,
                    borderColor: discoverPageController.isSattelite.value
                        ? Color(0xFFFCFCFD)
                        : Color(0xFF2FA2B9),
                    onTap: () {
                      discoverPageController.isSattelite.toggle();
                    },
                  ),
                ),
                Obx(
                  () => _squareContainer(
                    svgPath: discoverPageController.isDraw.value
                        ? AppImages.draw
                        : AppImages.draw_cross,
                    name: 'Draw',
                    containerColor: discoverPageController.isDraw.value
                        ? Colors.white
                        : Color(0xFF23262F),
                    textColor: discoverPageController.isDraw.value
                        ? Color(0xFF777E90)
                        : Colors.white,
                    borderColor: discoverPageController.isDraw.value
                        ? Color(0xFFFCFCFD)
                        : Color(0xFF2FA2B9),
                    onTap: () {
                      discoverPageController.isDraw.toggle();
                    },
                  ),
                ),
                _squareContainer(
                  svgPath: AppImages.nearby,
                  name: 'Nearby',
                  onTap: () {},
                ),
              ],
            ),
          ),
          Positioned(
              top: height * 0.035,
              left: 0,
              right: 0,
              child: _customTextField(
                onTapTextField: () {
                  Get.to(
                    () => MapSearchPage(),
                    transition: Transition.fadeIn,
                    duration: Duration(milliseconds: 500),
                  );
                },
                onTapFilter: () {
                  showModalBottomSheet(
                    context: context,
                    elevation: 10,
                    backgroundColor: Colors.white,
                    isScrollControlled: true,
                    // showDragHandle: true,

                    builder: (context) {
                      return FilterBottomSheet();
                    },
                  );
                },
              ))
        ],
      ),
    );
  }

  Widget _customTextField({
    required VoidCallback onTapFilter,
    required VoidCallback onTapTextField,
  }) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextField(
                onTap: onTapTextField,
                readOnly: true,
                decoration: InputDecoration(
                  hintText: '360 Stillwater Rd...',
                  hintStyle: TextStyle(
                    color: Color(0xFF141416),
                    fontWeight: FontWeight.w300,
                  ),
                  prefixIcon:
                      Icon(Icons.location_on_rounded, color: Color(0xFF353945)),
                  suffixIcon: IconButton(
                      onPressed: () {
                        discoverPageController.searchController.clear();
                      },
                      icon: Icon(Icons.close, color: Colors.black38)),
                  contentPadding: EdgeInsets.symmetric(vertical: 14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          InkWell(
            onTap: onTapFilter,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 22,
              child: Icon(Icons.filter_list, color: Color(0xFF353945)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _squareContainer(
      {required String svgPath,
      required String name,
      VoidCallback? onTap,
      Color containerColor = Colors.white,
      Color textColor = const Color(0xFF777E90),
      Color borderColor = const Color(0xFFFCFCFD)}) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Material(
        color: containerColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: borderColor),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            height: 60,
            width: 60,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset(svgPath),
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: textColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
