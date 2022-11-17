
import 'package:get/get.dart';


class BarcodeController extends GetxController {

  dynamic barData;

  @override
  void onReady() {
    final data = Get.arguments;
    barData = data["json"];
    update();
    // TODO: implement onReady
    super.onReady();
  }
}