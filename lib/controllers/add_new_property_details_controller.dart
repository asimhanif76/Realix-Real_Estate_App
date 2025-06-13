import 'package:get/get.dart';

class AddNewPropertyDetailsController extends GetxController {
  RxDouble estimatePrice = 4200.00.obs;
  RxDouble estimatePricePercent = (-4.0).obs;

  RxInt saleActivity = 1.obs;
  RxDouble saleActivityPercent = (102.6).obs;

  RxDouble averagePrice = 4200.00.obs;
  RxDouble averagePricePercent = (23.6).obs;

  RxBool isOneYear = true.obs;
}
