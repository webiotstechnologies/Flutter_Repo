
import 'package:get/get.dart';


class QrController extends GetxController {

  dynamic qrData;

  @override
  void onReady() {
   final data = Get.arguments;
     qrData = data["json"];
     update();
    // TODO: implement onReady
    super.onReady();
  }
}